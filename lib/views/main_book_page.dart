import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_yuque/components/blocs/application_bloc.dart';
import 'package:my_yuque/components/blocs/bloc_provider.dart';
import 'package:my_yuque/db/repo_helper.dart';
import 'package:my_yuque/model/json_data.dart';
import 'package:my_yuque/views/main_doc_page.dart';

class MainBookPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return MainBookPageState();
  }
}

class MainBookPageState extends State<MainBookPage> {
  ContainerTransitionType _transitionType = ContainerTransitionType.fade;
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
      /// type_sys_update更新主题
      if(value == 4){
        print('rebuild books');
        _loadBooks();
      }
    });
  }

  _loadBooks() async {
    List<Book> list = await RepoHelper.instance.groupBook();
    List<Widget> widgets = [];

    list.forEach((book){
      widgets.add(_OpenContainerWrapper(
        detailPage: MainDocPage(model: book,),
        closedBuilder: (context, openContainer) {
          return _DetailsListTile(
            openContainer: openContainer,
            title: book.name,
            docCount: book.doc_count,
          );
        },
      )) ;
    });

    setState(() {
      books = widgets;
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
  const _DetailsListTile({this.openContainer, this.title, this.docCount});

  final VoidCallback openContainer;
  final String title;
  final int docCount;

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
                      '共${docCount??0}篇',
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

class _DetailsPage extends StatelessWidget {
  const _DetailsPage();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '测试',
        ),
      ),
      body: ListView(
        children: [
          Container(
            color: Colors.black38,
            height: 250,
            child: Padding(
              padding: const EdgeInsets.all(70),
              child: Image.asset(
                'placeholders/placeholder_image.png',
                package: 'flutter_gallery_assets',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '我是测试',
                  style: textTheme.headline5.copyWith(
                    color: Colors.black54,
                    fontSize: 30,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  '我是内容',
                  style: textTheme.bodyText2.copyWith(
                    color: Colors.black54,
                    height: 1.5,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
