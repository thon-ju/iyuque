import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:iyuque/common/common.dart';
import 'package:iyuque/components/blocs/application_bloc.dart';
import 'package:iyuque/components/blocs/bloc_provider.dart';
import 'package:iyuque/components/widgets.dart';
import 'package:iyuque/db/repo_helper.dart';
import 'package:iyuque/model/json_data.dart';
import 'package:iyuque/res/colors.dart';
import 'package:iyuque/res/styles.dart';
import 'package:iyuque/util/utils.dart';

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
    _initListener();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _initData();
    });
  }

  @override
  void dispose() {
    super.dispose();

  }

  void _initListener() {
    final ApplicationBloc applicationBloc = BlocProvider.of<ApplicationBloc>(context);
    applicationBloc.appEventStream.listen((value) {
      /// 数据同步完成后刷新
      if(value == EventConfig.event_sync_doc_finish){
        if(AppConfig.isDebug) print('rebuild recent docs');
        _initData();
      }
    });
  }

  _initData() async {
    List<Doc> list = await RepoHelper.instance.getRentDocs(SpUtil.getInt(Constant.keyUserId));
    setState(() {
      docs = list??[];
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
        child: ListView.builder(
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
                    Text('更新于 '+ Utils.getDatetimeSimple(docs[index].updated_at), style: TextStyles.listExtra,),
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
