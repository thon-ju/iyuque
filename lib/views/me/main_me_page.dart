import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_yuque/common/common.dart';
import 'package:my_yuque/components/blocs/bloc_provider.dart';
import 'package:my_yuque/components/blocs/main_bloc.dart';
import 'package:my_yuque/components/com_item.dart';
import 'package:my_yuque/model/json_data.dart';
import 'package:my_yuque/model/models.dart';
import 'package:my_yuque/res/colors.dart';
import 'package:my_yuque/res/strings.dart';
import 'package:my_yuque/res/styles.dart';
import 'package:my_yuque/util/navigator_util.dart';
import 'package:my_yuque/util/utils.dart';
import 'package:my_yuque/views/me/about_page.dart';
import 'package:my_yuque/views/me/setting_page.dart';
import 'package:my_yuque/views/me/sync_data_page.dart';

class MainMePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return MainMePageState();
  }
}

class MainMePageState extends State<MainMePage> {
  Map<String, dynamic> userInfo = SpUtil.getObject(Constant.keyUserInfo);
  String userName='', userAccount='';
  Version version = Version();

  @override
  void initState() {
    super.initState();
    setState(() {
      if(userInfo.isNotEmpty){
        userName = userInfo['name'];
        userAccount = '${userInfo['id']}';
      }

    });

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Version _version  =  await Utils.checkVersion(context, false, false);
      setState(() {
        version = _version;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final MainBloc bloc = BlocProvider.of<MainBloc>(context);

    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
              padding: EdgeInsets.only(left: 15),
              height: 150.0,
              alignment: Alignment.centerLeft,
              child: Row(
                children: <Widget>[
                  Container(
                    width: 70,
                    child: Card(
                      color: Theme.of(context).primaryColor,
                      elevation: 0.0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(6.0))),
                      child: Image.asset(
                        Utils.getImgPath('avatar'),
                        width: 60.0,
                        height: 60.0,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Gaps.hGap10,
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          userName,
                          style: TextStyle(color: Colours.text_dark, fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                        Gaps.vGap10,
                        Text(
                          userAccount,
                          style: TextStyle(color: Colours.gray_99, fontSize: 16.0),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(color: Colors.white, border: new Border.all(width: 0.33, color: Colours.divider))
          ),
          Gaps.vGap10,
          ComArrowItem(ComModel(title: '版本检查',
              extra: version.url == null && version.remark == null ? '${version.ver}' : '有新版本${version.ver}，去更新吧',
              icon: FontAwesomeIcons.checkCircle,
              extraStyle: TextStyle(color: (version.url == null && version.remark == null) ? Colors.grey : Colors.red, fontSize: 14.0),
              onTap: (){
                Utils.checkVersion(context, true, true);
              }
          )),
          ComArrowItem(ComModel(title: '数据同步',  icon: FontAwesomeIcons.checkCircle, onTap: (){
            NavigatorUtil.pushPage(context, SyncDataPage(), pageName: Ids.titleMeSyncData);
          })),
          Gaps.vGap10,
          ComArrowItem(ComModel(title: '设置', extra: '', icon: FontAwesomeIcons.cog, onTap: (){
            NavigatorUtil.pushPage(context, SettingPage(), pageName: Ids.titleSetting);
          })),
          Gaps.vGap10,
          ComArrowItem(ComModel(title: '关于', extra: '', icon: FontAwesomeIcons.cog, onTap: (){
            NavigatorUtil.pushPage(context, AboutPage(), pageName: Ids.titleAbout);
          })),
        ],
      ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return null;
  }
}
