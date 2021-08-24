
import 'package:flustars/flustars.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_yuque/common/common.dart';
import 'package:my_yuque/components/me_app_bar.dart';
import 'package:my_yuque/components/my_button.dart';
import 'package:my_yuque/components/text_field.dart';
import 'package:my_yuque/net/dio_util.dart';
import 'package:my_yuque/net/http_api.dart';
import 'package:my_yuque/res/styles.dart';
import 'package:my_yuque/util/toast.dart';
import 'package:my_yuque/util/utils.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  //定义一个controller
  TextEditingController _nameController = TextEditingController();
  TextEditingController _vCodeController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final FocusNode _nodeText1 = FocusNode();
  final FocusNode _nodeText2 = FocusNode();
  final FocusNode _nodeText3 = FocusNode();
  bool _isClick = false;

  @override
  void initState() {
    super.initState();

    //监听输入改变
    _nameController.addListener(_verify);
    _vCodeController.addListener(_verify);
    _passwordController.addListener(_verify);
  }

  void _verify(){
    String name = _nameController.text;
    String vCode = _vCodeController.text;
    String password = _passwordController.text;
    bool isClick = true;
    if (name.isEmpty || name.length < 11) {
      isClick = false;
    }
    if (vCode.isEmpty || vCode.length < 6) {
      isClick = false;
    }
    if (password.isEmpty || password.length < 1) {
      isClick = false;
    }
    if (isClick != _isClick){
      setState(() {
        _isClick = isClick;
      });
    }
  }

  Future _login({data}) async {

    Map<String, dynamic> formData = data;
    DioUtil().requestR(Method.post, Api.LOGIN, data: formData).then((resp){
      Map<String, dynamic> map = resp.data;
      if(map['status']){

        map['loginName'] =  data['account'];
        map['localPwd'] =  Utils.encode64(data['pwd']);
        int userId =  map['result']['id'];

        SpUtil.putObject(Constant.keyUserInfo, map);
        SpUtil.putInt(Constant.keyUserId, userId);
        SpUtil.putString(Constant.keySessionId, map['jsessionid']);

        Navigator.popAndPushNamed(context, "/home");
      }else{
        // 登录失败
        Utils.showInModalBottomSheet(context, '账号或密码错误');
      }
    }).catchError((e){
      Utils.showInModalBottomSheet(context, '网络链接异常，请重试');
    });
  }

  void _register(){
    Toast.show("注册成功，请进行资料认证");
    String name = _nameController.text;
    String password = _passwordController.text;
    _login(data:{'account':name, 'pwd':password});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MeAppBar(
          title: Text("注册"),
        ),
        body: SingleChildScrollView(
          child: _buildBody(),
        )
    );
  }

  _buildBody(){
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Text(
            "开启你的账号",
            style: TextStyles.textBold26,
          ),
          Gaps.vGap15,
          MyTextField(
            key: const Key('phone'),
            focusNode: _nodeText1,
            controller: _nameController,
            maxLength: 11,
            keyboardType: TextInputType.phone,
            hintText: "请输入手机号",
          ),
          Gaps.vGap10,
          MyTextField(
            key: const Key('vcode'),
            focusNode: _nodeText2,
            controller: _vCodeController,
            keyboardType: TextInputType.number,
            getVCode: () async {
              if (_nameController.text.length == 11){
                Toast.show("并没有真正发送哦，直接登录吧！");
                /// 一般可以在这里发送真正的请求，请求成功返回true
                return true;
              }else{
                Toast.show("请输入有效的手机号");
                return false;
              }
            },
            maxLength: 6,
            hintText: "请输入验证码",
          ),
          Gaps.vGap10,
          MyTextField(
            key: const Key('password'),
            keyName: 'password',
            focusNode: _nodeText3,
            isInputPwd: true,
            controller: _passwordController,
            maxLength: 16,
            hintText: "请输入密码",
          ),
          Gaps.vGap10,
          Gaps.vGap15,
          MyButton(
            key: const Key('register'),
            onPressed: _isClick ? _register : null,
            text: "注册",
          )
        ],
      ),
    );
  }
}
