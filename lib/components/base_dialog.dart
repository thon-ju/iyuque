

import 'package:flutter/material.dart';
import 'package:my_yuque/res/colors.dart';
import 'package:my_yuque/res/dimens.dart';
import 'package:my_yuque/res/styles.dart';
import 'package:my_yuque/util/theme_utils.dart';

/// 自定义dialog的模板
class BaseDialog extends StatelessWidget{

  const BaseDialog({
    Key key,
    this.title,
    this.cancelText = '取消',
    this.confirmText = '确定',
    this.onPressed,
    this.onCancel,
    this.hiddenTitle : false,
    @required this.child
  }) : super(key : key);

  final String title;
  final String cancelText;
  final String confirmText;
  final Function onPressed;
  final Function onCancel;
  final Widget child;
  final bool hiddenTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(//创建透明层
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      // 键盘弹出收起动画过渡
      body: AnimatedContainer(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height - MediaQuery.of(context).viewInsets.bottom,
        duration: const Duration(milliseconds: 120),
        curve: Curves.easeInCubic,
        child: Container(
            decoration: BoxDecoration(
              color: ThemeUtils.getDialogBackgroundColor(context),
              borderRadius: BorderRadius.circular(8.0),
            ),
            width: 270.0,
            padding: const EdgeInsets.only(top: 24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Offstage(
                  offstage: hiddenTitle,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      hiddenTitle ? "" : title,
                      style: TextStyles.textBold18,
                    ),
                  ),
                ),
                Flexible(child: child),
                Gaps.vGap10,
                Gaps.line,
                Row(
                  children: <Widget>[
                    Expanded(
                      child: SizedBox(
                        height: 48.0,
                        child: FlatButton(
                          child: Text(
                            cancelText,
                            style: TextStyle(
                                fontSize: Dimens.font_sp18
                            ),
                          ),
                          textColor: Colours.text_gray,
                          onPressed: onCancel,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 48.0,
                      width: 0.6,
                      child: const VerticalDivider(),
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 48.0,
                        child: FlatButton(
                          child: Text(
                            confirmText,
                            style: TextStyle(fontSize: Dimens.font_sp18),
                          ),
                          textColor: Theme.of(context).primaryColor,
                          onPressed: (){
                            onPressed();
                          },
                        ),
                      ),
                    )
                  ],
                )
              ],
            )
        ),
      ),
    );
  }
}
