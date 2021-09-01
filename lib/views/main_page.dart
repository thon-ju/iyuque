import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iyuque/common/common.dart';
import 'package:iyuque/components/blocs/application_bloc.dart';
import 'package:iyuque/components/blocs/bloc_provider.dart';
import 'package:iyuque/db/repo_helper.dart';
import 'package:iyuque/model/json_data.dart';
import 'package:iyuque/net/dio_util.dart';
import 'package:iyuque/net/http_api.dart';
import 'package:iyuque/res/dimens.dart';
import 'package:iyuque/util/theme_utils.dart';
import 'package:iyuque/util/utils.dart';
import 'package:iyuque/views/book/main_book_page.dart';
import 'package:iyuque/views/main_app_bar.dart';
import 'package:iyuque/views/main_recent_page.dart';
import 'package:iyuque/views/me/main_me_page.dart';
import 'package:oktoast/oktoast.dart';

class MainPage extends StatefulWidget {

  @override
  MainPageState createState() => new MainPageState();
}

class MainPageState extends State<MainPage> with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int userId = SpUtil.getInt(Constant.keyUserId);

  List<Widget> _list =  [
    MainBookPage(),
    MainRecentPage(),
    MainMePage()
  ];
  int _currentIndex = 0;
  static List tabData = [
    {'text': '知识库', 'icon': Icon(FontAwesomeIcons.book)},
    {'text': '最近', 'icon': Icon(FontAwesomeIcons.heartbeat)},
    {'text': '我的', 'icon': Icon(FontAwesomeIcons.user)},
  ];

  List<BottomNavigationBarItem> _myTabs = [];

  @override
  void initState() {
    super.initState();
    _initListener();

    for (int i = 0; i < tabData.length; i++) {
      _myTabs.add(BottomNavigationBarItem(
        icon: tabData[i]['icon'],
        label: tabData[i]['text'],
      ));
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Utils.checkVersion(context, true, false);

      _syncData();
    });
  }

  void _initListener() {
    final ApplicationBloc applicationBloc = BlocProvider.of<ApplicationBloc>(context);
    applicationBloc.appEventStream.listen((value) {
      if(value == EventConfig.event_sync_begin){
        _syncData();
      }
    });
  }

  // 更新知识库及文档目录、文档详情
  Future<int> _syncData() async {
    List<Book> books = [];

    int syncStatus = SpUtil.getInt(Constant.status_sync_data, defValue: 0);
    if(syncStatus == 0){
      SpUtil.putInt(Constant.status_sync_data, 1);

      final ApplicationBloc applicationBloc = BlocProvider.of<ApplicationBloc>(context);
      int startTime = DateTime.now().millisecondsSinceEpoch;

      var respBooks = await DioUtil().requestR(Method.get, '${Api.BASE_URL}/users/$userId/repos', data: {});
      books = respBooks.data['data'].map<Book>((e){return Book.fromJson(e);}).toList();
      await RepoHelper.instance.initBooks(books);

      applicationBloc.sendAppEvent(EventConfig.event_sync_book_finish);

      await Future.forEach(books, (book) async {
        var respDocs = await DioUtil().request(Method.get, "${Api.BASE_URL}/repos/${book.id}/docs", data: {});
        List<Doc> docs = respDocs.data['data'].map<Doc>((e){return Doc.fromJson(e);}).toList();
        await RepoHelper.instance.initDocs(book, docs);

        await Future.forEach(docs, (doc) async {
          var respDocDetail = await DioUtil().requestR(Method.get, '${Api.BASE_URL}/repos/${book.namespace}/docs/${doc.slug}', data: {});
          DocDetail docDetail = DocDetail.fromJson(respDocDetail.data['data']);
          await RepoHelper.instance.initDocDetail(book, docDetail);
        });
      });

      if(AppConfig.isDebug){
        print("sync all data time：${DateTime.now().millisecondsSinceEpoch - startTime}");
      }

      applicationBloc.sendAppEvent(EventConfig.event_sync_doc_finish);
      SpUtil.putInt(Constant.status_sync_data, 0);
      showToast('数据同步完成');
    }else{
      showToast('数据正在同步中，请稍后...');
    }

    return books.length;
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _itemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

    return WillPopScope(
        onWillPop: (){
          print('logout');
          SpUtil.putInt(Constant.status_sync_data, 0);
          return Future.value(true);
        },
        child: Scaffold(
          key: _scaffoldKey,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(44),
            child: MainAppBarPage(tabIndex: _currentIndex, tabData: tabData,),
          ),
          body: IndexedStack(
            index: _currentIndex,
            children: _list,
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: ThemeUtils.getBackgroundColor(context),
            items: _myTabs,
            currentIndex: _currentIndex,
            onTap: _itemTapped,
            type: BottomNavigationBarType.fixed,
            elevation: 5.0,
            iconSize: 21.0,
            selectedFontSize: Dimens.font_sp10,
            unselectedFontSize: Dimens.font_sp10,
            selectedItemColor: Theme.of(context).primaryColor,
          ),
      ),
    );
  }
}
