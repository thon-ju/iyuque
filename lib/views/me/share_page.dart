
import 'package:fluintl/fluintl.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:my_yuque/components/me_app_bar.dart';
import 'package:my_yuque/res/strings.dart';
import 'package:my_yuque/res/styles.dart';
import 'package:my_yuque/util/utils.dart';

class SharePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LogUtil.e("SharePage " + ScreenUtil.getInstance().screenWidth.toString());

    return Scaffold(
      appBar: MeAppBar(
        title: new Text(IntlUtil.getString(context, Ids.titleShare)),
      ),
      body: new Container(
        alignment: Alignment.center,
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new Card(
              child: new Container(
                alignment: Alignment.center,
                width: ScreenUtil.getInstance().getWidth(220),
                height: ScreenUtil.getInstance().getWidth(220),
                child: new Image.asset(
                  Utils.getImgPath('qrcode'),
                  width: ScreenUtil.getInstance().getWidth(200),
                  height: ScreenUtil.getInstance().getWidth(200),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Gaps.vGap15,
            new Text(
              '扫描二维码下载',
              style: new TextStyle(color: Colors.white, fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
