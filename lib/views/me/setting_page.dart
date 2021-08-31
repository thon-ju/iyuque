
import 'package:fluintl/fluintl.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_yuque/common/common.dart';
import 'package:my_yuque/common/sp_helper.dart';
import 'package:my_yuque/components/blocs/application_bloc.dart';
import 'package:my_yuque/components/blocs/bloc_provider.dart';
import 'package:my_yuque/components/me_app_bar.dart';
import 'package:my_yuque/model/models.dart';
import 'package:my_yuque/res/colors.dart';
import 'package:my_yuque/res/strings.dart';
import 'package:my_yuque/res/styles.dart';
import 'package:my_yuque/util/navigator_util.dart';
import 'package:my_yuque/util/utils.dart';
import 'package:my_yuque/views/language_page.dart';

class SettingPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    LogUtil.e("SettingPage build......");
    final ApplicationBloc bloc = BlocProvider.of<ApplicationBloc>(context);
    LanguageModel languageModel = SpHelper.getObject<LanguageModel>(Constant.keyLanguage);

    return new Scaffold(
      appBar: MeAppBar(
        title: Text(
          IntlUtil.getString(context, Ids.titleSetting),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Material(
            color: Colors.white,
            child: ExpansionTile(
              title: new Row(
                children: <Widget>[
                  Icon(
                    Icons.color_lens,
                    color: Colours.gray_66,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(
                      IntlUtil.getString(context, Ids.titleTheme),
                    ),
                  )
                ],
              ),
              children: <Widget>[
                Wrap(
                  children: themeColorMap.keys.map((String key) {
                    Color value = themeColorMap[key];
                    return new InkWell(
                      onTap: () {
                        SpUtil.putString(Constant.key_theme_color, key);
                        bloc.sendAppEvent(Constant.event_type_sys_update);
                      },
                      child: new Container(
                        margin: EdgeInsets.all(5.0),
                        width: 36.0,
                        height: 36.0,
                        color: value,
                      ),
                    );
                  }).toList(),
                )
              ],
            ),
          ),
          Divider(height: 1,),
          Material(
            color: Colors.white,
            child: ListTile(
              title: new Row(
                children: <Widget>[
                  Icon(
                    Icons.language,
                    color: Colours.gray_66,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(
                      IntlUtil.getString(context, Ids.titleLanguage),
                    ),
                  )
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                      languageModel == null
                          ? IntlUtil.getString(context, Ids.languageAuto)
                          : IntlUtil.getString(context, languageModel.titleId,
                          languageCode: 'zh', countryCode: 'CH'),
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colours.gray_99,
                      )),
                  Icon(Icons.keyboard_arrow_right)
                ],
              ),
              onTap: () {
                NavigatorUtil.pushPage(context, LanguagePage(), pageName: Ids.titleLanguage);
              },
            ),
          ),
          Gaps.vGap10,
          Material(
            color: Colors.white,
            child: ListTile(
              title: new Row(
                children: <Widget>[
                  Icon(FontAwesomeIcons.signOutAlt, color: Colours.gray_66,),
                  Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text('退出登录'),
                  )
                ],
              ),
              onTap: () {

                Utils.requestLogout(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
