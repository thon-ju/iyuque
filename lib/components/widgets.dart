
import 'package:dio/dio.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:my_yuque/common/common.dart';
import 'package:my_yuque/model/json_data.dart';
import 'package:my_yuque/res/colors.dart';
import 'package:my_yuque/res/styles.dart';
import 'package:my_yuque/util/image_utils.dart';
import 'package:my_yuque/util/utils.dart';
import 'package:oktoast/oktoast.dart';

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
                onTap();
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
            onTap();
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

class MessageItem extends StatelessWidget {
  const MessageItem(this.model, {this.onTap, Key key}) : super(key: key);

  final Message model;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Gaps.vGap10,
            InputTitle(model.title, showIcon: true,),
            Text("${model.createdByName} 发布于 ${model.createdDate}", style: TextStyles.listExtra2,),
            Gaps.vGap5,
          ],
        ),
        decoration: new BoxDecoration(
            color: Colors.white,
            border: new Border.all(width: 0.33, color: Colours.divider)
        ),
      ),

    );
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
                child: Text(title??'', style: TextStyles.textSize14,),
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

class InputItem extends StatelessWidget {
  const InputItem(this.model, {this.onTap, Key key}) : super(key: key);

  final Input model;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Gaps.vGap10,
            InputTitle(model.no, showIcon: true,),
            Gaps.vGap10,
            InputItemDetail2("所属项目", model.officeName, "入库来源", model.labType),
            InputItemDetail2("收货状态", model.status, "货款状态", model.moneyStatus),
            InputItemDetail2("供货单位", model.supplierName, "所属项目", model.officeName),
            InputItemDetail2("到货日期", model.inputDate, "收  货  人", model.receiver),
            InputItemDetail("备        注", model.remarks),
            SizedBox(height: 10),
          ],
        ),
        decoration: new BoxDecoration(
            color: Colors.white,
            border: new Border.all(width: 0.33, color: Colours.divider)
        ),
      ),

    );
  }
}

class InputDetailItem extends StatefulWidget {
  const InputDetailItem(this.model, {this.index, this.onTap, this.selected = false, Key key}) : super(key: key);

  final InputDetail model;
  final int index;
  final Function onTap;
  final selected;
  @override
  _InputDetailItemState createState() => _InputDetailItemState();
}

class _InputDetailItemState extends State<InputDetailItem> {
  bool selected;

  @override
  void initState() {
    super.initState();
    selected = widget.selected;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        setState(() {
          selected = !selected;
        });
        widget.onTap();
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Gaps.vGap5,
            Row(
              children: <Widget>[
                Text('${widget.index??''}',style: TextStyles.listExtra),
                Expanded(child: InputTitle(widget.model.inputNo, showIcon: false,)),
              ],
            ),
            InputItemDetail("材料名称", widget.model.materialDetailName),
            InputItemDetail2("规格型号", widget.model.type, "计量单位", widget.model.unit),
            InputItemDetail2("库存", widget.model.stockNum.toString(), "产地", widget.model.produceArea),
            InputItemDetail2("批号", widget.model.batchNo, "入库日期", widget.model.inputDate),
            InputItemDetail("送货车号", widget.model.carNo),
            SizedBox(height: 10),
          ],
        ),
        decoration: new BoxDecoration(
            color: selected?Colors.lightGreen:Colors.white,
            border: new Border.all(width: 0.33, color: Colours.divider)
        ),
      ),

    );
  }
}

class BoqPlanSelectItem extends StatefulWidget {
  const BoqPlanSelectItem(this.model, {this.onTap, this.selected = false, Key key}) : super(key: key);

  final MaterialDetail model;
  final Function onTap;
  final selected;
  @override
  _BoqPlanSelectItemState createState() => _BoqPlanSelectItemState();
}

class _BoqPlanSelectItemState extends State<BoqPlanSelectItem> {
  bool selected;

