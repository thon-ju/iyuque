
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:my_yuque/common/common.dart';
import 'package:my_yuque/net/dio_util.dart';
import 'package:my_yuque/net/http_api.dart';
import 'package:my_yuque/util/utils.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// 409回到登录时的上下文
BuildContext globalContext;

class LoginOAuthPage extends StatefulWidget {
  @override
  State createState() => new LoginOAuthPageState();
}

class LoginOAuthPageState extends State<LoginOAuthPage> {
  final Completer<WebViewController> _controller = Completer<WebViewController>();
  final String CLIENT_ID = OAuthConfig.clientId;
  final String CLIENT_SECRET = OAuthConfig.clientSecret;
  final String CODE = SpUtil.getString(OAuthConfig.keyCode);
  final String OAUTH_URL = OAuthConfig.oauthUrl;
  String request_params = "";

  // 轮询获取授权情况
  Timer _timer;

  @override
  void initState() {
    super.initState();

    var timestamp = DateTime.now().millisecondsSinceEpoch;
    String scope = Uri.encodeComponent("doc,repo");
    request_params = 'client_id=$CLIENT_ID&code=$CODE&response_type=code&scope=$scope&timestamp=$timestamp';

    if(AppConfig.isDebug) print(request_params);

    var hmacSha1 = Hmac(sha1, utf8.encode(CLIENT_SECRET)); // HMAC-SHA1
    String sign = Uri.encodeComponent(base64.encode(hmacSha1.convert(utf8.encode(request_params)).bytes));
    request_params += '&sign=$sign';

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
    String oauthCode = SpUtil.getString(OAuthConfig.keyCode, defValue: Utils.getRandomString(40));
    Map<String, dynamic> formData = {'client_id': OAuthConfig.clientId, 'code': oauthCode, 'grant_type':'client_code'};
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
      // We're using a Builder here so we have a context that is below the Scaffold
      // to allow calling Scaffold.of(context) so we can show a snackbar.
      body: Builder(builder: (BuildContext context) {
        return WebView(
          initialUrl: '$OAUTH_URL?$request_params',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
          onProgress: (int progress) {
            print("WebView is loading (progress : $progress%)");
          },
          javascriptChannels: <JavascriptChannel>{
            _toasterJavascriptChannel(context),
          },
          onPageStarted: (String url) {
            print('Page started loading: $url');
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


