import 'package:flutter/material.dart';
import 'package:iyuque/res/colors.dart';
import 'package:iyuque/res/styles.dart';
import 'package:iyuque/util/utils.dart';



class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({this.onChanged});
  final Function onChanged;

  Widget buildTextField(){
    return Theme(
        data: ThemeData(primaryColor: Colors.grey),
        child: TextField(
          cursorColor: Colors.grey,
          style: TextStyle(fontSize: 16, color:  Colors.black),
          onChanged: onChanged,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
            border: InputBorder.none,
            icon: Icon(Icons.search),
            hintText: '搜索',
            hintStyle:  new TextStyle(fontSize: 14, color: Color.fromARGB(50, 0, 0, 0)),
          ),
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: new BorderRadius.all(new Radius.circular(5.0)),
      ),
      alignment: Alignment.center,
      height: 36,
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: buildTextField(),
    );
  }
}

/// 选择列表页面，自带顶部搜索功能
/// title:页面标题
/// selected：选中的节点
/// list：数据源
/// titleList:列表内容，如：
/// [{'field':'name','title':'名称'},
/// {'field':'type','title':'型号'}
/// {'field':'unit','title':'单位'}]
///
class ListSelect extends StatefulWidget {
  ListSelect({@required this.list, this.multi, @required this.columns, this.selected, this.title});
  final bool multi;
  final dynamic selected;
  final List<dynamic> list;
  final String title;
  final List<Map<String, dynamic>> columns;
  @override
  ListSelectState createState() => ListSelectState();
}

class ListSelectState extends State<ListSelect> {

  List<dynamic> suggestions = new List();
  List<dynamic> selectList = new List();

  void search(String value){
    suggestions.clear();
    if(value.isEmpty){
      suggestions.addAll(widget.list);
    }else{
      widget.list.forEach((dynamic object){
        var json = object.toJson();
        for(int i = 0; i < widget.columns.length; i++){
          if(json[widget.columns[i]['field']].toString().contains(value)){
            suggestions.add(object);
            break;
          }
        }
      });
    }
    setState(() {
      suggestions = suggestions;
    });
  }

  Widget buildList(){
    /// 行
    List<Widget> _children = suggestions.map((model){
      Map map = model.toJson();

      List<Widget> cols = List();
      widget.columns.asMap().forEach((index, e){
        cols.add(Expanded(
          child: new Text(
            Utils.textData(map[e['field']]),
            maxLines: 2,
            textAlign: index==0?TextAlign.left:TextAlign.right,
            overflow: TextOverflow.ellipsis,
            style: TextStyles.listContent,
          ),
        ));
      });

      return new InkWell(
        onTap: () {
          if(widget.multi != true){
            selectList.clear();
          }

          if(selectList.contains(model)){
            selectList.remove(model);
          }else{
            selectList.add(model);
          }

          setState(() { });
        },
        child: Container(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: cols,
            ),
            decoration: new BoxDecoration(
                color: selectList.contains(model)?Colors.lightGreen:Colors.white,
                border: new Border.all(width: 0.33, color: Colours.divider)
            )
        ),
      );
    }).toList();

    /// 标题
    List<Widget> colTitles = List();
    widget.columns.asMap().forEach((index, e){
      colTitles.add(Expanded(
        child: Text(
          Utils.textData(e['title']),
          maxLines: 2,
          textAlign: index==0?TextAlign.left:TextAlign.right,
          overflow: TextOverflow.ellipsis,
          style: TextStyles.listTitle,
        ),
      ));
    });
    List<Widget> children = new List();
    children.add(TextFieldWidget(onChanged: search,));
    children.add(Container(
        padding: EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 10.0),
        child: Row(
          children: colTitles,
        )
    )
    );
    children.addAll(_children);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: children,
    );
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      selectList.clear();
      suggestions.addAll(widget.list);
    });
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title != null? widget.title : '选择'),
          actions: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 15.0, right: 20.0),
              width: 30.0,
              alignment: Alignment.center,
              child: FlatButton(
                child: Text('确定', style: TextStyle(color: Colors.white),),
                padding: EdgeInsets.all(0),
                onPressed: (){
                  Navigator.pop(context, selectList);
                },
              ),
            ),
          ],
        ),
        body: ListView(
          children: <Widget>[
            buildList(),
          ],
        )
    );
  }
}

