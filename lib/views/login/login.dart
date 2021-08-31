
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_yuque/common/common.dart';
import 'package:my_yuque/common/sp_helper.dart';
import 'package:my_yuque/components/me_app_bar.dart';
import 'package:my_yuque/net/dio_util.dart';
import 'package:my_yuque/net/http_api.dart';
import 'package:my_yuque/res/colors.dart';
import 'package:my_yuque/res/styles.dart';
import 'package:my_yuque/util/utils.dart';
import 'package:my_yuque/views/login/login_oauth.dart';
import 'package:progress_hud/progress_hud.dart';

class LoginPage extends StatefulWidget {
  @override
  State createState() => new LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  ProgressHUD _progressHUD;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String oauthCode;


  @override
  void initState() {
    super.initState();

    _progressHUD = new ProgressHUD(
      backgroundColor: Colors.black12,
      color: Colors.white,
      containerColor: themeColorMap[SpHelper.getThemeColor()],
      borderRadius: 5.0,
      text: '加载中...',
      loading:false,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => _autoLogin());
  }
  _autoLogin(){
    oauthCode = SpUtil.getString(OAuthConfig.keyCode, defValue: Utils.getRandomString(40));
    SpUtil.putString(OAuthConfig.keyCode, oauthCode);
    _login(oauthCode: oauthCode);
  }

  Future _login({oauthCode}) async {
    _progressHUD.state.show();
    Map<String, dynamic> formData = {'client_id': OAuthConfig.clientId, 'code': oauthCode, 'grant_type':'client_code'};
    DioUtil().requestR(Method.post, OAuthConfig.tokenUrl, data: formData).then((resp){
      _progressHUD.state.dismiss();
      Map<String, dynamic> map = resp.data;
      if(map['access_token'].toString().isNotEmpty){
        SpUtil.putString(OAuthConfig.keyToken, map['access_token']);

        DioUtil().requestR(Method.get, Api.USER_INFO, data: formData).then((respUser){
          Map<String, dynamic> userMap = respUser.data;

          SpUtil.putObject(Constant.keyUserInfo, userMap['data']);
          SpUtil.putInt(Constant.keyUserId, userMap['data']['id']);

          Navigator.popAndPushNamed(context, "/home");
        }).catchError((e){
          _progressHUD.state.dismiss();
          Utils.showInModalBottomSheet(context, '获取用户信息失败');
        });

      }else{
        // 登录失败
        Navigator.of(context).pushNamed('/login/oauth');
      }
    }).catchError((e){
      _progressHUD.state.dismiss();
      Navigator.of(context).pushNamed('/login/oauth');
    });
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
          _progressHUD,
        ],
      ),
    );
  }
}
