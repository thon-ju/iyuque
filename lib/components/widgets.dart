
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iyuque/common/common.dart';
import 'package:iyuque/res/colors.dart';
import 'package:iyuque/res/styles.dart';
import 'package:iyuque/util/image_utils.dart';
import 'package:iyuque/util/utils.dart';

class ProgressView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new SizedBox(
        width: 24.0,
        height: 24.0,
        child: new CircularProgressIndicator(
          strokeWidth: 2.0,
        ),
      ),
    );
  }
}

class StatusViews extends StatelessWidget {
  const StatusViews(this.status, {Key key, this.onTap}) : super(key: key);
  final int status;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case LoadStatus.fail:
        return new Container(
          width: double.infinity,
          child: new Material(
            color: Colors.white,
            child: InkWell(
              onTap: () {
                if(onTap != null){
                  onTap();
                }
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Image.asset(
                    Utils.getImgPath("ic_network_error"),
                    width: 100,
                    height: 100,
                  ),
                  Gaps.vGap10,
                  Text(
                    "网络出问题了～ 请您查看网络设置",
                    style: TextStyles.listContent,
                  ),
                ],
              ),
            ),
          ),
        );
        break;
      case LoadStatus.loading:
        return new Container(
          alignment: Alignment.center,
          color: Colours.gray_f0,
          child: new ProgressView(),
        );
        break;
      case LoadStatus.empty:
        return InkWell(
          onTap: () {
            if(onTap != null){
              onTap();
            }
          },
          child: Container(
            color: Colors.white,
            width: double.infinity,
            child: new Center(
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Image.asset(
                    Utils.getImgPath("ic_data_empty"),
                    width: 60,
                    height: 60,
                  ),
                  Gaps.vGap10,
                  Text(
                    "空空如也～, 点击刷新",
                    style: TextStyles.listContent2,
                  ),
                ],
              ),
            ),
          ),
        );
        break;
      default:
        return Container();
        break;
    }
  }
}

class InputTitle extends StatelessWidget {
  const InputTitle(this.title, {this.showIcon, Key key}) : super(key: key);

  final String title;
  final bool showIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(showIcon==true?0:10, 8, 0, 8),
                child: Text(title??'', style: TextStyles.listTitle,),
              ),
            ),
            showIcon==true?SizedBox(
              width: 50.0,
              child: Align(
                alignment: Alignment.centerRight,
                child: Icon(Icons.chevron_right),
              ),
            ):Container()
          ],
        ),
      ],
    );
  }
}

class InputItemDetail extends StatelessWidget {
  const InputItemDetail(this.label, this.val, {Key key}) : super(key: key);

  final String label;
  final String val;

  @override
  Widget build(BuildContext context) {
    return Text(
      label + '：' + (val??''),
      style:TextStyles.listExtra,
    );
  }
}

class InputItemDetail2 extends StatelessWidget {
  const InputItemDetail2(this.label1, this.val1, this.label2, this.val2, {Key key}) : super(key: key);

  final String label1;
  final String val1;
  final String label2;
  final String val2;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(child: InputItemDetail(label1, val1??''), flex: 1,),
        Expanded(child: InputItemDetail(label2, val2??''), flex: 1,),
      ],
    );
  }
}


class FormInputItem extends StatelessWidget {
  const FormInputItem({this.hintText, this.name, this.labelWidth, this.maxLines,
    this.initialValue, this.readOnly, this.required, this.onlyNumber, this.obscureText = false,
    this.controller, this.validator, this.onTap, this.onSaved, Key key}) : super(key: key);

  final String hintText;
  final String name;
  final String initialValue;
  final double labelWidth;
  final int maxLines;
  final bool readOnly;
  final bool required;
  final bool onlyNumber;
  final bool obscureText;
  final TextEditingController controller;
  final String Function(String value) validator;
  final Function onSaved;
  final Function onTap;

