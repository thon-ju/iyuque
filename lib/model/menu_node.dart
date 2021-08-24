
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MenuNode{
  MenuNode();
  MenuNode.data(this.iconData, this.name, this.code, this.link);

  String name;
  String code;
  String link;
  IconData iconData;
  List<MenuNode> children = new List();

  static List<MenuNode> allMenus(){
    List<MenuNode> menus = new List();

    MenuNode menu = MenuNode.data(FontAwesomeIcons.hdd, '日常管理', '', '');
    menu.children.add(MenuNode.data(FontAwesomeIcons.calendar, '待我审批', 'trace-approval-list:view', '/approval'));
    menu.children.add(MenuNode.data(FontAwesomeIcons.calendarCheck, '我的审批', 'trace-approval-history:view', '/approval/history'));
    menu.children.add(MenuNode.data(FontAwesomeIcons.video, '视频监控', 'trace-monitor-live:view', '/material/video'));
    menu.children.add(MenuNode.data(FontAwesomeIcons.checkCircle, '考勤打卡', 'trace-checkin-list:view', '/attendance/clock'));
    menus.add(menu);

    menu = MenuNode.data(FontAwesomeIcons.hdd, '业务办理', '', '');
    menu.children.add(MenuNode.data(FontAwesomeIcons.signInAlt, '入库单', 'trace-material-manage-stock-in:view', '/material/stock/in'));
    menu.children.add(MenuNode.data(FontAwesomeIcons.signOutAlt, '出库单', 'trace-material-manage-stock-out:view', '/material/stock/out'));
    menu.children.add(MenuNode.data(FontAwesomeIcons.undoAlt, '退库单', 'trace-material-manage-stock-back:view', '/material/stock/back'));
    menu.children.add(MenuNode.data(FontAwesomeIcons.exchangeAlt, '调拨单', 'trace-material-manage-stock-allot:view', '/material/stock/allot'));
    menu.children.add(MenuNode.data(FontAwesomeIcons.truckLoading, '机械台账', 'trace-machine-book:view', '/machine/book'));
    menu.children.add(MenuNode.data(FontAwesomeIcons.userEdit, '状态填报', 'trace-machine-status:view', '/machine/status'));
    menu.children.add(MenuNode.data(FontAwesomeIcons.oilCan, '加油记录', 'trace-machine-refuel:view', '/machine/refuel'));
    menus.add(menu);

    menu = MenuNode.data(FontAwesomeIcons.hdd, '费用支付', '', '');
    menu.children.add(MenuNode.data(FontAwesomeIcons.shoppingCart, '采购计划', 'trace-material-manage-plan:view', '/material/purchase/plan'));
    menu.children.add(MenuNode.data(FontAwesomeIcons.wrench, '维修计划', 'trace-machine-repair:view', '/machine/repair'));
    menu.children.add(MenuNode.data(FontAwesomeIcons.yenSign, '备用金', 'trace-expense-imprest:view', '/expense/imprest'));
    menu.children.add(MenuNode.data(FontAwesomeIcons.taxi, '内部差旅费', 'trace-expense-travel:view', '/expense/travel'));
    menu.children.add(MenuNode.data(FontAwesomeIcons.moneyCheck, '商务往来费', 'trace-expense-manage:view', '/expense/manage'));
    menu.children.add(MenuNode.data(FontAwesomeIcons.moneyCheckAlt, '人机费申请', 'trace-expense-machine:view', '/expense/machine'));
    menus.add(menu);

    menu = MenuNode.data(FontAwesomeIcons.hdd, '报表统计', '', '');
    menu.children.add(MenuNode.data(FontAwesomeIcons.chartLine, '收发存明细', 'trace-material-manage-report-inventory-detail:view', '/report/inventory/detail'));
    menu.children.add(MenuNode.data(FontAwesomeIcons.chartPie, '收发存汇总', 'trace-material-manage-report-inventory:view', '/report/inventory'));
    menu.children.add(MenuNode.data(FontAwesomeIcons.chartArea, '机械月汇总', 'trace-machine-report-monthly:view', '/report/machine'));
    menu.children.add(MenuNode.data(FontAwesomeIcons.chartBar, '费用月汇总', 'trace-expense-report-monthly:view', '/report/expense'));
    menu.children.add(MenuNode.data(FontAwesomeIcons.chartBar, '人机费汇总', 'trace-expense-report-machine:view', '/report/expense/machine'));
    menus.add(menu);

    return menus;
  }
}
