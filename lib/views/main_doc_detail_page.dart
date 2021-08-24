import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:my_yuque/common/common.dart';
import 'package:my_yuque/components/me_app_bar.dart';
import 'package:my_yuque/model/json_data.dart';
import 'package:my_yuque/net/dio_util.dart';
import 'package:my_yuque/net/http_api.dart';
import 'package:my_yuque/res/styles.dart';

class MainDocDetailPage extends StatefulWidget {
  const MainDocDetailPage({this.model, this.editable});
  final Doc model;
  final bool editable;

  @override
  MainDocDetailPageState createState() => MainDocDetailPageState();
}

class MainDocDetailPageState extends State<MainDocDetailPage> {
  ShapeBorder _shape;
  DocDetail detail;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Repo _selectedRepo = SpUtil.getObj(Constant.keyUserRepo, (e){ return Repo.fromJson(e);});

      DioUtil().requestR(Method.get, '${Api.BASE_URL}/repos/${_selectedRepo.namespace}/docs/${widget.model.slug}', data: {}).then((resp){

        setState(() {
          if(mounted){
            detail = DocDetail.fromJson(resp.data['data']);
          }
        });
      });

    });
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: MeAppBar(
        title: const Text('文档详情'),
      ),
      body: SafeArea(
        child: detail!=null? Markdown(
            data: detail?.body
        ):Gaps.empty,
      ),
    );
  }
}
