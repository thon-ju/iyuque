import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:my_yuque/common/common.dart';
import 'package:my_yuque/components/widgets.dart';
import 'package:my_yuque/db/repo_helper.dart';
import 'package:my_yuque/model/json_data.dart';
import 'package:my_yuque/res/colors.dart';
import 'package:my_yuque/res/styles.dart';

import 'book/main_doc_detail_page.dart';

class MainRecentPage extends StatefulWidget {

  @override
  MainRecentPageState createState() => MainRecentPageState();
}

class MainRecentPageState extends State<MainRecentPage> with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<Doc> docs = [];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _initData();
    });
  }

  @override
  void dispose() {
    super.dispose();

  }

  _initData() async {
    List<Doc> list = await RepoHelper.instance.getRentDocs(SpUtil.getInt(Constant.keyUserId));
    setState(() {
      docs = list;
    });

  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          _initData();
          return null;
        },
        child: docs==null?Gaps.empty: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: docs?.length,
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
                    Gaps.vGap5,
                    InputTitle(docs[index].title, showIcon: true,),
                    Text('更新于'+DateUtil.formatDateStr(docs[index].updated_at, isUtc: false), style: TextStyles.listExtra,),
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
