
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:iyuque/components/me_app_bar.dart';
import 'package:iyuque/db/repo_helper.dart';
import 'package:iyuque/model/json_data.dart';

class MainDocDetailPage extends StatefulWidget {
  const MainDocDetailPage({this.model});
  final Doc model;

  @override
  MainDocDetailPageState createState() => MainDocDetailPageState();
}

class MainDocDetailPageState extends State<MainDocDetailPage> {
  HtmlEditorController controller = HtmlEditorController();
  DocDetail detail;
  String html = '';

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      DocDetail docDetail = await RepoHelper.instance.getDocDetail(widget.model.id);

      setState(() {
        html = '<!DOCTYPE html> <html> '
            '<head><meta charset="utf-8">'
            '<link rel="stylesheet" type="text/css" href="http://editor.yuque.com/ne-editor/lake-content-v1.css">'
            '<style type="text/css">'
            '.lake-content .ne-codeblock{overflow: auto;white-space:pre-wrap;white-space:-moz-pre-wrap;white-space:-pre-wrap;white-space:-o-pre-wrap; word-wrap:break-word; }'
            '</style>'
            '</head>'
            '<body>${docDetail?.body_html}</body>'
            '</html>';
        print(html);
      });

    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = size.height - 80;

    return Scaffold(
      appBar: MeAppBar(
        title: Text(widget.model.title),
      ),
      body: HtmlEditor(
        controller: controller, //required
        htmlToolbarOptions: HtmlToolbarOptions(
          toolbarType: ToolbarType.nativeGrid,
          defaultToolbarButtons: []
        ),
        htmlEditorOptions: HtmlEditorOptions(
          hint: "",
          initialText: html,
        ),
        otherOptions: OtherOptions(
          height: itemHeight,
        ),
      ),
    );
  }
}