  @override
  void initState() {
    super.initState();
    selected = widget.selected;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        setState(() {
          selected = !selected;
        });
        widget.onTap();
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Gaps.vGap10,
            InputTitle('${widget.model.materialDetailName}  ${widget.model.type}', showIcon: true,),
            Gaps.vGap10,
            InputItemDetail2("计量单位", widget.model.unit, "需求量", '${widget.model.actualNum}'),
            InputItemDetail2("已出库量", '${widget.model.usedNum}', "剩余需求量", '${widget.model.leftNum}'),
            SizedBox(height: 10),
          ],
        ),
        decoration: new BoxDecoration(
            color: selected?Colors.lightGreen:Colors.white,
            border: new Border.all(width: 0.33, color: Colours.divider)
        ),
      ),

    );
  }
}

class InputSelectItem extends StatefulWidget {
  const InputSelectItem(this.model, {this.onTap, this.showPrice, this.selected = false, Key key}) : super(key: key);

  final BoqPlanDetail model;
  final Function onTap;
  final selected;
  final bool showPrice;
  @override
  _InputSelectItemState createState() => _InputSelectItemState();
}

class _InputSelectItemState extends State<InputSelectItem> {
  bool selected;

  @override
  void initState() {
    super.initState();
    selected = widget.selected;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        setState(() {
          selected = !selected;
        });
        widget.onTap();
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Gaps.vGap10,
            InputTitle('${widget.model.planNo}', showIcon: true,),
            Gaps.vGap10,
            InputItemDetail2("材料", widget.model.materialDetailName, "单位", widget.model.unit),
            InputItemDetail2('库存数量', '${widget.model.leftNum}', '计划采购数量', '${widget.model.planNum}'),
            widget.showPrice==true?InputItemDetail2("采购单价", '${widget.model.price??''}',"采购金额", '${widget.model.amount??''}'):Container(width: 0,height: 0,),
            InputItemDetail("备注", widget.model.remarks),
            Gaps.vGap10,
          ],
        ),
        decoration: new BoxDecoration(
            color: selected?Colors.lightGreen:Colors.white,
            border: new Border.all(width: 0.33, color: Colours.divider)
        ),
      ),

    );
  }
}

class OutputItem extends StatelessWidget {
  const OutputItem(this.model, {this.onTap, Key key}) : super(key: key);

  final Output model;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Gaps.vGap10,
            InputTitle(model.no, showIcon: true,),
            Gaps.vGap10,
            InputItemDetail("仓库", model.outputWarehouseName),
            InputItemDetail2("收货人", model.receiver,"领用日期", model.outputDate),
            InputItemDetail("使用地点", model.projectName),
            InputItemDetail("备        注", model.remarks),
            Gaps.vGap10,
          ],
        ),
        decoration: new BoxDecoration(
            color: Colors.white,
            border: new Border.all(width: 0.33, color: Colours.divider)
        ),
      ),

    );
  }
}

class OutputSelectItem extends StatefulWidget {
  const OutputSelectItem(this.model, {this.index, this.onTap, this.selected = false, Key key}) : super(key: key);

  final InputDetail model;
  final int index;
  final Function onTap;
  final selected;
  @override
  _OutputSelectItemState createState() => _OutputSelectItemState();
}

class _OutputSelectItemState extends State<OutputSelectItem> {
  bool selected;

  @override
  void initState() {
    super.initState();
    selected = widget.selected;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        setState(() {
          selected = !selected;
        });
        widget.onTap();
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Gaps.vGap5,
            Row(
              children: <Widget>[
                Text('${widget.index??''}',style: TextStyles.listExtra),
                Expanded(child: InputTitle('${widget.model.materialDetailName??''} - ${widget.model.type??''} - ${widget.model.unit??''}', showIcon: false),),
              ],
            ),
            InputItemDetail("库存", '${widget.model.stockNum??''}'),
            InputItemDetail("入库单号", widget.model.inputNo??''),
            InputItemDetail2('入库日期', '${widget.model.inputDate??''}', '送货车号', '${widget.model.carNo??''}'),
            InputItemDetail2("批号", '${widget.model.batchNo??''}',"产地", '${widget.model.produceArea??''}'),
            Gaps.vGap10,
          ],
        ),
        decoration: new BoxDecoration(
            color: selected?Colors.lightGreen:Colors.white,
            border: new Border.all(width: 0.33, color: Colours.divider)
        ),
      ),

    );
  }
}

