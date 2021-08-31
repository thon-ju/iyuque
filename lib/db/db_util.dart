
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbUtil{
  static const String databaseName = "my_yuque.db";
  static const String tableBook = "yq_book";
  static const String tableDoc = "yq_doc";
  static const String tableDocDetail = "yq_doc_detail";

  final String dropTableRepo= 'DROP TABLE IF EXISTS $tableBook';
  final String createTableRepo = 'CREATE TABLE $tableBook (custom_id INTEGER PRIMARY KEY AUTOINCREMENT, id INTEGER, type TEXT, slug TEXT, name TEXT, '
      'namespace TEXT, user_id INTEGER, description TEXT, creator_id INTEGER, public INTEGER, likes_count INTEGER, watches_count INTEGER, items_count INTEGER, '
      'created_at TEXT, updated_at TEXT )';

  final String dropTableDoc = "DROP TABLE IF EXISTS $tableDoc";
  final String createTableDoc = 'CREATE TABLE $tableDoc (custom_id INTEGER PRIMARY KEY AUTOINCREMENT, id INTEGER, book_id INTEGER, slug TEXT, title TEXT, '
      'user_id INTEGER, format TEXT, public INTEGER, status INTEGER, likes_count INTEGER, comments_count INTEGER, watches_count INTEGER, '
      'content_updated_at TEXT, created_at TEXT, updated_at TEXT )';

  final String dropTableDocDetail = "DROP TABLE IF EXISTS $tableDocDetail";
  final String createTableDocDetail = 'CREATE TABLE $tableDocDetail (custom_id INTEGER PRIMARY KEY AUTOINCREMENT, id INTEGER, book_id INTEGER, slug TEXT, title TEXT, '
      'user_id INTEGER, format TEXT, body TEXT, body_draft TEXT, body_html TEXT, body_lake TEXT, public INTEGER, status INTEGER, likes_count INTEGER, comments_count INTEGER, watches_count INTEGER, '
      'content_updated_at TEXT, created_at TEXT, updated_at TEXT )';

  Database _db;

  Future<Database> get db async{
    if(_db == null){
      _db = await _initDb();
    }
    return _db;
  }

  _initDb() async{
    String basePath = await getDatabasesPath();
    String path = join(basePath, '$databaseName');

    print("_onCreate db path: $path");

    Database db = await openDatabase(path, version: 1, onCreate: _onCreate, onUpgrade: _onUpgrade);
    return db;

  }

  Future close() async {
    var result = _db.close();
    _db = null;
    return result;
  }

  void _onCreate(Database db, int newVersion) async{
    print("_onCreate newVersion:$newVersion");

    var batch = db.batch();
    batch.execute(dropTableRepo);
    batch.execute(createTableRepo);

    batch.execute(dropTableDoc);
    batch.execute(createTableDoc);

    batch.execute(dropTableDocDetail);
    batch.execute(createTableDocDetail);

    await batch.commit();
  }

  void _onUpgrade(Database db, int oldVersion, int newVersion)async{
    print("_onUpgrade oldVersion:$oldVersion");
    print("_onUpgrade newVersion:$newVersion");

    var batch = db.batch();
    if(oldVersion == 1){

    }

    await batch.commit();

  }
}
