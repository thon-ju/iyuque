import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:my_yuque/common/common.dart';
import 'package:my_yuque/components/blocs/application_bloc.dart';
import 'package:my_yuque/components/blocs/bloc_provider.dart';
import 'package:my_yuque/components/list_select.dart';
import 'package:my_yuque/components/me_app_bar.dart';
import 'package:my_yuque/model/json_data.dart';
import 'package:my_yuque/net/dio_util.dart';
import 'package:my_yuque/net/http_api.dart';
import 'package:my_yuque/util/utils.dart';

class MainAppBarPage extends StatefulWidget {
  const MainAppBarPage({Key key, this.tabIndex, this.tabData}) : super(key: key);

  final int tabIndex;
  final List tabData;

  @override
  MainAppBarPageState createState() => MainAppBarPageState();
}

class MainAppBarPageState extends State<MainAppBarPage>{
  List _officeList = List();
  Office _selectedOffice;

  void _selectOffice(BuildContext context) async {
    List<dynamic> offices = await Navigator.push(context, MaterialPageRoute(
          builder: (_context) => ListSelect(
            title: '选择项目',
            selected: _selectedOffice,
            list: _officeList,
            columns: [
              {'field':'name','title':'项目名称'},
            ],
          )
      ),
    );

    if(offices != null && offices[0].id != _selectedOffice.id){

      Map<String, dynamic> formData = {'id': offices[0].id};
      DioUtil().request(Method.get, Api.OFFICE_CHANGE, data: formData).then((resp){
      if(resp.data['code'] == 200){

        if(this.mounted){
          setState(() {
            _selectedOffice = offices[0];
          });

          SpUtil.putObject(Constant.keyOffice, offices[0]);

          SpUtil.remove(Constant.keyPermissions);
          // 获取权限
          Map<String, dynamic> formData = {};
          DioUtil().request(Method.get, Api.USER_INFO, data: formData).then((resp){
            List<String> permissions = resp.data['permissions'].map<String>((e){return e.toString();}).toList();
            SpUtil.putStringList(Constant.keyPermissions, permissions);

          }).catchError((e){
            if(e != null && Utils.isShowErrorMsg(e.response))
              Utils.showInModalBottomSheet(context, '用户权限加载错误.');
          });

          final ApplicationBloc bloc = BlocProvider.of<ApplicationBloc>(context);
          bloc.sendAppEvent(Constant.type_menu_update);
        }

      } else {
        Utils.showInModalBottomSheet(context, '更改项目失败，请重试.');
      }
      }).catchError((e){
        if(e != null && Utils.isShowErrorMsg(e.response))
          Utils.showInModalBottomSheet(context, '网络错误，请重试.');
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _initListener();

    _officeList = SpUtil.getObjList(Constant.keyOffices, (e){ return Office.fromJson(e);});
    _selectedOffice = SpUtil.getObj(Constant.keyOffice, (e){ return Office.fromJson(e);});
  }

  void _initListener() {
    final ApplicationBloc bloc = BlocProvider.of<ApplicationBloc>(context);
    bloc.appEventStream.listen((value) {
      if(value == Constant.type_menu_update){
        print('rebuild appbar');
        if(this.mounted){
          setState(() {
            _selectedOffice = SpUtil.getObj(Constant.keyOffice, (e){ return Office.fromJson(e);});
          });
        }
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    if(widget.tabIndex == 1){
      return MeAppBar(
        title: InkWell(
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              isExpanded: true,
              disabledHint: Text(_selectedOffice.name, textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold
              ),),
            ),
          ),
          onTap: (){_selectOffice(context);},
        ),
        automaticallyImplyLeading: false,
      );
    }else{
      return MeAppBar(
        title: Text(widget.tabData[widget.tabIndex]['text'],),
        automaticallyImplyLeading: false,
        centerTitle: false,
      );
    }
  }
}