class StockBackItem extends StatelessWidget {
  const StockBackItem(this.model, {this.onTap, Key key}) : super(key: key);

  final StockBack model;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Gaps.vGap10,
            InputTitle(model.no, showIcon: true,),
            Gaps.vGap10,
            InputItemDetail("仓库", model.warehouseName),
            InputItemDetail2("退库日期", model.billDate, "退库人", model.operator,),
            InputItemDetail("备        注", model.remarks),
            Gaps.vGap10,
          ],
        ),
        decoration: new BoxDecoration(
            color: Colors.white,
            border: new Border.all(width: 0.33, color: Colours.divider)
        ),
      ),

    );
  }
}

class StockAllotItem extends StatelessWidget {
  const StockAllotItem(this.model, {this.onTap, Key key}) : super(key: key);

  final StockAllot model;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Gaps.vGap10,
            InputTitle(model.no, showIcon: true,),
            Gaps.vGap10,
            InputItemDetail2("所属项目", model.officeName,"所属仓库", model.warehouseName),
            InputItemDetail2("调拨日期", model.billDate, "调  拨  人", model.operator),
            InputItemDetail2("调拨项目", model.allotOfficeName,"调拨仓库", model.allotWarehouseName),
            InputItemDetail("备        注", model.remarks),
            Gaps.vGap10,
          ],
        ),
        decoration: new BoxDecoration(
            color: Colors.white,
            border: new Border.all(width: 0.33, color: Colours.divider)
        ),
      ),

    );
  }
}

class ClockListItem extends StatelessWidget {
  const ClockListItem(this.model, {this.onTap, this.showIcon = true, Key key}) : super(key: key);

  final Clock model;
  final Function onTap;
  final bool showIcon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Gaps.vGap10,
            InputTitle(model.createdByName + '  ' + model.checkDate, showIcon: showIcon),
//            Gaps.vGap10,
//            InputItemDetail2("经        度", '${model.lng??''}', "纬        度", '${model.lat??''}'),
            InputItemDetail("定位位置", '${model.address??''}'),
            Gaps.vGap10,
          ],
        ),
        decoration: new BoxDecoration(
            color: Colors.white,
            border: new Border.all(width: 0.33, color: Colours.divider)
        ),
      ),

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


class MaterialDetailItem extends StatelessWidget {
  const MaterialDetailItem({@required this.model, this.onTap, Key key}) : super(key: key);

  final MaterialDetail model;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Gaps.vGap10,
            Row(
              children: <Widget>[
                Expanded(
                  child: Text('材料名称 ' + model.name, style: TextStyles.listTitle,),
                ),
                SizedBox(
                  width: 50.0,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.edit),
                  ),
                )
              ],
            ),

            SizedBox(height: 10),
            InputItemDetail("材料编码", model.code),
            InputItemDetail2("规格型号", model.type, "计量单位", model.unit),
            InputItemDetail2("材料类别编码", model.materialCode, "计量单位", model.unit),
            InputItemDetail("材料类别", model.allSubject),
            InputItemDetail2("到货日期", model.name, "收  货  人", model.name),
            InputItemDetail2("是否限额", model.isLimit,"是否生效", model.isEffective,),
            InputItemDetail("是否审批", model.isApprove),
            InputItemDetail("审批状态", model.approveStatus),
            InputItemDetail("描述", model.description),
            SizedBox(height: 10),
          ],
        ),
        decoration: new BoxDecoration(
            color: Colors.white,
            border: new Border.all(width: 0.33, color: Colours.divider)
        ),
      ),

    );
  }
}

class FlowRecordItem extends StatelessWidget {
  const FlowRecordItem({@required this.model, this.history, this.onTap, Key key}) : super(key: key);

