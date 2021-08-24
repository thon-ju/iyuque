import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:my_yuque/common/common.dart';
import 'package:my_yuque/components/blocs/application_bloc.dart';
import 'package:my_yuque/components/blocs/bloc_provider.dart';
import 'package:my_yuque/components/blocs/main_bloc.dart';
import 'package:my_yuque/components/refresh_scaffold.dart';
import 'package:my_yuque/components/widgets.dart';
import 'package:my_yuque/model/json_data.dart';
import 'package:my_yuque/res/colors.dart';
import 'package:my_yuque/res/styles.dart';
import 'package:my_yuque/util/utils.dart';
import 'package:my_yuque/views/main_doc_detail_page.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:rxdart/rxdart.dart';

Map<String, dynamic> paramsMainDocPage;

class MainDocPage extends StatelessWidget {
  const MainDocPage({Key key, this.labelId}) : super(key: key);
  final String labelId;

  @override
  Widget build(BuildContext context) {
    RefreshController _controller = new RefreshController();
    final MainBloc bloc = BlocProvider.of<MainBloc>(context);
    final ApplicationBloc applicationBloc = BlocProvider.of<ApplicationBloc>(context);

    applicationBloc.appEventStream.listen((value) {
      /// type_sys_update更新主题
      if(value == Constant.type_menu_update || value == Constant.type_sys_update){
        print('rebuild docs');
        bloc.onRefresh(labelId: labelId, params: {});
      }
    });

    bloc.eventStream.listen((event) {
      print(event);

      if (labelId == event.labelId) {
        _controller.sendBack(false, event.status);
      }
    });

    _initParams(){
      paramsMainDocPage ={
        'page': 1,
        'rows': 20,
        'name': '',
        'manageNo': '',
        'type': '',
      };
    }

    LogUtil.e("MainDocPage init......");

    Stream.value(1).delay(new Duration(milliseconds: 500)).listen((_) {
      _initParams();
      bloc.onRefresh(labelId: labelId, params: paramsMainDocPage);
    });

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

    return Scaffold(
      body: StreamBuilder(
          stream: bloc.recDocStream,
          builder: (BuildContext context, AsyncSnapshot<List<Doc>> snapshot) {
            return RefreshScaffold(
                labelId: labelId,
                loadStatus: Utils.getLoadStatus(snapshot.hasError, snapshot.data),
                controller: _controller,
                enablePullUp: true,
                onRefresh: ({bool isReload}){
                  _initParams();
                  return bloc.onRefresh(labelId: labelId, params: paramsMainDocPage);
                },
                onLoadMore: (up){
                  bloc.onLoadMore(labelId: labelId, params: paramsMainDocPage);
                },
                child: ListView(
                  children: <Widget>[
                    buildList(context, snapshot.data)
                  ],
                )
            );
          }
      ),
    );
  }
}
