

import 'package:dio/dio.dart';
import 'package:flustars/flustars.dart';
import 'package:iyuque/config/oauth_config.dart';

class AuthInterceptor extends Interceptor{
  @override
  onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    String token = SpUtil.getString(OAuthConfig.keyToken);
    if (token.isNotEmpty){
      options.headers["X-Auth-Token"] = token;
    }

    return super.onRequest(options, handler);
  }
}



