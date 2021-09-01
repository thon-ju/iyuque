
import 'package:iyuque/common/common.dart';
import 'package:iyuque/db/db_util.dart';
import 'package:iyuque/model/json_data.dart';
import 'package:sqflite/sqflite.dart';

/// 知识库数据库操作
class RepoHelper{
  DbUtil _dbUtil;

  static final RepoHelper _instance = RepoHelper.init();
  static RepoHelper get instance => _instance;

  RepoHelper.init(){
    _dbUtil = DbUtil();
  }

  Future close() async {
    var result = _dbUtil.close();
    return result;
  }

  /// 同步所有文档库
  Future initBooks(List<Book> books) async {
    ///先删除
    int startTime = DateTime.now().millisecondsSinceEpoch;
    await Future.forEach(books, (book) async {
      await saveBook(book);
    });

    if(AppConfig.isDebug){
      print("initLocalBooks insert count: ${books.length}");
      print("initLocalBooks time：${DateTime.now().millisecondsSinceEpoch - startTime}");
    }
  }

  /// 同步某个文档库所有文档目录
  Future initDocs(Book book, List<Doc> docs) async {
    ///先删除
    var db = await _dbUtil.db;
    int deleteCount = await db.rawDelete("DELETE FROM ${DbUtil.tableDoc} where book_id=${book.id} ");
    await db.rawDelete("DELETE FROM ${DbUtil.tableDocDetail} where book_id=${book.id} ");

    if(AppConfig.isDebug){
      print("initLocalDocs delete count: $deleteCount");
    }

    var batch = db.batch();
    int startTime = DateTime.now().millisecondsSinceEpoch;
    await Future.forEach(docs, (doc){
      doc.book_id = book.id;
      Map map = doc.toJson();
      map.remove("book");
      batch.insert(DbUtil.tableDoc, map);
    });
    batch.commit();

    if(AppConfig.isDebug){
      print("initLocalDocs insert count: ${docs.length}");
      print("initLocalDocs time：${DateTime.now().millisecondsSinceEpoch - startTime}");
    }
  }

  /// 同步某个文档库所有文档目录
  Future initDocDetail(Book book, DocDetail docDetail) async {
    var db = await _dbUtil.db;

    docDetail.book_id = book.id;
    Map map = docDetail.toJson();
    map.remove("book");
    db.insert(DbUtil.tableDocDetail, map);
  }


  /// 查询知识库是否存在
  Future<bool> isBookExist(int id) async{
    var db = await _dbUtil.db;
    int count = Sqflite.firstIntValue(await db.rawQuery("SELECT COUNT(*) FROM ${DbUtil.tableBook} WHERE id=$id"));
    return count > 0;
  }

  /// 保存知识库
  Future<int> saveBook(Book book)async{
    if(book == null){
      return 0;
    }

    var db = await _dbUtil.db;

    bool exist = await isBookExist(book.id);
    if(exist){
      return db.update(DbUtil.tableBook, book.toJson(), where: "id=?", whereArgs: [book.id]);
    }else{
      return db.insert(DbUtil.tableBook, book.toJson());
    }
  }

  /// 获取知识库列表
  Future<List<Book>> getBooks(int userId) async{
    var db = await _dbUtil.db;
    List<Map> maps = await db.rawQuery("SELECT * FROM ${DbUtil.tableBook} where user_id=$userId ");
    if (maps == null || maps.length == 0) {
      return null;
    }

    List<Book> list = [];
    maps.forEach((it){
      list.add(Book.fromJson(it));
    });

    return list;
  }

  /// 获取某个知识库文档列表
  Future<List<Doc>> getDocs(int bookId) async{
    var db = await _dbUtil.db;
    List<Map> maps = await db.rawQuery("SELECT * FROM ${DbUtil.tableDoc} WHERE book_id = $bookId order by updated_at desc");
    if (maps == null || maps.length == 0) {
      return null;
    }

    List<Doc> list = [];
    maps.forEach((it){
      list.add(Doc.fromJson(it));
    });

    return list;
  }

  /// 获取最新的文档列表
  Future<List<Doc>> getRentDocs(int userId) async{
    var db = await _dbUtil.db;
    List<Map> maps = await db.rawQuery("SELECT * FROM ${DbUtil.tableDoc} where user_id=$userId order by updated_at desc limit 20");
    if (maps == null || maps.length == 0) {
      return null;
    }

    List<Doc> list = [];
    maps.forEach((it){
      list.add(Doc.fromJson(it));
    });

    return list;
  }

  /// 获取某个文档详情
  Future<DocDetail> getDocDetail(int docId) async{
    var db = await _dbUtil.db;
    List<Map> maps =  await db.rawQuery("SELECT * FROM ${DbUtil.tableDocDetail} WHERE id = $docId");
    if (maps == null || maps.length == 0) {
      return null;
    }

    return DocDetail.fromJson(maps[0]);
  }
}