  /// 必填校验
  String _validateNotNull(String value){
    if(value == null || value.isEmpty)
      return '必填项';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    String tips = required==true?'*':'';

    return Container(
      height: 48.0,
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border(
            bottom: Divider.createBorderSide(context, width: 0.6),
          )
      ),
      child: Row(
        children: [
          SizedBox(
            width: labelWidth??80.0,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(name+tips, style: TextStyles.listContent2,),
            ),
          ),
          Expanded(
            child: InkWell(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 5),
                        border: InputBorder.none,
                        hintText: hintText!=null?hintText:onTap==null?'请输入':'请选择',
                        hintStyle: TextStyles.listContent2,
                        errorStyle: TextStyle(fontSize: 10)
                      ),
                      style: TextStyles.listContent,
                      readOnly: readOnly??false,
                      initialValue: initialValue,
                      maxLines: maxLines??1,
                      obscureText: obscureText,
                      validator: (String value){
                        // 先校验必填
                        if(required == true && _validateNotNull(value) != null){
                          return _validateNotNull(value);
                        }
                        // 再校验自定义规则
                        else if(validator != null) {
                          return validator(value);
                        }
                        return null;
                      },
                      keyboardType: onlyNumber==true?TextInputType.number: TextInputType.text,
                      controller: controller,
                      onSaved: onSaved,
                      onTap: onTap,
                    ),
                  ),
                  onTap==null?Container():IconButton(
                    padding: EdgeInsets.all(0),
                    color: Colours.gray_99,
                    alignment: Alignment.centerRight,
                    icon: const Icon(
                      Icons.chevron_right,
                      size: 20.0,
                    ),
                  ),
                ],
              ),
              onTap: onTap,
            ),
          ),
        ],
      ),
    );
  }
}

class FormDropDown extends StatelessWidget {
  const FormDropDown(this.name, {this.labelWidth, this.items, this.required, this.initialValue, this.onSaved, this.onChange, Key key}) : super(key: key);

  final String name;
  final List<String> items;
  final String initialValue;
  final double labelWidth;
  final bool required;
  final Function onSaved;
  final Function onChange;

  @override
  Widget build(BuildContext context) {
    String dropdownButtonValue = initialValue;

    return FormField<String>(
      validator: (value) {
        if (required==true && (dropdownButtonValue == null || dropdownButtonValue.isEmpty)) {
          return '请选择!';
        }
        return null;
      },
      onSaved: onSaved(dropdownButtonValue),
      builder: (FormFieldState<String> state){
        return Container(
          decoration: UnderlineTabIndicator(
              borderSide: BorderSide(width: 1.0, color: Colours.divider),
              insets: EdgeInsets.fromLTRB(0,0,0, 0)
          ),
          child: Row(
            children: [
              SizedBox(
                width: 80.0,
                height: 40.0,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(name+(required==true?'*':''),style: TextStyles.listContent2 ),
                ),
              ),
              Expanded(
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    icon: const Icon(Icons.chevron_right, size: 20.0,),
                    iconEnabledColor: Colours.gray_99,
                    isExpanded: true,
                    hint: state.hasError?Text('请选择', style: TextStyles.listContentDanger,): Text('请选择', style: TextStyles.listContent2,),
                    value: initialValue,
                    onChanged: (String newValue) {
                      dropdownButtonValue = newValue;
                      state.didChange(newValue);
                      if(onChange != null){
                        onChange(newValue);
                      }
                    },
                    items: items.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value, style: TextStyles.listContent, ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

/// 加载本地资源图片
class LoadAssetImage extends StatelessWidget {

  const LoadAssetImage(this.image, {
    Key key,
    this.width,
    this.height,
    this.fit,
    this.format: 'png',
    this.color
  }): super(key: key);

  final String image;
  final double width;
  final double height;
  final BoxFit fit;
  final String format;
  final Color color;

  @override
  Widget build(BuildContext context) {

    return Image.asset(
      ImageUtils.getImgPath(image, format: format),
      height: height,
      width: width,
      fit: fit,
      color: color,
    );
  }
}


