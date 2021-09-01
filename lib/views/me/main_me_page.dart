import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iyuque/common/common.dart';
import 'package:iyuque/components/com_item.dart';
import 'package:iyuque/model/json_data.dart';
import 'package:iyuque/model/models.dart';
import 'package:iyuque/res/colors.dart';
import 'package:iyuque/res/strings.dart';
import 'package:iyuque/res/styles.dart';
import 'package:iyuque/util/navigator_util.dart';
import 'package:iyuque/util/utils.dart';
import 'package:iyuque/views/me/about_page.dart';
import 'package:iyuque/views/me/setting_page.dart';
import 'package:iyuque/views/me/sync_data_page.dart';

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
                    child: ClipOval(
                      child: Image.network(
                        userInfo['avatar_url'],
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
                          style: TextStyles.textBold18,
                        ),
                        Gaps.vGap10,
                        Text(
                          '加入时间 ' +DateUtil.formatDateStr(userInfo['created_at'], isUtc: false, format: DateFormats.y_mo_d),
                          style: TextStyles.listExtra,
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
          ComArrowItem(ComModel(title: '数据同步',  icon: FontAwesomeIcons.database, onTap: (){
            NavigatorUtil.pushPage(context, SyncDataPage(), pageName: Ids.titleMeSyncData);
          })),
          Gaps.vGap10,
          ComArrowItem(ComModel(title: '设置', extra: '', icon: FontAwesomeIcons.cog, onTap: (){
            NavigatorUtil.pushPage(context, SettingPage(), pageName: Ids.titleSetting);
          })),
          ComArrowItem(ComModel(title: '关于', extra: '', icon: FontAwesomeIcons.questionCircle, onTap: (){
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
