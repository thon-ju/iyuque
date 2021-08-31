
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_yuque/components/me_app_bar.dart';
import 'package:my_yuque/res/styles.dart';
import 'package:my_yuque/views/login/login_oauth.dart';

class LoginPage extends StatefulWidget {
  @override
  State createState() => new LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: MeAppBar(
        automaticallyImplyLeading: false,
        title: Text('我的语雀'),
      ),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Gaps.vGap15,
                Gaps.vGap15,
                Gaps.vGap15,
                Gaps.vGap15,
                Gaps.vGap15,
                Gaps.vGap10,
                Gaps.vGap15,
                Gaps.vGap15,
                Gaps.vGap10,
                Gaps.vGap10,
                Gaps.vGap15,
                Container(
                    alignment: Alignment.center,
                    child: FloatingActionButton.extended(
                      icon: Icon(FontAwesomeIcons.safari),
                      label: Text(
                        '使用OAuth方式登录',
                      ),
                      onPressed: () async {
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>LoginOAuthPage(),),);
                      },
                    )
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
