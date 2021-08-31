import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:my_yuque/components/me_app_bar.dart';
import 'package:my_yuque/components/widgets.dart';
import 'package:my_yuque/db/repo_helper.dart';
import 'package:my_yuque/model/json_data.dart';
import 'package:my_yuque/res/colors.dart';
import 'package:my_yuque/res/styles.dart';
import 'package:my_yuque/views/main_doc_detail_page.dart';


class MainDocPage extends StatefulWidget {
  const MainDocPage({this.model});
  final Book model;

  @override
  MainDocPageState createState() => MainDocPageState();
}

class MainDocPageState extends State<MainDocPage> {
  List<Doc> docs = [];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _initData();
    });
  }

  _initData() async {
    List<Doc> list = await RepoHelper.instance.getDocs(widget.model.id);
    setState(() {
      docs = list;
    });

  }

  Widget buildList(BuildContext context, List<Doc> list) {
    if (ObjectUtil.isEmpty(list)) {
      return new Container(height: 0.0);
    }

    List<Widget> _children = list.map((model){
      return InkWell(
        onTap: () async {
          Navigator.push(context, MaterialPageRoute(builder: (context) =>MainDocDetailPage(model: model)),);
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Gaps.vGap10,
              InputTitle(model.title, showIcon: true,),
              Gaps.vGap10,
            ],
          ),
          decoration: new BoxDecoration(
              color: Colors.white,
              border: new Border.all(width: 0.33, color: Colours.divider)
          ),
        ),
      );

    }).toList();

    List<Widget> children = new List();
    children.addAll(_children);
    return new Column(
      mainAxisSize: MainAxisSize.min,
      children: children,
    );
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: MeAppBar(
        title: Text(widget.model.name??''),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          _initData();
          return null;
        },
        child: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: docs.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () async {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>MainDocDetailPage(model: docs[index])),);
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Gaps.vGap10,
                    InputTitle(docs[index].title, showIcon: true,),
                    Gaps.vGap10,
                  ],
                ),
                decoration: new BoxDecoration(
                    color: Colors.white,
                    border: new Border.all(width: 0.33, color: Colours.divider)
                ),
              ),
            );
          },
        ),
      ),
    );


  }
}
