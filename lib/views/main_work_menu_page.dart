import 'package:fluro/fluro.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:my_yuque/common/common.dart';
import 'package:my_yuque/common/sp_helper.dart';
import 'package:my_yuque/components/blocs/application_bloc.dart';
import 'package:my_yuque/components/blocs/bloc_provider.dart';
import 'package:my_yuque/config/application.dart';
import 'package:my_yuque/model/menu_node.dart';
import 'package:my_yuque/res/colors.dart';
import 'package:my_yuque/res/dimens.dart';
import 'package:my_yuque/res/styles.dart';
import 'package:my_yuque/util/utils.dart';

class MainWorkMenuPage extends StatefulWidget {

  @override
  MainWorkMenuPageState createState() => new MainWorkMenuPageState();
}

class MainWorkMenuPageState extends State<MainWorkMenuPage> {

  Color _themeColor = themeColorMap[SpHelper.getThemeColor()];            /// 存储用户id
  List<MenuNode> allMenus = MenuNode.allMenus(); //
  List<Widget> sections = new List();
  int unhandleCount=0;

  @override
  void initState() {
    super.initState();
   _initListener();
  }

  void _initListener() {
    final ApplicationBloc bloc = BlocProvider.of<ApplicationBloc>(context);
    bloc.appEventStream.listen((value) {
      /// type_sys_update更新主题
      if(value == Constant.type_menu_update || value == Constant.type_sys_update){
        print('rebuild menus');
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  Container buildButton(IconData icon, String label, String url) {
    var size = MediaQuery.of(context).size;
    _themeColor = themeColorMap[SpHelper.getThemeColor()];

    return Container(
      width: size.width / 4,
      child: Column(
        children: [
          InkWell(
            child: Container(
              height: 50.0,
              width: 50.0,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(0),
              decoration: new BoxDecoration(
                color: _themeColor,
                borderRadius: new BorderRadius.all(new Radius.circular(14.0)),
              ),
              child: label=='待我审批' && unhandleCount>0?Text('${unhandleCount>9?'9+':unhandleCount}', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),):Icon(icon,size: 20, color: Colors.white,),
            ),
            onTap: () {
              if (url != null && url.isNotEmpty){
                Application.router.navigateTo(context, url, transition: TransitionType.native, transitionDuration: const Duration(milliseconds: 600),);
              }
            },
          ),
          Container(
            height: 25.0,
            width: size.width / 4 - 20,
            alignment: Alignment.topCenter,
            margin: const EdgeInsets.only(top: 2.0),
            child: Text(
              label,
              textAlign: TextAlign.center,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(
                fontSize: Dimens.font_sp12,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSection(String label, List<Widget> functions) {
    final Orientation orientation = MediaQuery.of(context).orientation;
    var size = MediaQuery.of(context).size;
    String _colorKey = SpHelper.getThemeColor();
    if (themeColorMap[_colorKey] != null) _themeColor = themeColorMap[_colorKey];

    final double itemHeight = 80.0;
    final double itemWidth = size.width / 4;

    var h = functions.length % 4 == 0
        ? (functions.length ~/ 4) * itemHeight
        : (functions.length ~/ 4 + 1) * itemHeight;

    return Column(
      children: <Widget>[
        Divider(),
        Container(
          padding: const EdgeInsets.fromLTRB(15, 10, 10, 15),
          child: Row(
            children: [
              Text(label,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    color: _themeColor,
                  )),
            ],
          ),
        ),
        Container(
          height: h,
          child: GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            primary: false,
            crossAxisCount: (orientation == Orientation.portrait) ? 4 : 6,
            mainAxisSpacing: 4.0,
            crossAxisSpacing: 4.0,
            childAspectRatio: itemWidth / itemHeight,
            children: functions.toList(),
          ),
        )
      ],
    );
  }

  //  /**
  //   * allMenus app内置功能
  //   * 两者通过code进行关联
  //   */
  List<Widget> buildSections(List allMenus){
    List<Widget> sections = new List();

    /// 一层模块
    for(MenuNode menuNode in allMenus){
      List<Container> children = new List();
      /// 二层菜单
      for(MenuNode child in menuNode.children){
        children.add(buildButton(child.iconData, child.name, child.link));
      }

      if(children.length>0){
        sections.add(buildSection(menuNode.name, children));
      }
    }

    if(sections.length == 0){
      sections.add(Container(
        color: Colors.white,
        width: double.infinity,
        height: ScreenUtil.getScreenH(context) - 360,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Image.asset(
                Utils.getImgPath("ic_data_empty"),
                width: 60,
                height: 60,
              ),
              Gaps.vGap10,
              Text(
                "无已授权功能～",
                style: TextStyles.listContent2,
              ),
            ],
          ),
        ),
      ));
    }

    return sections;
  }

  @override
  Widget build(BuildContext context) {

    return  Column(
      children: sections,
    );
  }
}
