
import 'package:fluintl/fluintl.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_yuque/components/me_app_bar.dart';
import 'package:my_yuque/res/colors.dart';
import 'package:my_yuque/res/strings.dart';
import 'package:my_yuque/res/styles.dart';

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
          Gaps.vGap10,
          Material(
            color: Colors.white,
            child: ListTile(
              title: new Row(
                children: <Widget>[
                  Icon(FontAwesomeIcons.signOutAlt, color: Colours.gray_66,),
                  Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text('my_yuque'),
                  )
                ],
              ),
              onTap: () {

              },
            ),
          ),
        ],
      ),
    );
  }
}
