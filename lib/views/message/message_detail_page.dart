import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_yuque/common/sp_helper.dart';
import 'package:my_yuque/components/me_app_bar.dart';
import 'package:my_yuque/components/widgets.dart';
import 'package:my_yuque/model/json_data.dart';
import 'package:my_yuque/net/http_api.dart';
import 'package:my_yuque/res/colors.dart';
import 'package:my_yuque/res/styles.dart';
import 'package:my_yuque/util/utils.dart';

import 'message_edit_page.dart';

class MessageDetailPage extends StatefulWidget {
  const MessageDetailPage({this.model, this.readOnly, this.hideTitle});
  final Message model;
  final bool readOnly;
  final bool hideTitle;

  @override
  MessageDetailPageState createState() => MessageDetailPageState();
}

class MessageDetailPageState extends State<MessageDetailPage> {
  ShapeBorder _shape;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    List<Widget>_buildButtons(){
      List<Widget> list = List();

      Widget divider = Container(height: 20, child: VerticalDivider(width: 2,color: Colors.white));
      list.add(PmsFlutButton(
        child: const Text('编辑'),
        onPressed: () async {
          Map<String, dynamic> result = await Navigator.push(context, MaterialPageRoute(builder: (context) => MessageEditPage(model: widget.model)));
          if(ObjectUtil.isNotEmpty(result) && result['refresh'] == true) {
            Navigator.pop(context, result);
          }
        },
      ));
      list.add(divider);
      list.add(PmsFlutButton(
        child: const Text('删除'),
        onPressed: (){
          Utils.delData(context, Api.MESSAGE_DEL, widget.model.id);
        },
      ));

      return list;
    }

    return Scaffold(
      appBar: widget.hideTitle==true?null:MeAppBar(
        title: const Text('公告详情'),
      ),
      body: Card(
        shape: _shape,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding:EdgeInsets.symmetric(vertical: 10.0),
              child: Center(
                child: Text(widget.model.title??'', style: TextStyles.textBold18,),
              ),
            ),
            Padding(
              padding:EdgeInsets.all(0),
              child: Center(
                child: Text("${widget.model.createdByName} 发布于 ${widget.model.createdDate}", style: TextStyles.listExtra2,),
              ),
            ),
            Divider(),
            Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('        ${widget.model.content??''}', style:TextStyles.textSize16,),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: widget.readOnly==true?Container(width: 0,height: 0,):Container(
        color: themeColorMap[SpHelper.getThemeColor()],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: _buildButtons(),
        ),
      ),
    );
  }
}
