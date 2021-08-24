

import 'package:dio/dio.dart';
import 'package:flustars/flustars.dart';
import 'package:my_yuque/common/common.dart';

class AuthInterceptor extends Interceptor{
  @override
  onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    String session = SpUtil.getString(Constant.keySessionId);
    if (session.isNotEmpty){
      options.headers["Cookie"] = "xingcyun.sesssion.id=$session";
    }

    return super.onRequest(options, handler);
  }
}