  final FlowRecord model;
  final bool history;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Gaps.vGap10,
            InputTitle('${model.instanceName}', showIcon: true,),
            Gaps.vGap10,
            InputItemDetail("所属项目", model.officeName),
            model.taskName==null?Gaps.empty:InputItemDetail('当前环节', model.taskName??''),
            InputItemDetail('提交时间', model.startTime??''),
            model.taskName!=null?Gaps.empty:InputItemDetail('完成时间', model.endTime??''),
            Gaps.vGap10,
          ],
        ),
        decoration: new BoxDecoration(
            color: Colors.white,
            border: new Border.all(width: 0.33, color: Colours.divider)
        ),
      ),

    );
  }
}

class PurchasePlanItem extends StatelessWidget {
  const PurchasePlanItem(this.model, {this.onTap, this.showPrice, Key key}) : super(key: key);

  final BoqPlan model;
  final Function onTap;
  final bool showPrice;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Gaps.vGap10,
            InputTitle('【${model.approveStatus}】${model.planNo}', showIcon: true,),
            Gaps.vGap10,
            InputItemDetail2("所属项目", model.officeName, "制单人", model.createdByName),
            InputItemDetail2('计划日期', model.planDate, '制单日期', model.createdDate),
            showPrice==true?InputItemDetail("计划采购金额", '${model.amount??''}'):Container(width: 0,height: 0,),
            InputItemDetail("备注", model.remarks),
            Gaps.vGap10,
          ],
        ),
        decoration: new BoxDecoration(
            color: Colors.white,
            border: new Border.all(width: 0.33, color: Colours.divider)
        ),
      ),

    );
  }
}

class MachineBookItem extends StatelessWidget {
  const MachineBookItem(this.model, {this.onTap, Key key}) : super(key: key);

  final MachineBook model;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Gaps.vGap10,
            InputTitle(model.name, showIcon: true,),
            Gaps.vGap10,
            InputItemDetail2("设备类型", model.type,"规格型号", model.code),
            InputItemDetail2('驾  驶  员', model.driver, "产地", model.producePlace),
            InputItemDetail2("启用时间", model.beginDate, "停用时间", model.endDate),
            InputItemDetail("录入人", model.createdByName),
            InputItemDetail("备注", model.remark),
            Gaps.vGap10,
          ],
        ),
        decoration: new BoxDecoration(
            color: Colors.white,
            border: new Border.all(width: 0.33, color: Colours.divider)
        ),
      ),
    );
  }
}

class MachineStatusItem extends StatelessWidget {
  const MachineStatusItem(this.model, {this.onTap, Key key}) : super(key: key);

  final MachineStatus model;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Gaps.vGap10,
            InputTitle('填报日期:'+model.writeDate, showIcon: true,),
            Gaps.vGap10,
            InputItemDetail2('机械数量', '${model.machineCount??0}', "出勤机械数量", '${model.machineWorkCount??0}'),
            InputItemDetail2('工作日期', '${model.workDate??0}', "填报人", '${model.createdByName??0}'),
            Gaps.vGap10,
          ],
        ),
        decoration: new BoxDecoration(
            color: Colors.white,
            border: new Border.all(width: 0.33, color: Colours.divider)
        ),
      ),

    );
  }
}

class MachineRefuelItem extends StatelessWidget {
  const MachineRefuelItem(this.model, {this.onTap, Key key}) : super(key: key);

  final MachineRefuel model;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Gaps.vGap10,
            InputTitle('填报日期 '+model.writeDate, showIcon: true,),
            Gaps.vGap5,
            InputItemDetail2('机械数量', '${model.machineCount??0}', "加油数量合计", '${model.refuelTotal??0}'),
            InputItemDetail2('加油日期', '${model.refuelDate??''}', "填报人", '${model.createdByName??''}'),
            Gaps.vGap10,
          ],
        ),
        decoration: new BoxDecoration(
            color: Colors.white,
            border: new Border.all(width: 0.33, color: Colours.divider)
        ),
      ),

    );
  }
}

