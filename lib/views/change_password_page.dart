import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:my_yuque/common/common.dart';
import 'package:my_yuque/components/me_app_bar.dart';
import 'package:my_yuque/components/widgets.dart';
import 'package:my_yuque/net/dio_util.dart';
import 'package:my_yuque/net/http_api.dart';
import 'package:my_yuque/res/styles.dart';
import 'package:my_yuque/util/utils.dart';
import 'package:oktoast/oktoast.dart';

class ChangePasswordPage extends StatefulWidget {
  ChangePasswordPage({Key key}) : super(key: key);

  @override
  ChangePasswordPageState createState() => ChangePasswordPageState();
}

class ChangePasswordPageState extends State<ChangePasswordPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final userInfo = SpUtil.getObject(Constant.keyUserInfo);
  Map<String, dynamic> param;
  bool _isShowPwd = false;
  bool _isShowComfPwd = false;

  TextEditingController _controllerPlainPassword = TextEditingController(text: '');
  TextEditingController _controllerConfirmPassword = TextEditingController(text: '');

  /// 保存
  void _save(BuildContext context) async {
    FormState form = _formKey.currentState;
    if (!form.validate()) {
      showToast('请按提示填写内容.');
    } else {
      form.save();

      /// 定义待提交的表单
      DioUtil().request(Method.post, Api.USER_PWD_UPDATE, data: param).then((resp){
        if(resp.data['result'] == true){
          showToast('修改密码成功');
          Navigator.pop(context);
        } else {
          showToast(resp.data['msg']);
        }
      }).catchError((e){
        if(e != null && Utils.isShowErrorMsg(e.response))
          showToast(e.toString());
      });
    }
  }

  @override
  void initState() {
    super.initState();
    LogUtil.e('initState');
    param = Map.from({'userId':userInfo['result']['id']});
  }

  @override
  void dispose() {
    super.dispose();
    _controllerPlainPassword.dispose();
    _controllerConfirmPassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    LogUtil.e('build');

    return Scaffold(
      appBar: MeAppBar(
          title: Text('修改密码'),
          actions: <Widget> [
          ]
      ),
      body: SingleChildScrollView(
        dragStartBehavior: DragStartBehavior.down,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          key: _formKey,
          autovalidate: true,
          child: Column(
            children: <Widget>[
              FormInputItem(
                  name:'原密码',
                  initialValue: null,
                  required: true,
                  validator: (v) {
                    return v
                        .trim()
                        .length > 0 ? null : "原密码不能为空";
                  },
                  onSaved: (value){
                    LogUtil.e('password save');
                    param['password'] = value;
                  }
              ),
              Container(
                height: 48.0,
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border(
                      bottom: Divider.createBorderSide(context, width: 0.6),
                    )
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 80.0,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text('新密码*', style: TextStyles.listContent2,),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: TextFormField(
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(vertical: 5),
                                  border: InputBorder.none,
                                  hintText: '请输入',
                                  hintStyle: TextStyles.listContent2,
                                  errorStyle: TextStyle(fontSize: 10)
                              ),
                              style: TextStyles.listContent,
                              obscureText: !_isShowPwd,
                              controller: _controllerPlainPassword,
                              validator: (String value){
                                // 先校验必填
                                if(value == null || value.isEmpty){
                                  return '必填项';
                                }
                                // 再校验自定义规则
                                else {
                                  RegExp exp = new RegExp(r"^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$");
                                  if(!exp.hasMatch(value)){
                                    return '至少8个字符，必须包含字母、数字和特殊字符';
                                  }
                                }
                                return null;
                              },
                              onSaved: (value){
                                LogUtil.e('plainPassword save');
                                param['plainPassword'] = value;
                              },
                            ),
                          ),
                          GestureDetector(
                            child: LoadAssetImage(
                              _isShowPwd ? "login/qyg_shop_icon_hide" : "login/qyg_shop_icon_display",
                              width: 18.0,
                              height: 18.0,
                            ),
                            onTap: (){
                              setState(() {
                                _isShowPwd = !_isShowPwd;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 48.0,
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border(
                      bottom: Divider.createBorderSide(context, width: 0.6),
                    )
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 80.0,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text('重复密码*', style: TextStyles.listContent2,),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: TextFormField(
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(vertical: 5),
                                  border: InputBorder.none,
                                  hintText: '请输入',
                                  hintStyle: TextStyles.listContent2,
                                  errorStyle: TextStyle(fontSize: 10)
                              ),
                              style: TextStyles.listContent,
                              obscureText: !_isShowComfPwd,
                              controller: _controllerConfirmPassword,
                              validator: (String value){
                                if(value != _controllerPlainPassword.text){
                                  return '两次输入不一致';
                                }
                                return null;
                              },
                              onSaved: (value){
                                LogUtil.e('confirmPassword save');
                                param['confirmPassword'] = value;
                              },
                            ),
                          ),
                          GestureDetector(
                            child: LoadAssetImage(
                              _isShowComfPwd ? "login/qyg_shop_icon_hide" : "login/qyg_shop_icon_display",
                              width: 18.0,
                              height: 18.0,
                            ),
                            onTap: (){
                              setState(() {
                                _isShowComfPwd = !_isShowComfPwd;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: new Container(
        color: Theme.of(context).primaryColor,
        child: new FlatButton(
          child: const Text('保存',style:TextStyle(color: Colors.white),),
          onPressed: (){
            _save(context);
          },
        ),
      ),
    );
  }

}
