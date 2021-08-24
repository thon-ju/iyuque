// Copyright 2016 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
import 'package:flustars/flustars.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:my_yuque/common/common.dart';
import 'package:my_yuque/common/sp_helper.dart';
import 'package:my_yuque/components/me_app_bar.dart';
import 'package:my_yuque/components/widgets.dart';
import 'package:my_yuque/res/colors.dart';

class MessageSearch extends StatefulWidget {
  MessageSearch({this.title, this.initParams});

  final String title;
  final Map<String, dynamic> initParams;

  @override
  MessageSearchState createState() => MessageSearchState();
}

class MessageSearchState extends State<MessageSearch> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final userInfo = SpUtil.getObject(Constant.keyUserInfo);
  final office = SpUtil.getObject(Constant.keyOffice);

  TextEditingController _controllerTitle = new TextEditingController(text: '');

  @override
  void initState() {
    super.initState();
    _controllerTitle.text = widget.initParams['no']??'';
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: MeAppBar(
          title: Text(widget.title),
          actions: <Widget> [
            FlatButton(
                child: Text('确定', style: TextStyle(color: themeColorMap[SpHelper.getThemeColor()])),
                onPressed: () {
                  final FormState form = _formKey.currentState;
                  form.save();

                  Navigator.pop(context, widget.initParams);
                }
            )
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
                name: '公告标题',
                controller: _controllerTitle,
                onSaved: (String value){ widget.initParams['title'] = value; },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