class MachineRepairItem extends StatelessWidget {
  const MachineRepairItem(this.model, {this.onTap, Key key}) : super(key: key);

  final MachineRepair model;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Gaps.vGap10,
            InputTitle('【${model.approveStatus}】${model.billNo}', showIcon: true,),
            Gaps.vGap5,
            InputItemDetail("设备信息",'(${model.type}) ${model.name} ${model.code}'),
            InputItemDetail2('维修开始日期', model.repairDate, "维修结束日期", model.repairEndDate),
            InputItemDetail2('维修部位', model.repairPosition, "发生费用", '${model.cost??0} 元'),
            InputItemDetail2("驾驶员", model.driver, "填报人", model.createdByName),
            Gaps.vGap10,
          ],
        ),
        decoration: new BoxDecoration(
            color: Colors.white,
            border: new Border.all(width: 0.33, color: Colours.divider)
        ),
      ),

    );
  }
}

class ReportInventoryDetailItem extends StatelessWidget {
  const ReportInventoryDetailItem(this.model, {Key key}) : super(key: key);

  final ReportInventory model;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Gaps.vGap10,
          InputTitle('${model.billDate??""} - ${model.type??""}'),
          Gaps.vGap5,
          InputItemDetail("物资名称", model.materialName),
          InputItemDetail2( "规格型号", model.materialType, "单位", model.materialUnit,),
          InputItemDetail2("入库数量", '${model.inNum??0}',"出库数量", '${model.outNum??0}'),
          InputItemDetail2("退库数量", '${model.backNum??0}',"调拨数量", '${model.allotNum??0}'),
          InputItemDetail("库存数量", '${model.leftNum??0}'),
          InputItemDetail("单据号", '${model.no??''}'),
          Gaps.vGap10,
        ],
      ),
      decoration: new BoxDecoration(
          color: Colors.white,
          border: new Border.all(width: 0.33, color: Colours.divider)
      ),
    );
  }
}

class ReportInventoryItem extends StatelessWidget {
  const ReportInventoryItem(this.model, {Key key}) : super(key: key);

  final ReportInventory model;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Gaps.vGap10,
          InputTitle('${model.materialName??""} - ${model.materialType??""} - ${model.materialUnit??""}'),
          Gaps.vGap5,
          InputItemDetail2("入库数量", '${model.inNum??0}',"出库数量", '${model.outNum??0}'),
          InputItemDetail2("退库数量", '${model.backNum??0}',"调拨数量", '${model.allotNum??0}'),
          InputItemDetail("库存数量", '${model.leftNum??0}'),
          InputItemDetail("单据号", '${model.no??''}'),
          Gaps.vGap10,
        ],
      ),
      decoration: new BoxDecoration(
          color: Colors.white,
          border: new Border.all(width: 0.33, color: Colours.divider)
      ),
    );
  }
}

class ReportMachineItem extends StatelessWidget {
  const ReportMachineItem(this.model, {Key key}) : super(key: key);

  final ReportMachine model;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Gaps.vGap10,
          InputTitle('${model.officeName} ${model.year}年${model.month}月 ${model.name}'),
          Gaps.vGap10,
          InputItemDetail2( "驾驶员", '${model.driver??''}', "工作天数(天)", '${model.workDays??0}',),
          InputItemDetail2( "工作时长(小时)", '${model.duration??0}', "出勤率", '${model.days>0?NumUtil.getNumByValueDouble(model.workDays*100.0/model.days, 2):0} %',),
          InputItemDetail2("加油数量", '${model.refuelTotal??0} 升', "加油金额", '${model.refuelCost??0} 元'),
          InputItemDetail2("维修天数", '${model.repairDays??0}', "维修金额", '${model.repairCost??0} 元'),
          Gaps.vGap10,
        ],
      ),
      decoration: new BoxDecoration(
          color: Colors.white,
          border: new Border.all(width: 0.33, color: Colours.divider)
      ),
    );
  }
}

