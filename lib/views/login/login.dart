
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:my_yuque/common/common.dart';
import 'package:my_yuque/common/sp_helper.dart';
import 'package:my_yuque/components/me_app_bar.dart';
import 'package:my_yuque/components/text_field.dart';
import 'package:my_yuque/net/dio_util.dart';
import 'package:my_yuque/res/colors.dart';
import 'package:my_yuque/res/styles.dart';
import 'package:my_yuque/util/utils.dart';
import 'package:my_yuque/views/login/login_oauth.dart';
import 'package:progress_hud/progress_hud.dart';

import '../../components/my_button.dart';

/// 409回到登录时的上下文
BuildContext globalContext;

class LoginPage extends StatefulWidget {
  @override
  State createState() => new LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  ProgressHUD _progressHUD;
  final FocusNode _nodeText1 = FocusNode();
  final FocusNode _nodeText2 = FocusNode();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _isClick = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String oauthCode;


  @override
  void initState() {
    super.initState();
    globalContext = context;

    _nameController.addListener(_verify);
    _passwordController.addListener(_verify);

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

  void _verify(){
    String name = _nameController.text;
    String password = _passwordController.text;
    bool isClick = true;
    if (name.isEmpty || name.length < 1) {
      isClick = false;
    }
    if (password.isEmpty || password.length < 1) {
      isClick = false;
    }

    /// 状态不一样在刷新，避免重复不必要的setState
    if (isClick != _isClick){
      setState(() {
        _isClick = isClick;
      });
    }
  }

  _autoLogin(){
    oauthCode = SpUtil.getString(OAuthConfig.keyCode, defValue: Utils.getRandomString(40));
    SpUtil.putString(OAuthConfig.keyCode, oauthCode);
    _login(oauthCode: oauthCode);
  }

  _submitLogin(){
    String name = _nameController.text;
    String password = _passwordController.text;

    _autoLogin();
  }

  Future _login({oauthCode}) async {
    _progressHUD.state.show();
    Map<String, dynamic> formData = {'client_id': OAuthConfig.clientId, 'code': oauthCode, 'grant_type':'client_code'};
    DioUtil().requestR(Method.post, OAuthConfig.tokenUrl, data: formData).then((resp){
      _progressHUD.state.dismiss();
      Map<String, dynamic> map = resp.data;
      if(map['access_token'].toString().isNotEmpty){

        SpUtil.putString(OAuthConfig.keyToken, map['access_token']);
        Navigator.popAndPushNamed(context, "/home");

      }else{
        // 登录失败
        Utils.showInModalBottomSheet(context, '认证已失效，需要重新OAuth登录');
      }
    }).catchError((e){
      _progressHUD.state.dismiss();
      Utils.showInModalBottomSheet(context, '网络链接异常，请重试');
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
                const Text(
                  "欢迎登录",
                  style: TextStyles.textBold26,
                ),
                Gaps.vGap15,
                MyTextField(
                  key: const Key('phone'),
                  focusNode: _nodeText1,
                  controller: _nameController,
                  maxLength: 18,
                  hintText: "请输入账号",
                ),
                Gaps.vGap10,
                MyTextField(
                  key: const Key('password'),
                  keyName: 'password',
                  focusNode: _nodeText2,
                  isInputPwd: true,
                  controller: _passwordController,
                  maxLength: 18,
                  hintText: "请输入密码",
                ),
                Gaps.vGap15,
                Gaps.vGap15,
                MyButton(
                  key: const Key('login'),
                  onPressed: _isClick ?(){
                    _submitLogin();
                  }: null,
                  text: "登录",
                ),
                Gaps.vGap10,
                Gaps.vGap10,
                Gaps.vGap15,
                Container(
                    alignment: Alignment.center,
                    child: GestureDetector(
                      child: Text(
                        '使用OAuth方式登录',
                        style: TextStyle(
                            color: Theme.of(context).primaryColor
                        ),
                      ),
                      onTap: (){
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
