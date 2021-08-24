import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:my_yuque/common/common.dart';
import 'package:my_yuque/components/blocs/application_bloc.dart';
import 'package:my_yuque/components/blocs/bloc_provider.dart';
import 'package:my_yuque/net/dio_util.dart';
import 'package:my_yuque/net/http_api.dart';
import 'package:my_yuque/util/utils.dart';
import 'package:my_yuque/views/main_work_menu_page.dart';

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

    Future<Null> _onRefresh() async {
      // 获取权限
      Map<String, dynamic> formData = {};
      DioUtil().request(Method.get, Api.USER_INFO, data: formData).then((resp){
        List<String> permissions = List();
        for(int i = 0; i < resp.data['permissions'].length; i++){
          permissions.add(resp.data['permissions'][i]);
        }
        SpUtil.remove(Constant.keyPermissions);
        SpUtil.putStringList(Constant.keyPermissions, permissions);

        print('work page refresh');
        bloc.sendAppEvent(Constant.type_menu_update);
      }).catchError((e){
        if(e != null && Utils.isShowErrorMsg(e.response))
          Utils.showInModalBottomSheet(context, '用户权限加载错误.');
      });
    }

    return Scaffold(
      key: _scaffoldKey,
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(15, 12, 15, 5),
              child: SizedBox(
                height: 160.0,
                child: new Stack(
                  children: <Widget>[
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              Utils.getImgPath('cover', format: 'jpg'),
                            ),
                            fit: BoxFit.fill,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                    new Positioned(
                      top: 30.0,
                      left: 16.0,
                      right: 16.0,
                      child: new FittedBox(
                        fit: BoxFit.scaleDown,
                        alignment: Alignment.centerLeft,
                        child: Text('智慧管理 铸精品工程',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: MainWorkMenuPage(),
            ),
          ],
        ),
      ),
    );
  }
}
