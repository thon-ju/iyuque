// Copyright 2016 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
import 'package:flutter/material.dart';

class MeAppBar  extends StatefulWidget implements PreferredSizeWidget  {
  const MeAppBar({
    Key key,
    this.title,
    this.automaticallyImplyLeading = true,
    this.centerTitle = true,
    this.actions}) : super(key: key);


  final Widget title;
  final bool automaticallyImplyLeading;
  final bool centerTitle;
  final List<Widget> actions;

  @override
  State<StatefulWidget> createState() {
    return MeAppBarState();
  }

  @override
  Size get preferredSize => Size.fromHeight(48.0);
}

class MeAppBarState extends State<MeAppBar>{


  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: widget.automaticallyImplyLeading,
      backgroundColor: Colors.white,
      brightness: Brightness.light,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
      textTheme: TextTheme(
          title: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          )
      ),
      centerTitle: widget.centerTitle,
      title: widget.title,
      actions: widget.actions,
    );
  }

}
