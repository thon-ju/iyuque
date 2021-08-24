import 'package:my_yuque/components/blocs/bloc_provider.dart';
import 'package:rxdart/rxdart.dart';

class ApplicationBloc implements BlocBase {
  BehaviorSubject<int> _appEvent = BehaviorSubject<int>();
  Sink<int> get _appEventSink => _appEvent.sink;
  Stream<int> get appEventStream => _appEvent.stream;

  @override
  void dispose() {
    _appEvent.close();
  }

  @override
  Future getData({String labelId, Map<String, dynamic> params}) {
    return null;
  }

  @override
  Future onLoadMore({String labelId, Map<String, dynamic> params}) {
    return null;
  }

  @override
  Future onRefresh({String labelId, Map<String, dynamic> params}) {
    return null;
  }

  void sendAppEvent(int type) {
    _appEventSink.add(type);
  }
}
