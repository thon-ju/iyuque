// Copyright 2016 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
import 'package:flutter/material.dart';
import 'package:iyuque/common/sp_helper.dart';
import 'package:iyuque/components/me_app_bar.dart';
import 'package:iyuque/res/colors.dart';
/// title:页面标题  selected：选中的节点  list：数据源
class TreeSelect extends StatefulWidget {
  TreeSelect({this.title, this.selected, this.list, this.selectFormatter});
  final dynamic selected;
  final List<dynamic> list;
  final String title;
  final Function<T>(T node) selectFormatter;

  @override
  TreeSelectState createState() => TreeSelectState(title: title, selected: selected, list: list);
}

class TreeSelectState extends State<TreeSelect> {
  TreeSelectState({this.title, this.selected, this.list, this.text});
  List<dynamic> list;
  String title;
  String text;
  dynamic selected;

  int radioValue = 0;

  Widget bulidChidren(dynamic field, dynamic child, int level){
    if(child.children?.length==0){
      return Padding(
        padding: EdgeInsets.fromLTRB(15.0*(level+1), 0, 0, 0),
        child: RadioListTile<dynamic>(
          value: child,
          controlAffinity: ListTileControlAffinity.trailing,
          title: DefaultTextStyle(
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.subtitle,
            child: Text(
                child.text
            ),
          ),
          groupValue: selected,
          onChanged: (dynamic value){
            setState(() {
              selected = value;
            });
          },
        ),
      );
    }

    return ListTileTheme(
      contentPadding: EdgeInsets.only(left: 0, right: 15),
      child: ExpansionTile(
        title: Padding(
          padding: EdgeInsets.fromLTRB(15.0*level, 0, 0, 0),
          child: RadioListTile<dynamic>(
            value: child,
            controlAffinity: ListTileControlAffinity.trailing,
            title: DefaultTextStyle(
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.subtitle,
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      child.text
                  ),
                ),
              ),
            ),
            groupValue: selected,
            onChanged: (dynamic value){
              setState(() {
                selected = value;
              });
            },
          ),
        ),
        initiallyExpanded: level<2?true:false,
        children: child.children.map<Widget>((dynamic child){
          return bulidChidren(field, child, level+1);
        }).toList(),
      ),
    );
  }

  Widget buildTreeList(dynamic field, List<dynamic> list, int level) {
    return ListView.builder(
      itemCount: list != null? list.length : 0,
      itemBuilder: (BuildContext context, int i) {
        return bulidChidren(field, list[i], level);
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: MeAppBar(
          title: Text(title),
          actions: <Widget> [
            FlatButton(
                child: Text('确定', style: TextStyle(color: themeColorMap[SpHelper.getThemeColor()])),
                onPressed: () {
                  if(widget.selectFormatter != null && widget.selectFormatter(selected) == false){
                    return ;
                  } else {
                    Navigator.pop(context, selected);
                  }
                }
            )
          ]
      ),
      body: Form(
          child:buildTreeList(selected, list, 0)
      ),
    );
  }
}
