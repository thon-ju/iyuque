
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:iyuque/common/common.dart';
import 'package:iyuque/config/oauth_config.dart';
import 'package:iyuque/net/dio_util.dart';
import 'package:iyuque/net/http_api.dart';
import 'package:iyuque/util/utils.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LoginOAuthPage extends StatefulWidget {
  @override
  State createState() => new LoginOAuthPageState();
}

class LoginOAuthPageState extends State<LoginOAuthPage> {
  final Completer<WebViewController> _controller = Completer<WebViewController>();
  final String clientId = OAuthConfig.clientId;
  final String clientSecret = OAuthConfig.clientSecret;
  final String oauthCode = Utils.getRandomString(40);
  final String oauthUrl = OAuthConfig.oauthUrl;
  String requestParams = "";

  // 轮询获取授权情况
  Timer _timer;

  @override
  void initState() {
    super.initState();

    var timestamp = DateTime.now().millisecondsSinceEpoch;
    String scope = Uri.encodeComponent("doc,repo");
    requestParams = 'client_id=$clientId&code=$oauthCode&response_type=code&scope=$scope&timestamp=$timestamp';

    if(AppConfig.isDebug) print(requestParams);

    var hmacSha1 = Hmac(sha1, utf8.encode(clientSecret)); // HMAC-SHA1
    String sign = Uri.encodeComponent(base64.encode(hmacSha1.convert(utf8.encode(requestParams)).bytes));
    requestParams += '&sign=$sign';

    if(AppConfig.isDebug) print(sign);

    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();

    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      _login();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  Future _login() async {
    Map<String, dynamic> formData = {'client_id': clientId, 'code': oauthCode, 'grant_type':'client_code'};
    DioUtil().requestR(Method.post, OAuthConfig.tokenUrl, data: formData).then((resp){
      Map<String, dynamic> map = resp.data;
      if(map['access_token'].toString().isNotEmpty){
        SpUtil.putString(OAuthConfig.keyToken, map['access_token']);

        DioUtil().requestR(Method.get, Api.USER_INFO, data: formData).then((respUser){
          Map<String, dynamic> userMap = respUser.data;

          SpUtil.putObject(Constant.keyUserInfo, userMap['data']);
          SpUtil.putInt(Constant.keyUserId, userMap['data']['id']);

          Navigator.of(context).pushNamedAndRemoveUntil( "/home", (route) => false);
        });

      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OAuth登录语雀'),
      ),
      body: Builder(builder: (BuildContext context) {
        return WebView(
          initialUrl: '$oauthUrl?$requestParams',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);

            webViewController.clearCache();
            final cookieManager = CookieManager();
            cookieManager.clearCookies();
          },
          onProgress: (int progress) {
            print("WebView is loading (progress : $progress%)");
          },
          javascriptChannels: <JavascriptChannel>{
            _toasterJavascriptChannel(context),
          },
          onPageStarted: (String url) {

          },
          onPageFinished: (String url) {
            print('Page finished loading: $url');
          },
          gestureNavigationEnabled: true,
        );
      }),
    );
  }

  JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: 'Toaster',
        onMessageReceived: (JavascriptMessage message) {
          // ignore: deprecated_member_use
          Scaffold.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        });
  }

}


