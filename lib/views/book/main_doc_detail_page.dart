
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:my_yuque/components/me_app_bar.dart';
import 'package:my_yuque/db/repo_helper.dart';
import 'package:my_yuque/model/json_data.dart';

class MainDocDetailPage extends StatefulWidget {
  const MainDocDetailPage({this.model});
  final Doc model;

  @override
  MainDocDetailPageState createState() => MainDocDetailPageState();
}

class MainDocDetailPageState extends State<MainDocDetailPage> {
  HtmlEditorController controller = HtmlEditorController();
  DocDetail detail;
  String html = 'Your text here...';

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      DocDetail docDetail = await RepoHelper.instance.getDocDetail(widget.model.id);

      setState(() {
        html = docDetail.body_html;
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
          hint: "Your text here...",
          initialText: html,
        ),
        otherOptions: OtherOptions(
          height: itemHeight,
        ),
      ),
    );
  }
}
