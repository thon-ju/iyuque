import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_yuque/res/dimens.dart';
import 'package:my_yuque/util/theme_utils.dart';
import 'package:my_yuque/util/utils.dart';
import 'package:my_yuque/views/main_app_bar.dart';
import 'package:my_yuque/views/main_me_page.dart';
import 'package:my_yuque/views/main_work_page.dart';

class MainPage extends StatefulWidget {

  @override
  MainPageState createState() => new MainPageState();
}

class MainPageState extends State<MainPage> with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<Widget> _list =  [
    MainWorkPage(),
    MainMePage()
  ];
  int _currentIndex = 0;
  static List tabData = [
    {'text': '工作台', 'icon': Icon(FontAwesomeIcons.tasks)},
    {'text': '我的', 'icon': Icon(FontAwesomeIcons.user)},
  ];

  List<BottomNavigationBarItem> _myTabs = [];

  @override
  void initState() {
    LogUtil.e("MainPage init......");

    super.initState();

    for (int i = 0; i < tabData.length; i++) {
      _myTabs.add(BottomNavigationBarItem(
        icon: tabData[i]['icon'],
        label: tabData[i]['text'],
      ));
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Utils.checkVersion(context, true, false);
    });
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
