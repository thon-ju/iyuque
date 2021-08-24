import 'package:flutter/material.dart';
import 'package:my_yuque/common/common.dart';
import 'package:my_yuque/components/blocs/application_bloc.dart';
import 'package:my_yuque/components/blocs/bloc_provider.dart';
import 'package:my_yuque/net/dio_util.dart';
import 'package:my_yuque/net/http_api.dart';
import 'package:my_yuque/res/strings.dart';
import 'package:my_yuque/util/utils.dart';
import 'package:my_yuque/views/main_doc_page.dart';

class MainWorkPage extends StatefulWidget {

  @override
  MainWorkPageState createState() => MainWorkPageState();
}

class MainWorkPageState extends State<MainWorkPage> with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ApplicationBloc bloc = BlocProvider.of<ApplicationBloc>(context);

    // TODO 刷新知识库列表
    Future<Null> _onRefresh() async {
      // 获取权限
      Map<String, dynamic> formData = {};
      DioUtil().request(Method.get, Api.USER_INFO, data: formData).then((resp){
        List<String> permissions = List();
        for(int i = 0; i < resp.data['permissions'].length; i++){
          permissions.add(resp.data['permissions'][i]);
        }

        print('work page refresh');
        bloc.sendAppEvent(Constant.type_menu_update);
      }).catchError((e){
        if(e != null && Utils.isShowErrorMsg(e.response))
          Utils.showInModalBottomSheet(context, '用户权限加载错误.');
      });
    }

    return Scaffold(
      key: _scaffoldKey,
      body: MainDocPage(labelId: Ids.titleDoc,),
    );
  }
}
