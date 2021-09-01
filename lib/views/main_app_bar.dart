import 'package:flutter/material.dart';
import 'package:iyuque/components/me_app_bar.dart';

class MainAppBarPage extends StatefulWidget {
  const MainAppBarPage({Key key, this.tabIndex, this.tabData}) : super(key: key);

  final int tabIndex;
  final List tabData;

  @override
  MainAppBarPageState createState() => MainAppBarPageState();
}

class MainAppBarPageState extends State<MainAppBarPage>{

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MeAppBar(
      title: Text(widget.tabData[widget.tabIndex]['text'],),
      automaticallyImplyLeading: false,
      centerTitle: true,
    );
  }
}
