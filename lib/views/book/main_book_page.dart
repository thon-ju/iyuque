import 'package:animations/animations.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iyuque/common/common.dart';
import 'package:iyuque/components/blocs/application_bloc.dart';
import 'package:iyuque/components/blocs/bloc_provider.dart';
import 'package:iyuque/db/repo_helper.dart';
import 'package:iyuque/model/json_data.dart';
import 'package:iyuque/res/colors.dart';
import 'package:iyuque/res/styles.dart';
import 'package:iyuque/util/utils.dart';
import 'package:iyuque/views/book/main_doc_page.dart';
import 'package:oktoast/oktoast.dart';

class MainBookPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return MainBookPageState();
  }
}

class MainBookPageState extends State<MainBookPage> {
  List<Widget> books = [];

  @override
  void initState() {
    super.initState();
    _initListener();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _loadBooks();
    });
  }

  void _initListener() {
    final ApplicationBloc applicationBloc = BlocProvider.of<ApplicationBloc>(context);
    applicationBloc.appEventStream.listen((value) {
      /// 数据同步完成后刷新
      if(value == EventConfig.event_sync_book_finish){
        if(AppConfig.isDebug) print('rebuild books');
        _loadBooks();
      }
    });
  }

  _loadBooks() async {
    List<Book> list = await RepoHelper.instance.getBooks(SpUtil.getInt(Constant.keyUserId));
    List<Widget> widgets = [];

    if(ObjectUtil.isNotEmpty(list)){
      list.forEach((book){
        widgets.add(_OpenContainerWrapper(
          detailPage: MainDocPage(model: book,),
          closedBuilder: (context, openContainer) {
            return ListTile(
              onTap: openContainer,
              onLongPress: (){
                showToast('设置图标');
              },
              leading: Icon(FontAwesomeIcons.crown, color: Theme.of(context).primaryColor, size: 32,),
              title:  Text(
                book.name??'',
              ),
              subtitle: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: Text('共${book.items_count??0}篇', style: TextStyles.textGray12,)
                  ),
                  Expanded(
                      flex: 1,
                      child: Row(
                        children: [
                          Icon(book.public==0?FontAwesomeIcons.lock:FontAwesomeIcons.lockOpen, color: Colours.gray_ce, size: 12,),
                          Text(book.public==0?' 私密':' 公开', style: TextStyles.textGray12,)
                        ],
                      )
                  ),
                  Expanded(
                    flex: 2,
                    child: Text('更新于 ${Utils.getDatetimeSimple(book.updated_at)}', style: TextStyles.textGray12,)
                  ),

                ],
              ),
            );
          },
        )) ;
      });
    }


    setState(() {
      if(mounted){
        books = widgets;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    int displayCols = 1;
    var size = MediaQuery.of(context).size;
    final double itemHeight = 74;
    final double itemWidth = size.width / displayCols;

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          _loadBooks();
          return null;
        },
        child: GridView.count(
          restorationId: 'grid_view_demo_grid_offset',
          crossAxisCount: displayCols,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          padding: const EdgeInsets.all(8),
          childAspectRatio: (itemWidth / itemHeight),
          children: books,
        ),
      ),
    );
  }

}

class _OpenContainerWrapper extends StatelessWidget {
  const _OpenContainerWrapper({this.closedBuilder, this.detailPage});

  final CloseContainerBuilder closedBuilder;
  final Widget detailPage;

  @override
  Widget build(BuildContext context) {
    return OpenContainer<bool>(
      transitionType: ContainerTransitionType.fade,
      openBuilder: (context, openContainer) {
        return detailPage;
      },
      tappable: false,
      closedBuilder: closedBuilder,
    );
  }
}
