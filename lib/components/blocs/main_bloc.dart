import 'package:flustars/flustars.dart';
import 'package:my_yuque/common/common.dart';
import 'package:my_yuque/components/blocs/bloc_provider.dart';
import 'package:my_yuque/event/event.dart';
import 'package:my_yuque/model/json_data.dart';
import 'package:my_yuque/net/dio_util.dart';
import 'package:my_yuque/net/http_api.dart';
import 'package:my_yuque/net/http_utils.dart';
import 'package:my_yuque/res/strings.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:rxdart/rxdart.dart';

class MainBloc implements BlocBase {

  BehaviorSubject<StatusEvent> _event = BehaviorSubject<StatusEvent>();
  Sink<StatusEvent> get _eventSink => _event.sink;
  Stream<StatusEvent> get eventStream => _event.stream.asBroadcastStream();

  ///****** ****** ****** Version ****** ****** ****** /
  BehaviorSubject<Version> _version = BehaviorSubject<Version>();
  Sink<Version> get _versionSink => _version.sink;
  Stream<Version> get versionStream => _version.stream.asBroadcastStream();
  ///****** ****** ****** Version ****** ****** ****** /

  HttpUtils httpUtils = new HttpUtils();

  MainBloc() {
    LogUtil.e("MainBloc......");
  }

  @override
  Future getData({String labelId, Map<String, dynamic> params}) {
    switch (labelId) {
      case Ids.titleMessage:
        break;
      default:
        return Future.delayed(new Duration(seconds: 1));
        break;
    }
  }

  @override
  Future onLoadMore({String labelId, Map<String, dynamic> params }) {
    int _page = 1;
    int _totalPages = 1;
    switch (labelId) {
      case Ids.titleMessage:

        break;
      default:
        break;
    }

    if(_totalPages != null && _page > _totalPages){
      _eventSink.add(new StatusEvent(labelId, RefreshStatus.noMore));
      return Future.delayed(new Duration(seconds: 1));
    }

    return getData(labelId: labelId, params: params);
  }

  @override
  Future onRefresh({String labelId, Map<String, dynamic> params}) {
    switch (labelId) {
      case Ids.titleMessage:
        break;
      default:
        break;
    }

    return getData(labelId: labelId, params: params);
  }

  Future getVersion() async {

    Map<String, dynamic> params= {'ver': AppConfig.version, 'platform':'android', 'code': AppConfig.appName};
    DioUtil().request(Method.get, Api.VERSION_CHECK, data: params).then((resp){
      var result = resp.data['result'];
      if(result){
        Version _versionModel =  Version.fromJson(resp.data['version']);
        _versionSink.add(_versionModel);
      }
    }).catchError((errorMsg){
      LogUtil.e("error check version  msg: $errorMsg");
    });

  }

  void clear(){

  }

  @override
  void dispose() {
    _event.close();
    _version.close();
  }
}
