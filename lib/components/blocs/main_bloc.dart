import 'package:flustars/flustars.dart';
import 'package:iyuque/common/common.dart';
import 'package:iyuque/components/blocs/bloc_provider.dart';
import 'package:iyuque/event/event.dart';
import 'package:iyuque/model/json_data.dart';
import 'package:iyuque/net/dio_util.dart';
import 'package:iyuque/net/http_api.dart';
import 'package:iyuque/net/http_utils.dart';
import 'package:iyuque/res/strings.dart';
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


  BehaviorSubject<List<Doc>> _recDoc = BehaviorSubject<List<Doc>>();
  Sink<List<Doc>> get _recDocSink => _recDoc.sink;
  Stream<List<Doc>> get recDocStream => _recDoc.stream;

  int _docPage = 1;
  List<Doc> _docList = List();


  HttpUtils httpUtils = new HttpUtils();

  MainBloc() {
    LogUtil.e("MainBloc......");
  }

  @override
  Future getData({String labelId, Map<String, dynamic> params}) {
    switch (labelId) {
      case Ids.titleDoc:
        return getRecDoc(labelId, params);
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
      case Ids.titleDoc:
        _page = ++_docPage;
        break;
      default:
        break;
    }

    if(_totalPages != null && _page > _totalPages){
      return Future.delayed(new Duration(seconds: 1));
    }

    return getData(labelId: labelId, params: params);
  }

  @override
  Future onRefresh({String labelId, Map<String, dynamic> params}) {
    switch (labelId) {
      case Ids.titleDoc:
        _docPage = 1;
        break;
      default:
        break;
    }

    return getData(labelId: labelId, params: params);
  }

  Future getRecDoc(String labelId, Map<String, dynamic> params) async {
    params['offset '] = _docPage;

    Book _selectedRepo = SpUtil.getObj(Constant.keyUserRepo, (e){ return Book.fromJson(e);});
    if(_selectedRepo.id >0){
      DioUtil().request(Method.get, '${Api.BASE_URL}/repos/${_selectedRepo.id}/docs', data: {}).then((resp){
        List<Doc> list =  resp.data['data'].map<Doc>((e){return Doc.fromJson(e);}).toList();

        if (_docList == null) {
          _docList = new List();
        }
        if (_docPage == 1) {
          _docList.clear();
        }
        _docList.addAll(list);
        _recDocSink.add(_docList);
      }).catchError((errorMsg){
        LogUtil.e("error labelId: $labelId" + "  msg: $errorMsg");

        _docPage--;
      });
    }
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
    _docList?.clear();
  }

  @override
  void dispose() {
    _event.close();
    _version.close();
    _recDoc.close();
  }
}
