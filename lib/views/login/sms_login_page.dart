
import 'package:flutter/material.dart';
import 'package:my_yuque/components/me_app_bar.dart';
import 'package:my_yuque/components/my_button.dart';
import 'package:my_yuque/components/text_field.dart';
import 'package:my_yuque/res/styles.dart';
import 'package:my_yuque/util/toast.dart';


class SMSLoginPage extends StatefulWidget {
  @override
  _SMSLoginPageState createState() => _SMSLoginPageState();
}

class _SMSLoginPageState extends State<SMSLoginPage> {

  TextEditingController _phoneController = TextEditingController();
  TextEditingController _vCodeController = TextEditingController();
  final FocusNode _nodeText1 = FocusNode();
  final FocusNode _nodeText2 = FocusNode();
  bool _isClick = false;

  @override
  void initState() {
    super.initState();
    _phoneController.addListener(_verify);
    _vCodeController.addListener(_verify);
  }

  void _verify(){
    String name = _phoneController.text;
    String vCode = _vCodeController.text;
    bool isClick = true;
    if (name.isEmpty || name.length < 11) {
      isClick = false;
    }
    if (vCode.isEmpty || vCode.length < 6) {
      isClick = false;
    }
    if (isClick != _isClick){
      setState(() {
        _isClick = isClick;
      });
    }
  }

  void _login(){
    Toast.show("去登录......");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MeAppBar(
          automaticallyImplyLeading: true,
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Gaps.vGap15,
          Gaps.vGap15,
          Gaps.vGap15,
          const Text(
            "验证码登录",
            style: TextStyles.textBold26,
          ),
          Gaps.vGap15,
          MyTextField(
            focusNode: _nodeText1,
            controller: _phoneController,
            maxLength: 11,
            keyboardType: TextInputType.phone,
            hintText: "请输入手机号",
          ),
          Gaps.vGap10,
          MyTextField(
            focusNode: _nodeText2,
            controller: _vCodeController,
            maxLength: 6,
            keyboardType: TextInputType.number,
            hintText: "请输入验证码",
            getVCode: (){
              Toast.show('获取验证码');
              return Future.value(true);
            },
          ),
          Gaps.vGap10,
          Container(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                child: RichText(
                  text: TextSpan(
                    text: '提示：未注册账号的手机号，请先',
                    style: Theme.of(context).textTheme.subtitle.copyWith(fontSize: 14.0),
                    children: <TextSpan>[
                      TextSpan(text: '注册', style: TextStyle(color: Theme.of(context).errorColor)),
                      TextSpan(text: '。'),
                    ],
                  ),
                ),
                onTap: (){

                },
              )
          ),
          Gaps.vGap15,
          Gaps.vGap10,
          MyButton(
            onPressed: _isClick ? _login : null,
            text: "登录",
          ),
          Container(
            height: 40.0,
            alignment: Alignment.centerRight,
            child: GestureDetector(
              child: Text(
                '忘记密码',
                style: Theme.of(context).textTheme.subtitle,
              ),
              onTap: (){

              },
            ),
          )
        ],
      ),
    );
  }
}