class ReportExpenseItem extends StatelessWidget {
  const ReportExpenseItem(this.model, {Key key}) : super(key: key);

  final ReportExpense model;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Gaps.vGap10,
          InputTitle('${model.officeName} ${model.year}年${model.month}月 ${model.createBy}'),
          Gaps.vGap10,
          InputItemDetail2("单据数量", '${NumUtil.getNumByValueDouble(model.pageNum??0, 0)}',"公司内部差旅费", '${model.travelExpense??0} 元'),
          InputItemDetail2("商务往来费", '${model.manageExpense??0} 元',"备用金", '${model.imprestExpense??0} 元'),
          Gaps.vGap10,
        ],
      ),
      decoration: new BoxDecoration(
          color: Colors.white,
          border: new Border.all(width: 0.33, color: Colours.divider)
      ),
    );
  }
}

class ReportExpenseMachineItem extends StatelessWidget {
  const ReportExpenseMachineItem(this.model, {Key key}) : super(key: key);

  final MachineExpense model;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Gaps.vGap10,
          InputTitle('${model.supplier}'),
          Gaps.vGap10,
          InputItemDetail2("Machine", model.officeName,"年月", '${model.year??0}年${model.month??0}月'),
          InputItemDetail2("已供产值", '${model.totalFee??0}',"申请金额", '${model.applyFee??0}'),
          Gaps.vGap10,
        ],
      ),
      decoration: new BoxDecoration(
          color: Colors.white,
          border: new Border.all(width: 0.33, color: Colours.divider)
      ),
    );
  }
}

class TravelExpenseItem extends StatelessWidget {
  const TravelExpenseItem(this.model, {this.onTap, Key key}) : super(key: key);

  final TravelExpense model;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Gaps.vGap10,
            InputTitle('【${model.approveStatus}】${model.billNo}', showIcon: true,),
            Gaps.vGap10,
            InputItemDetail2('所属项目', model.officeName, "申请日期", model.applyDate),
            InputItemDetail2('姓名', model.createdByName, "职位", model.jobType),
            InputItemDetail2('出差地点', model.travelPlace, "出差人数", '${model.personNum??0}'),
            InputItemDetail2("开始时间", model.beginDate, "结束时间", model.endDate),
            InputItemDetail2('报销总额', '${model.applyAmount??0}', "审批总额", '${model.approvalAmount??0}'),
            InputItemDetail('报销事由', model.applyReason),
            Gaps.vGap10,
          ],
        ),
        decoration: new BoxDecoration(
            color: Colors.white,
            border: new Border.all(width: 0.33, color: Colours.divider)
        ),
      ),

    );
  }
}

class ManageExpenseItem extends StatelessWidget {
  const ManageExpenseItem(this.model, {this.onTap, Key key}) : super(key: key);

  final ManageExpense model;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Gaps.vGap10,
            InputTitle('【${model.approveStatus}】${model.no}', showIcon: true,),
            Gaps.vGap10,
            InputItemDetail('所属项目', model.officeName),
            InputItemDetail2('申请人', model.createdByName, "申请日期", model.date),
            InputItemDetail2('单据张数', '${model.pageNum??0}', "申请金额", '${model.applyFee??0}'),
            InputItemDetail('费用明细', model.applyReason),
            InputItemDetail('使用地点', model.place),
            Gaps.vGap10,
          ],
        ),
        decoration: new BoxDecoration(
            color: Colors.white,
            border: new Border.all(width: 0.33, color: Colours.divider)
        ),
      ),
    );
  }
}

class ImprestExpenseItem extends StatelessWidget {
  const ImprestExpenseItem(this.model, {this.onTap, Key key}) : super(key: key);

  final ImprestExpense model;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Gaps.vGap10,
            InputTitle('【${model.approveStatus}】${model.no}', showIcon: true,),
            Gaps.vGap10,
            InputItemDetail('所属项目', model.officeName),
            InputItemDetail2('申请人', model.createdByName, "申请日期", model.date),
            InputItemDetail("申请金额", '${model.applyFee??0}'),
            InputItemDetail('申请事由', model.applyReason),
            InputItemDetail('使用地点', model.place),
            Gaps.vGap10,
          ],
        ),
        decoration: new BoxDecoration(
            color: Colors.white,
            border: new Border.all(width: 0.33, color: Colours.divider)
        ),
      ),
    );
  }
}

