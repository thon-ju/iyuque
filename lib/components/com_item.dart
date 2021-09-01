import 'package:flutter/material.dart';
import 'package:iyuque/model/models.dart';
import 'package:iyuque/res/styles.dart';
import 'package:iyuque/util/navigator_util.dart';

class ComArrowItem extends StatelessWidget {
  const ComArrowItem(this.model, {Key key}) : super(key: key);
  final ComModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Material(
        color: Colors.white,
        child: ListTile(
          onTap: model.onTap?? () {
            if (model.page == null) {
              NavigatorUtil.pushWeb(context, title: model.title, url: model.url, isHome: true);
            } else {
              NavigatorUtil.pushPage(context, model.page, pageName: model.title);
            }
          },
          enabled: model.enable??true,
          leading: model.icon==null?null: Icon(model.icon, color: Theme.of(context).primaryColor,),
          title: Align(
            alignment: Alignment.centerLeft,
            child: Text(model.title == null ? "" : model.title, style: TextStyles.textSize14,),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                model.extra == null ? "" : model.extra,
                style: model.extraStyle??TextStyle(color: Colors.grey, fontSize: 14.0),
              ),
              Icon(
                Icons.navigate_next,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
      decoration: Decorations.bottom,
    );
  }
}
