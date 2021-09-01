import 'package:animations/animations.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_yuque/common/common.dart';
import 'package:my_yuque/components/blocs/application_bloc.dart';
import 'package:my_yuque/components/blocs/bloc_provider.dart';
import 'package:my_yuque/db/repo_helper.dart';
import 'package:my_yuque/model/json_data.dart';
import 'package:my_yuque/views/book/main_doc_page.dart';

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
            return _DetailsListTile(
              openContainer: openContainer,
              title: book.name,
              itemsCount: book.items_count,
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
    var size = MediaQuery.of(context).size;
    final double itemHeight = 80;
    final double itemWidth = size.width / 2;

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          _loadBooks();
          return null;
        },
        child: GridView.count(
          restorationId: 'grid_view_demo_grid_offset',
          crossAxisCount: 2,
          mainAxisSpacing: 20,
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

class _DetailsListTile extends StatelessWidget {
  const _DetailsListTile({this.openContainer, this.title, this.itemsCount});

  final VoidCallback openContainer;
  final String title;
  final int itemsCount;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    const height = 80.0;

    return SizedBox(
      height: height,
      child: InkWell(
        onTap: openContainer,
        child: Row(
          children: [
            Container(
              color: Colors.black38,
              height: height,
              width: height,
              child: Center(
                child: Icon(FontAwesomeIcons.checkCircle),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title??'',
                      style: textTheme.subtitle1,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      '共${itemsCount??0}篇',
                      style: textTheme.caption,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
