import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:my_yuque/common/common.dart';
import 'package:my_yuque/components/me_app_bar.dart';
import 'package:my_yuque/components/widgets.dart';
import 'package:my_yuque/net/dio_util.dart';
import 'package:my_yuque/net/http_api.dart';
import 'package:my_yuque/util/utils.dart';
import 'package:oktoast/oktoast.dart';

class PersonalInfoPage extends StatefulWidget {
  PersonalInfoPage({Key key}) : super(key: key);

  @override
  PersonalInfoPageState createState() => PersonalInfoPageState();
}

class PersonalInfoPageState extends State<PersonalInfoPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final userInfo = SpUtil.getObject(Constant.keyUserInfo);

  TextEditingController _controllerName = TextEditingController(text: '');
  TextEditingController _controllerPhone = TextEditingController(text: '');

  /// 保存
  void _save(BuildContext context) async {
    final FormState form = _formKey.currentState;
    if (!form.validate()) {
      showToast('请按提示填写内容.');
    } else {
      form.save();

      /// 定义待提交的表单
      Map<String, dynamic> formData = Map.from({
        'id':userInfo['result']['id'],
        'loginName':userInfo['result']['loginName'],
        'name':_controllerName.text,
        'phone':_controllerPhone.text,
        'dataType':1,
      });
      DioUtil().request(Method.post, Api.USER_SAVE, data: formData).then((resp){
        showToast('修改成功');
        Map<String, dynamic> info = Map.from(userInfo);
        info['result']['name'] = formData['name'];
        info['result']['phone'] = formData['phone'];
        SpUtil.putObject(Constant.keyUserInfo, info);
        Navigator.pop(context);
      }).catchError((e){
        if(e != null && Utils.isShowErrorMsg(e.response))
          Utils.showInModalBottomSheet(context, e.toString());
      });
    }
  }

  @override
  void initState() {
    super.initState();
    LogUtil.e('initState');

    _controllerName.text = userInfo['result']['name'];
    _controllerPhone.text = userInfo['result']['phone'];

  }

  @override
  void dispose() {
    super.dispose();
    _controllerName.dispose();
    _controllerPhone.dispose();
  }

  @override
  Widget build(BuildContext context) {
    LogUtil.e('build');

    return Scaffold(
      appBar: MeAppBar(
          title: Text('修改个人资料'),
          actions: <Widget> [
          ]
      ),
      body: SingleChildScrollView(
        dragStartBehavior: DragStartBehavior.down,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              FormInputItem(
                name: '登录名',
                readOnly: true,
                initialValue: userInfo['result']['loginName'],
              ),
              FormInputItem(
                name: '姓名',
                required: true,
                controller: _controllerName,
              ),
              FormInputItem(
                name:'手机号',
                onlyNumber: true,
                controller: _controllerPhone,
                validator: (value){
                  RegExp exp = new RegExp(r"^1[3-8]+\d{9}$");
                  if(!exp.hasMatch(value)){
                    return '请输入正确的手机号码';
                  }
                  return null;
                },
                onSaved: (value){
                },
              ),
              FormInputItem(
                name:'所属单位',
                readOnly: true,
                initialValue: userInfo['result']['officeName'],
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
