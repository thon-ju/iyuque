
import 'package:fluintl/fluintl.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iyuque/common/common.dart';
import 'package:iyuque/components/me_app_bar.dart';
import 'package:iyuque/res/colors.dart';
import 'package:iyuque/res/strings.dart';
import 'package:iyuque/res/styles.dart';
import 'package:iyuque/util/navigator_util.dart';
import 'package:iyuque/util/utils.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: MeAppBar(
        title: Text(
          IntlUtil.getString(context, Ids.titleAbout),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Container(
              padding: EdgeInsets.only(left: 15),
              height: 120.0,
              alignment: Alignment.centerLeft,
              child: Row(
                children: <Widget>[
                  Container(
                    child: ClipOval(
                      child: Image.asset(
                        Utils.getImgPath("ic_launcher"),
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
                          'iyuque',
                          style: TextStyles.textBold18,
                        ),
                        Gaps.vGap10,
                        Text(
                          '一个好用的语雀手机客户端',
                          style: TextStyles.listExtra,
                        )
                      ],
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(color: Colors.white, border: new Border.all(width: 0.33, color: Colours.divider))
          ),
          Material(
            color: Colors.white,
            child: ListTile(
              leading: Icon(FontAwesomeIcons.infoCircle, color: Theme.of(context).primaryColor,),
              title: Text('版本', style: TextStyles.listTitle,),
              subtitle: Text(AppConfig.version, style: TextStyles.listExtra),
            ),
          ),
          Material(
            color: Colors.white,
            child: ListTile(
              leading: Icon(FontAwesomeIcons.codepen, color: Theme.of(context).primaryColor,),
              title: Text('源码', style: TextStyles.listTitle,),
              subtitle: Text('星标支持', style: TextStyles.listExtra),
              onTap: (){
                NavigatorUtil.pushWeb(context, title:'GitHub主页', url: 'https://github.com/thon-ju/iyuque');
              },
            ),
          ),
          Gaps.vGap10,
          Material(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Text('作者', style: TextStyles.textBold16,),
            ) ,
          ),
          Material(
            color: Colors.white,
            child: ListTile(
              leading: ClipOval(
                child: Image.network(
                  'https://avatars.githubusercontent.com/u/2316202?v=4',
                  width: 50.0,
                  height: 50.0,
                  fit: BoxFit.contain,
                ),
              ),
              title: Text('thon-ju', style: TextStyles.listTitle,),
              subtitle: Text('Chengdu,China', style: TextStyles.listExtra),
              onTap: (){

              },
            ),
          ),
          Material(
            color: Colors.white,
            child: ListTile(
              leading: Icon(FontAwesomeIcons.github, color: Theme.of(context).primaryColor,),
              title: Text('在GitHub上关注我', style: TextStyles.listTitle,),
              onTap: (){
                NavigatorUtil.pushWeb(context, title:'GitHub主页', url: 'https://github.com/thon-ju');
              },
            ),
          ),
          Material(
            color: Colors.white,
            child: ListTile(
              leading: Icon(FontAwesomeIcons.envelope, color: Theme.of(context).primaryColor,),
              title: Text('邮件', style: TextStyles.listTitle,),
              subtitle: Text('thon.ju@gmail.com', style: TextStyles.listExtra),
              onTap: (){
                  final Uri emailLaunchUri = Uri(
                    scheme: 'mailto',
                    path: 'thon.ju@gmail.com',
                  );
                  launch(emailLaunchUri.toString());
              },
            ),
          ),

        ],
      ),
    );
  }
}
