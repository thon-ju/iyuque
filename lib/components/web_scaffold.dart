import 'package:fluintl/fluintl.dart';
import 'package:flutter/material.dart';
import 'package:my_yuque/util/navigator_util.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebScaffold extends StatefulWidget {
  const WebScaffold({
    Key key,
    this.title,
    this.titleId,
    this.url,
  }) : super(key: key);

  final String title;
  final String titleId;
  final String url;

  @override
  State<StatefulWidget> createState() {
    return new WebScaffoldState();
  }
}

class WebScaffoldState extends State<WebScaffold> {
//  WebViewController _webViewController;
//  bool _isShowFloatBtn = false;

  @override
  void initState() {
    super.initState();
  }

  void _onPopSelected(String value) {
    switch (value) {
      case "browser":
        NavigatorUtil.launchInBrowser(widget.url,
            title: widget.title ?? IntlUtil.getString(context, widget.titleId));
        break;
      case "collection":
        break;

      case "share":
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          widget.title ?? IntlUtil.getString(context, widget.titleId),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        centerTitle: true,
        actions: <Widget>[

        ],
      ),
      body: WebView(
        onWebViewCreated: (WebViewController webViewController) {
          print('webview created');
        },
        initialUrl: widget.url,
        javascriptMode: JavascriptMode.unrestricted,
        onPageFinished: (String url) {
          print('Page finished loading: $url');
        },
      ),
    );
  }

}
