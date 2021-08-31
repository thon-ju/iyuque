import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_yuque/common/common.dart';
import 'package:my_yuque/components/me_app_bar.dart';
import 'package:my_yuque/db/repo_helper.dart';
import 'package:my_yuque/model/json_data.dart';
import 'package:my_yuque/net/dio_util.dart';
import 'package:my_yuque/net/http_api.dart';
import 'package:my_yuque/res/styles.dart';
import 'package:oktoast/oktoast.dart';

class SyncDataPage extends StatefulWidget {
  const SyncDataPage({this.model, this.editable});
  final Doc model;
  final bool editable;

  @override
  SyncDataPageState createState() => SyncDataPageState();
}

class SyncDataPageState extends State<SyncDataPage> {
  int userId = SpUtil.getInt(Constant.keyUserId);

  @override
  void initState() {
    super.initState();

  }

  Future<int> _syncData() async {
    int startTime = DateTime.now().millisecondsSinceEpoch;

    List<Book> books = [];

    var respBooks = await DioUtil().requestR(Method.get, '${Api.BASE_URL}/users/$userId/repos', data: {});
    books = respBooks.data['data'].map<Book>((e){return Book.fromJson(e);}).toList();
    await RepoHelper.instance.initBooks(books);

    books.forEach((book) async {
      var respDocs = await DioUtil().request(Method.get, "${Api.BASE_URL}/repos/${book.id}/docs", data: {});
      List<Doc> docs = respDocs.data['data'].map<Doc>((e){return Doc.fromJson(e);}).toList();
      await RepoHelper.instance.initDocs(book, docs);

      docs.forEach((doc) async {
        var respDocDetail = await DioUtil().requestR(Method.get, '${Api.BASE_URL}/repos/${book.namespace}/docs/${doc.slug}', data: {});
        DocDetail docDetail = DocDetail.fromJson(respDocDetail.data['data']);
        await RepoHelper.instance.initDocDetail(book, docDetail);
      });
    });

    if(AppConfig.isDebug){
      print("sync all data time：${DateTime.now().millisecondsSinceEpoch - startTime}");
    }

    return books.length;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: MeAppBar(
        title: const Text('数据同步'),
        actions: [
          IconButton(
              onPressed: () async{
                int count = await _syncData();
                showToast('同步完成, 更新$count个知识库');
              },
              icon: Icon(FontAwesomeIcons.sync)
          )
        ],
      ),
      body: SafeArea(
        child: Gaps.empty,
      ),
    );
  }
}
