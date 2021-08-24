import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:my_yuque/components/blocs/bloc_provider.dart';
import 'package:my_yuque/components/blocs/main_bloc.dart';
import 'package:my_yuque/components/me_app_bar.dart';
import 'package:my_yuque/components/refresh_scaffold.dart';
import 'package:my_yuque/components/widgets.dart';
import 'package:my_yuque/model/json_data.dart';
import 'package:my_yuque/util/utils.dart';
import 'package:oktoast/oktoast.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:rxdart/rxdart.dart';

import 'message_detail_page.dart';
import 'message_edit_page.dart';
import 'message_search_page.dart';

Map<String, dynamic> paramsMessagePage;

class MessagePage extends StatelessWidget {
  const MessagePage({Key key, this.labelId}) : super(key: key);
  final String labelId;

  @override
  Widget build(BuildContext context) {
    RefreshController _controller = new RefreshController();
    final MainBloc bloc = BlocProvider.of<MainBloc>(context);

    bloc.eventStream.listen((event) {
      if (labelId == event.labelId) {
        _controller.sendBack(false, event.status);
      }
    });

    /// 搜索后重载列表
    void _search() async {
      Map<String, dynamic> reParams  = await Navigator.push(context, MaterialPageRoute(
          builder: (_context) => MessageSearch(title: '公告查询', initParams: paramsMessagePage,),
          fullscreenDialog: true
      ),
      );

      if(ObjectUtil.isNotEmpty(reParams)){
        paramsMessagePage = reParams;
        bloc.onRefresh(labelId: labelId, params: paramsMessagePage);
      }

    }

    void _initParams(){
      String beginDate = DateUtil.formatDate(Utils.getMonthStartDate().subtract(new Duration(days: 90)), format: DateFormats.y_mo_d);
      String endDate = DateUtil.formatDate(Utils.getMonthEndDate(), format: DateFormats.y_mo_d);
      paramsMessagePage = {
        'page': 1,
        'rows': 20,
        'sort':'createdDate',
        'order':'desc',
      };
    }

    LogUtil.e("MessagePage init......");

    Stream.value(1).delay(new Duration(milliseconds: 500)).listen((_) {
      _initParams();
      bloc.onRefresh(labelId: labelId, params: paramsMessagePage);
    });

    Widget buildList(BuildContext context, MyPage<Message> page) {
      if (ObjectUtil.isEmpty(page) || ObjectUtil.isEmpty(page.rows) ) {
        return new Container(height: 0.0);
      }

      List<Widget> _children = page.rows.map((model){
        return MessageItem(model, onTap: () async {
          Map<String, dynamic> result = await Navigator.push(context, new MaterialPageRoute(builder: (context) =>MessageDetailPage(model: model)));
          if(ObjectUtil.isNotEmpty(result) && result['refresh'] == true){
            showToast(result['info']);
            _initParams();
            bloc.onRefresh(labelId: labelId, params: paramsMessagePage);
          }
        });
      }).toList();

      List<Widget> children = new List();
      children.addAll(_children);
      return new Column(
        mainAxisSize: MainAxisSize.min,
        children: children,
      );
    }

    return Scaffold(
      appBar: MeAppBar(
        title: const Text('公告'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){
              _search();
            },
          ),
          IconButton(
            icon: Icon(Icons.add_circle_outline),
            onPressed: () async {
              Map<String, dynamic> result = await Navigator.push(context, MaterialPageRoute(builder: (context) =>MessageEditPage(model: Message())));
              if(ObjectUtil.isNotEmpty(result) && result['refresh'] == true){
                showToast(result['info']);
                _initParams();
                bloc.onRefresh(labelId: labelId, params: paramsMessagePage);
              }
            },
          ),
        ],
      ),
      body: StreamBuilder(
          stream: bloc.recMessageStream,
          builder: (BuildContext context, AsyncSnapshot<MyPage<Message>> snapshot) {
            return RefreshScaffold(
                labelId: labelId,
                loadStatus: Utils.getLoadStatus(snapshot.hasError, snapshot.data),
                controller: _controller,
                enablePullUp: true,
                onRefresh: ({bool isReload}){
                  _initParams();
                  return bloc.onRefresh(labelId: labelId, params: paramsMessagePage);
                },
                onLoadMore: (up){
                  bloc.onLoadMore(labelId: labelId, params: paramsMessagePage);
                },
                child: ListView(
                  children: <Widget>[
                    buildList(context, snapshot.data),
                  ],
                )
            );
          }
      ),
    );
  }
}
