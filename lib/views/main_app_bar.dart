import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:my_yuque/common/common.dart';
import 'package:my_yuque/components/blocs/application_bloc.dart';
import 'package:my_yuque/components/blocs/bloc_provider.dart';
import 'package:my_yuque/components/list_select.dart';
import 'package:my_yuque/components/me_app_bar.dart';
import 'package:my_yuque/db/repo_helper.dart';
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
  List _repoList = List();
  Book _selectedRepo = Book();
  int userId = SpUtil.getInt(Constant.keyUserId);

  void _selectOffice(BuildContext context) async {
    List<dynamic> repos = await Navigator.push(context, MaterialPageRoute(
          builder: (_context) => ListSelect(
            title: '选择知识库',
            selected: _selectedRepo,
            list: _repoList,
            columns: [
              {'field':'name','title':'知识库'},
            ],
          )
      ),
    );

    if(repos != null && repos[0].id != _selectedRepo.id){
      _getDocs(repos[0]);
    }
  }

  @override
  void initState() {
    super.initState();
    _initListener();

    WidgetsBinding.instance.addPostFrameCallback((_) => _getRepos());
  }

  void _initListener() {
    final ApplicationBloc bloc = BlocProvider.of<ApplicationBloc>(context);
    bloc.appEventStream.listen((value) {
      if(value == Constant.type_menu_update){
        print('rebuild appbar');
        if(this.mounted){
          setState(() {
            _selectedRepo = SpUtil.getObj(Constant.keyUserRepo, (e){ return Book.fromJson(e);});
          });
        }
      }
    });
  }

  _getRepos() async {
    List<Book> list = await RepoHelper.instance.getBooks();

    _repoList = list;
    _selectedRepo = list[0];

    SpUtil.putObjectList(Constant.keyUserRepos, _repoList);
    SpUtil.putObject(Constant.keyUserRepo, _selectedRepo);

    _getDocs(_selectedRepo);
  }

  _getDocs(Book selectedRepo){
    // 获取文档列表
    DioUtil().request(Method.get, "${Api.BASE_URL}/repos/${selectedRepo.id}/docs", data: {}).then((resp){
      if(this.mounted){
        setState(() {
          _selectedRepo = selectedRepo;
        });

        SpUtil.putObject(Constant.keyUserRepo, selectedRepo);

        final ApplicationBloc bloc = BlocProvider.of<ApplicationBloc>(context);
        bloc.sendAppEvent(Constant.type_menu_update);
      }
    }).catchError((e){
      if(e != null && Utils.isShowErrorMsg(e.response))
        Utils.showInModalBottomSheet(context, '网络错误，请重试.');
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
              isExpanded: false,
              disabledHint: Text(_selectedRepo.name, textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold
              ),),
            ),
          ),
          onTap: (){_selectOffice(context);},
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      );
    }else{
      return MeAppBar(
        title: Text(widget.tabData[widget.tabIndex]['text'],),
        automaticallyImplyLeading: false,
        centerTitle: true,
      );
    }
  }
}
