import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iyuque/components/widgets.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

typedef void OnLoadMore(bool up);
typedef OnRefreshCallback = Future<void> Function({bool isReload});

class RefreshScaffold extends StatefulWidget {
  const RefreshScaffold(
      {Key key,
        this.labelId,
        this.loadStatus,
        @required this.controller,
        this.enablePullUp: true,
        this.onRefresh,
        this.onLoadMore,
        this.child,
        this.itemCount,
        this.itemBuilder})
      : super(key: key);

  final String labelId;
  final int loadStatus;
  final RefreshController controller;
  final bool enablePullUp;
  final OnRefreshCallback onRefresh;
  final OnLoadMore onLoadMore;
  final Widget child;
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;

  @override
  State<StatefulWidget> createState() {return RefreshScaffoldState();}
}

///   with AutomaticKeepAliveClientMixin
class RefreshScaffoldState extends State<RefreshScaffold>  with AutomaticKeepAliveClientMixin {
  bool isShowFloatBtn = false;
  RefreshController _refreshController = RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        body: Stack(
          children: <Widget>[
            SmartRefresher(
                header: WaterDropHeader(),
                footer: CustomFooter(
                  builder: (BuildContext context,LoadStatus mode){
                    Widget body ;
                    if(mode==LoadStatus.idle){
                      body =  Text("上拉加载");
                    }
                    else if(mode==LoadStatus.loading){
                      body =  CupertinoActivityIndicator();
                    }
                    else if(mode == LoadStatus.failed){
                      body = Text("加载失败！点击重试！");
                    }
                    else if(mode == LoadStatus.canLoading){
                      body = Text("松手,加载更多!");
                    }
                    else{
                      body = Text("没有更多数据了!");
                    }
                    return Container(
                      height: 55.0,
                      child: Center(child:body),
                    );
                  },
                ),
                controller: _refreshController,
                enablePullDown: false,
                enablePullUp: widget.enablePullUp,
                onRefresh: widget.onRefresh,
                child: widget.child ??
                    new ListView.builder(
                      itemCount: widget.itemCount,
                      itemBuilder: widget.itemBuilder,
                    )),
            StatusViews(
              widget.loadStatus,
              onTap: () {
                LogUtil.e("ProgressViews onRefresh......");
                widget.onRefresh(isReload: true);
              },
            ),
          ],
        ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