class MachineExpenseItem extends StatelessWidget {
  const MachineExpenseItem(this.model, {this.onTap, Key key}) : super(key: key);

  final MachineExpense model;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Gaps.vGap10,
            InputTitle('【${model.approveStatus}】${model.no}', showIcon: true,),
            Gaps.vGap10,
            InputItemDetail('所属项目', model.officeName),
            InputItemDetail2('申请人', model.createdByName, "申请日期", model.date),
            InputItemDetail2('供应商', model.supplier, "已供产值", '${model.totalFee}'),
            InputItemDetail2('申请金额', '${model.applyFee}', "开户名", '${model.companyName}'),
            InputItemDetail2('开户行', '${model.bankName}', "开户账号", '${model.bankNo}'),
            InputItemDetail('备注', model.memo),
            Gaps.vGap10,
          ],
        ),
        decoration: new BoxDecoration(
            color: Colors.white,
            border: new Border.all(width: 0.33, color: Colours.divider)
        ),
      ),
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

class FormDateItem extends StatelessWidget {
  const FormDateItem({@required this.name, this.readOnly, this.labelWidth, this.initialValue, this.selectDate, this.minTime, this.maxTime, Key key}) : super(key: key);

  final String name;
  final DateTime initialValue;
  final double labelWidth;
  final Function selectDate;
  final bool readOnly;
  final DateTime minTime;
  final DateTime maxTime;

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: UnderlineTabIndicator(
          borderSide: BorderSide(width: 1.0, color: Colours.divider),
          insets: EdgeInsets.fromLTRB(0,0,0, 0)
      ),
      child: Row(
        children: [
          SizedBox(
            width: labelWidth??80.0,
            height: 40.0,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(name, style: TextStyles.listContent2,),
            ),
          ),
          Expanded(
            child: FlatButton(
              padding: EdgeInsets.symmetric(horizontal: 0),
              onPressed: () {
                if(readOnly!=true){
                  DatePicker.showDatePicker(
                      context,
                      showTitleActions: true,
                      onConfirm: selectDate,
                      currentTime: initialValue,
                      minTime: minTime,
                      maxTime: maxTime,
                      locale: LocaleType.zh
                  );
                } else {
                  showToast('不允许修改');
                }
              },
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  initialValue==null?'':DateUtil.formatDate(initialValue, format:DateFormats.y_mo_d),
                  textAlign: TextAlign.left,
                  style: TextStyles.listContent,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 20,
            child: Icon(
              Icons.chevron_right,
              size: 20.0,
              color: Colours.text_gray,
            )
          )
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

/// PmsFlutButton没权限时的状态
enum PmsBtnType{
  /// 没权限时禁用按钮
  disable,
  /// 没权限时隐藏按钮
  hidden,
}

/// 封装FlatButton，加权限过滤功能.不传permissionString，将和FlatButton小部件无区别
class PmsFlutButton extends FlatButton {
  const PmsFlutButton({
    Key key,
    this.permissionString,
    this.btnType = PmsBtnType.hidden,
    @required VoidCallback onPressed,
    VoidCallback onLongPress,
    ValueChanged<bool> onHighlightChanged,
    ButtonTextTheme textTheme,
    Color textColor = Colors.white,
    Color disabledTextColor = Colors.grey,
    Color color,
    Color disabledColor,
    Color focusColor,
    Color hoverColor,
    Color highlightColor,
    Color splashColor,
    Brightness colorBrightness,
    EdgeInsetsGeometry padding,
    VisualDensity visualDensity,
    ShapeBorder shape,
    Clip clipBehavior = Clip.none,
    FocusNode focusNode,
    bool autofocus = false,
    MaterialTapTargetSize materialTapTargetSize,
    @required Widget child,
  }):  assert(clipBehavior != null),
        assert(autofocus != null),
        super(
        key: key,
        onPressed: onPressed,
        onLongPress: onLongPress,
        onHighlightChanged: onHighlightChanged,
        textTheme: textTheme,
        textColor: textColor,
        disabledTextColor: disabledTextColor,
        color: color,
        disabledColor: disabledColor,
        focusColor: focusColor,
        hoverColor: hoverColor,
        highlightColor: highlightColor,
        splashColor: splashColor,
        colorBrightness: colorBrightness,
        padding: padding,
        visualDensity: visualDensity,
        shape: shape,
        clipBehavior: clipBehavior,
        focusNode: focusNode,
        autofocus: autofocus,
        materialTapTargetSize: materialTapTargetSize,
        child: child,
      );

  final String permissionString;
  final PmsBtnType btnType;

  @override
  Widget build(BuildContext context) {
    bool visible = permissionString == null || btnType == PmsBtnType.disable;
    bool hasper = permissionString == null || Utils.checkPermission(permissionString);

    return (hasper || visible) ?FlatButton(
      key:key,
      onPressed:hasper?onPressed:null,
      onLongPress:hasper?onLongPress:null,
      onHighlightChanged:onHighlightChanged,
      textTheme:textTheme,
      textColor:textColor,
      disabledTextColor:disabledTextColor,
      color:color,
      disabledColor:disabledColor,
      focusColor:focusColor,
      hoverColor:hoverColor,
      highlightColor:highlightColor,
      splashColor:splashColor,
      colorBrightness:colorBrightness,
      padding:padding,
      visualDensity:visualDensity,
      shape:shape,
      clipBehavior:clipBehavior,
      focusNode:focusNode,
      autofocus:autofocus,
      materialTapTargetSize:materialTapTargetSize,
      child: child,
    ):Container(width: 0,height: 0,);
  }
}

class PmsIconButton extends IconButton {
  const PmsIconButton({
    Key key,
    this.permissionString,
    this.btnType = PmsBtnType.hidden,
    iconSize = 24.0,
    visualDensity,
    padding = const EdgeInsets.all(8.0),
    alignment = Alignment.center,
    @required icon,
    color,
    focusColor,
    hoverColor,
    highlightColor,
    splashColor,
    disabledColor,
    @required onPressed,
    focusNode,
    autofocus = false,
    tooltip,
    enableFeedback = true,
    constraints,
  }) : assert(iconSize != null),
        assert(padding != null),
        assert(alignment != null),
        assert(autofocus != null),
        assert(icon != null),
        super(key:key,
        onPressed:onPressed,
        iconSize:iconSize,
        visualDensity:visualDensity,
        padding:padding,
        alignment:alignment,
        icon:icon,
        color:color,
        focusColor:focusColor,
        hoverColor:hoverColor,
        highlightColor:highlightColor,
        splashColor:splashColor,
        disabledColor:disabledColor,
        focusNode:focusNode,
        autofocus:autofocus,
        tooltip:tooltip,
        enableFeedback:enableFeedback,
        constraints:constraints,);

  final String permissionString;
  final PmsBtnType btnType;

  @override
  Widget build(BuildContext context) {
    bool visible = permissionString == null || btnType == PmsBtnType.disable;
    bool hasper = permissionString == null || Utils.checkPermission(permissionString);

    return (hasper || visible) ?IconButton(
      key:key,
      onPressed:hasper?onPressed:null,
      iconSize:iconSize,
      visualDensity:visualDensity,
      padding:padding,
      alignment:alignment,
      icon:icon,
      color:color,
      focusColor:focusColor,
      hoverColor:hoverColor,
      highlightColor:highlightColor,
      splashColor:splashColor,
      disabledColor:disabledColor,
      focusNode:focusNode,
      autofocus:autofocus,
      tooltip:tooltip,
      enableFeedback:enableFeedback,
      constraints:constraints,
    ):Container(width: 0,height: 0,);
  }
}


