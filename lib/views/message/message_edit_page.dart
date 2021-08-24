import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:my_yuque/common/common.dart';
import 'package:my_yuque/components/me_app_bar.dart';
import 'package:my_yuque/components/widgets.dart';
import 'package:my_yuque/model/json_data.dart';
import 'package:my_yuque/net/dio_util.dart';
import 'package:my_yuque/net/http_api.dart';
import 'package:my_yuque/res/styles.dart';
import 'package:my_yuque/util/utils.dart';
import 'package:oktoast/oktoast.dart';

class MessageEditPage extends StatefulWidget {
  MessageEditPage({this.model});
  final Message model;

  @override
  MessageEditPageState createState() => MessageEditPageState();
}

class MessageEditPageState extends State<MessageEditPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Message message = Message();
  final userInfo = SpUtil.getObject(Constant.keyUserInfo);
  final office = SpUtil.getObject(Constant.keyOffice);

  TextEditingController _controllerTitle = TextEditingController(text: '');
  TextEditingController _controllerContent = TextEditingController(text: '');

  /// 保存
  void _save(BuildContext context) async {
    final FormState form = _formKey.currentState;
    if (!form.validate()) {
      showToast('请按提示填写内容.');
    } else {
      form.save();

      /// 定义待提交的表单
      Map<String, dynamic> formData = message.toJson();
      DioUtil().request(Method.post, Api.MESSAGE_SAVE, data: formData).then((resp){
        Map<String, dynamic> map = {'refresh':true, 'info':'保存成功！'};
        Navigator.pop(context, map);
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

    message = widget.model;
    if(message.id == null){

      message.createdBy = userInfo['result']['id'];
      message.createdByName = userInfo['result']['name'];
      message.officeId = office['id'];
      message.officeName = office['name'];
      message.createdDate = DateUtil.formatDate(DateTime.now(), format:DateFormats.full);
    }

    _controllerTitle.text = message.title;
    _controllerContent.text = message.content;

  }

  @override
  void dispose() {
    super.dispose();
    _controllerTitle.dispose();
    _controllerContent.dispose();
  }

  @override
  Widget build(BuildContext context) {
    LogUtil.e('build');

    return Scaffold(
      appBar: MeAppBar(
          title: Text(widget.model.id==null?'新增公告':'编辑公告'),
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
                name:'标题',
                required: true,
                maxLines: 1,
                hintText: '请输入公告标题',
                controller: _controllerTitle,
                onSaved: (value){
                  message.title = value;
                },
              ),
              Gaps.vGap15,
              TextFormField(
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(5),
                    border: const OutlineInputBorder(),
                    hintText: ' 请输入公告内容',
                    hintStyle: TextStyles.listContent2,
                ),
                style: TextStyles.listContent,
                maxLines: 20,
                validator: (String value){
                  if(value == null || value == '') return '请输入公告内容';
                  return null;
                },
                controller: _controllerContent,
                onSaved: (value){
                  message.content = value;
                },
              )
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
