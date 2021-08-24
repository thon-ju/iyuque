import 'package:json_annotation/json_annotation.dart';

part 'json_data.g.dart';


class _Converter<T> implements JsonConverter<T, Object> {
  const _Converter();

  @override
  T fromJson(Object json) {
    String _class = T.toString();

    if (json is Map<String, dynamic>) {
      if(_class == 'Message'){
        return Message.fromJson(json) as T;
      } else if(_class == 'BoqPlan'){
        return BoqPlan.fromJson(json) as T;
      } else if(_class == 'BoqPlanDetail'){
        return BoqPlanDetail.fromJson(json) as T;
      } else if(_class == 'Input'){
        return Input.fromJson(json) as T;
      } else if(_class == 'InputDetail'){
        return InputDetail.fromJson(json) as T;
      } else if(_class == 'Output'){
        return Output.fromJson(json) as T;
      } else if(_class == 'StockBack'){
        return StockBack.fromJson(json) as T;
      } else if(_class == 'StockAllot'){
        return StockAllot.fromJson(json) as T;
      } else if(_class == 'Clock'){
        return Clock.fromJson(json) as T;
      } else if(_class == 'MachineBook'){
        return MachineBook.fromJson(json) as T;
      } else if(_class == 'MachineStatus'){
        return MachineStatus.fromJson(json) as T;
      } else if(_class == 'MachineRefuel'){
        return MachineRefuel.fromJson(json) as T;
      } else if(_class == 'MachineRepair'){
        return MachineRepair.fromJson(json) as T;
      } else if(_class == 'TravelExpense'){
        return TravelExpense.fromJson(json) as T;
      } else if(_class == 'ManageExpense'){
        return ManageExpense.fromJson(json) as T;
      } else if(_class == 'ImprestExpense'){
        return ImprestExpense.fromJson(json) as T;
      } else if(_class == 'MachineExpense'){
        return MachineExpense.fromJson(json) as T;
      } else if(_class == 'ReportInventory'){
        return ReportInventory.fromJson(json) as T;
      } else if(_class == 'ReportMachine'){
        return ReportMachine.fromJson(json) as T;
      } else if(_class == 'ReportExpense'){
        return ReportExpense.fromJson(json) as T;
      } else if(_class == 'MaterialDetail'){
        return MaterialDetail.fromJson(json) as T;
      }else if(_class == 'FlowRecord'){
        return FlowRecord.fromJson(json) as T;
      }else if(_class == 'FlowRecordDetail'){
        return FlowRecordDetail.fromJson(json) as T;
      }
    }

    return json as T;
  }

  @override
  Object toJson(T object) {
    String _class = T.toString();

    if(_class == 'BoqPlanDetail'){


    }
    return object;
  }
}


@JsonSerializable(includeIfNull: false)
class MyPage<T>{
  MyPage({this.params, this.rows});
  Map<String, dynamic> params;

  int pageNo;
  int pageSize;
  int totalCount;
  int totalPages;

  @_Converter()
  List<T> rows;

  factory MyPage.fromJson(Map<String, dynamic> json) => _$MyPageFromJson<T>(json);
  Map<String, dynamic> toJson() => _$MyPageToJson(this);
}

@JsonSerializable(includeIfNull: false)
class IdEntity{

  IdEntity();

  int id;
  int delFlag; // 删除标记（0：正常；1：删除；2：审核）
  int createdBy;
  String createdByName;
  String createdDate;

  factory IdEntity.fromJson(Map<String, dynamic> json) => _$IdEntityFromJson(json);
  Map<String, dynamic> toJson() => _$IdEntityToJson(this);

  @override
  String noSuchMethod(Invocation invocation) {
    print('${invocation.memberName}属性不存在');
    return '';
  }
}

@JsonSerializable(includeIfNull: false)
class File extends IdEntity{
  File();

  String bytes = '';
  String contentType = '';
  String dimension = '';
  String fileName = '';
  double fileSize = 0;
  String fileUrl = '';
  double height = 0;
  double width = 0;
  String name = '';
  String suffix = '';

  factory File.fromJson(Map<String, dynamic> json) => _$FileFromJson(json);
  Map<String, dynamic> toJson() => _$FileToJson(this);
}

@JsonSerializable(includeIfNull: false)
class User extends IdEntity{
  User();

  String loginName = '';
  String name = '';
  String phoneNumber = '';
  String phone = '';
  String email = '';
  String password = '';
  String post = '';
  String status = '';
  String roleName = '';
  bool isManager;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable(includeIfNull: false)
class Menu extends IdEntity{
  Menu();

  int parentId;
  String parentIds;
  String name;
  String ename;
  String code;
  String type;
  String url;
  String icon;
  int officeId;

  factory Menu.fromJson(Map<String, dynamic> json) => _$MenuFromJson(json);
  Map<String, dynamic> toJson() => _$MenuToJson(this);
}

@JsonSerializable(includeIfNull: false)
class Message{
  Message({
    this.id,
    this.billNo,
    this.content,
  });

  int id;
  int ruleId;
  String billNo;
  String ruleName;
  int officeId;
  int receiverId;
  int alertType;
  int createdBy;
  String createdDate;
  String content;
  String priority;
  String title;
  String receiverName;
  String createdByName;
  String officeName;
  String pName;
  String handleByName;

  factory Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);
  Map<String, dynamic> toJson() => _$MessageToJson(this);

}

@JsonSerializable(includeIfNull: false)
class Version {
  Version();

  String code;
  String remark;
  String url;
  String ver;
  String platform;

  factory Version.fromJson(Map<String, dynamic> json) => _$VersionFromJson(json);
  Map<String, dynamic> toJson() => _$VersionToJson(this);
}

@JsonSerializable(includeIfNull: false)
class TreeNode{
  TreeNode({
    this.id,
    this.text,
    this.code,
  });

  String id;
  String code;
  String pcode;
  String text;
  String iconCls;
  List<TreeNode> children;
  Map<String, dynamic> attributes;
  String isApprove;

  factory TreeNode.fromJson(Map<String, dynamic> json) => _$TreeNodeFromJson(json);
  Map<String, dynamic> toJson() => _$TreeNodeToJson(this);

}

@JsonSerializable(includeIfNull: false)
class FlowRecord extends IdEntity{

  FlowRecord();

  String taskId;
  String taskName;
  String instanceName;
  String instanceType;
  String instanceId;
  String startTime;
  String endTime;
  String officeName;

  factory FlowRecord.fromJson(Map<String, dynamic> json) => _$FlowRecordFromJson(json);
  Map<String, dynamic> toJson() => _$FlowRecordToJson(this);
}

@JsonSerializable(includeIfNull: false)
class FlowRecordDetail extends IdEntity{

  FlowRecordDetail();

  String startTime;
  String endTime;
  String duration;
  String activityName;
  String userId;
  String userName;
  String reason;
  String isAgree;
  String taskId;

  factory FlowRecordDetail.fromJson(Map<String, dynamic> json) => _$FlowRecordDetailFromJson(json);
  Map<String, dynamic> toJson() => _$FlowRecordDetailToJson(this);
}

@JsonSerializable(includeIfNull: false)
class BoqPlan extends IdEntity{

  BoqPlan();

  String processInstanceId;
  String approveStatus;
  String planNo;   //计划单号
  int officeId;   //部门id
  String planDate;   //计划日期
  String remarks;   //备注
  double amount;

  @_Converter()
  List<BoqPlanDetail> details;

  String officeName;
  String createdByName; // 制单人
  String source;
  String officeIds;
  String beginDate;
  String endDate;

  factory BoqPlan.fromJson(Map<String, dynamic> json) => _$BoqPlanFromJson(json);
  Map<String, dynamic> toJson() => _$BoqPlanToJson(this);
}

@JsonSerializable(includeIfNull: false)
class BoqPlanDetail extends IdEntity{

  BoqPlanDetail();

  int boqPlanId;   //头表id
  int materialDetailId;   //材料明细id

  String materialDetailName;
  String code;
  String type;
  String unit;
  double price;
  double amount;
  double planNum;
  double leftNum;
  String planNo;
  String remarks;

  factory BoqPlanDetail.fromJson(Map<String, dynamic> json) => _$BoqPlanDetailFromJson(json);
  Map<String, dynamic> toJson() => _$BoqPlanDetailToJson(this);
}

@JsonSerializable(includeIfNull: false)
class Input extends IdEntity{

  Input();

  String no;   //入库单号
  String category;   //分类 直收直发 正常入库
  String labType;   //入库单来源 手机app 地磅系统 系统录入
  int officeId;   //部门id
  int supplierId;   //供应商id
  String inputDate;   //到货日期
  String receiver;   //收货人
  String pics;
  String remarks;   //备注
  String status;   //收货状态
  String moneyStatus;   //货款状态
  List<InputDetail> details;

  String officeName;
  String supplierName;
  String createdByName;
  String officeIds;
  bool detailIsConfirm;   // 查询详情是否已经确认 true：筛选已确认的数据 false
  String beginDate;
  String endDate;

  factory Input.fromJson(Map<String, dynamic> json) => _$InputFromJson(json);
  Map<String, dynamic> toJson() => _$InputToJson(this);
}

@JsonSerializable(includeIfNull: false)
class InputDetail extends IdEntity{

  InputDetail();

  int inputId;   //头表id
  int planDetailId;
  int materialDetailId;   //材料明细id
  String produceArea;   //产地
  String batchNo;   //批号
  String produceDate;   //生产日期
  int warehouseId;   //仓库id
  double number;   //数量
  String carNo;   //送货车号
  String remarks;   //备注
  String isConfirm;   //材料确认:是否生效

  String warehouseName;
  String materialDetailName;
  String type;
  String unit;
  String inputNo;
  int outputReceiveWarehouseId;   // 作为保存直收直发数据的收料单位来源
  String inputDate;
  String receiver;
  double uncheckedNum;
  double stockNum;
  int contractDetailId;//对应主要材料合同详情id

  factory InputDetail.fromJson(Map<String, dynamic> json) => _$InputDetailFromJson(json);
  Map<String, dynamic> toJson() => _$InputDetailToJson(this);
}

@JsonSerializable(includeIfNull: false)
class Output extends IdEntity{

  Output();

  String no;   //出库单号
  String category;   //出库类型 退库 直收直发 正常出库
  String outputType;   //出库来源 手机app 地磅系统 系统录入
  int outputWarehouseId;   //发料仓库id
  int receiveWarehouseId;   //收料仓库id
  String outputDate;   //出库日期
  String pics;   //附件
  String remarks;   //备注
  String useTo; // 使用地点
  String receiver; // 收货人
  int projectId;   //使用地点
  String projectName; // 使用地点

  List<OutputDetail> details;
  String outputWarehouseName;
  String receiveWarehouseName;
  String outputIds;   // 根据ids获取列表
  String officeIds;
  int officeId;
  String beginDate;
  String endDate;

  factory Output.fromJson(Map<String, dynamic> json) => _$OutputFromJson(json);
  Map<String, dynamic> toJson() => _$OutputToJson(this);
}

@JsonSerializable(includeIfNull: false)
class OutputDetail extends IdEntity{

  OutputDetail();

  int outputId;   //头表id
  String outputDetailNo;   //出库单详情编号
  int inputDetailId;   //入库详情id
  int materialDetailId;   //材料明细id
  int projectId;   //工程工号id
  double number;   //数量
  String remarks;   //备注
  String materialDetailName;
  String type;
  String unit;
  String projectName;
  String produceArea;   //产地
  String batchNo;   //批号
  double stockNum;   //库存
  double backNum;   //已退库数量 退库限制是number-backNum
  String inputNo;//入库单号

  factory OutputDetail.fromJson(Map<String, dynamic> json) => _$OutputDetailFromJson(json);
  Map<String, dynamic> toJson() => _$OutputDetailToJson(this);
}

@JsonSerializable(includeIfNull: false)
class StockBack extends IdEntity{

  StockBack();

  String no;   //单号
  int outputId;
  int warehouseId;   //仓库id
  String billDate;   //退库日期
  String pics;   //附件
  String remarks;   //备注
  String operator; // 退库人

  List<StockBackDetail> details;
  String warehouseName;
  String officeName;
  String officeIds;
  int officeId;
  String beginDate;
  String endDate;

  factory StockBack.fromJson(Map<String, dynamic> json) => _$StockBackFromJson(json);
  Map<String, dynamic> toJson() => _$StockBackToJson(this);
}

@JsonSerializable(includeIfNull: false)
class StockBackDetail extends IdEntity{

  StockBackDetail();

  int backId;   //头表id
  int outputDetailId;   //入库详情id
  int materialDetailId;   //材料明细id
  double number;   //数量
  double stockNum;   //库存数量
  String remarks;   //备注
  String materialDetailName;
  String type;
  String unit;

  factory StockBackDetail.fromJson(Map<String, dynamic> json) => _$StockBackDetailFromJson(json);
  Map<String, dynamic> toJson() => _$StockBackDetailToJson(this);
}

@JsonSerializable(includeIfNull: false)
class StockAllot extends IdEntity{

  StockAllot();

  String no;   //单号
  int allotOfficeId;
  String allotOfficeName;
  int allotWarehouseId;
  String allotWarehouseName;
  String billDate;
  String operator;
  int warehouseId;
  String warehouseName;
  String pics;   //附件
  String remarks;   //备注

  List<StockAllotDetail> details;
  String officeIds;
  int officeId;
  String officeName;
  String beginDate;
  String endDate;

  factory StockAllot.fromJson(Map<String, dynamic> json) => _$StockAllotFromJson(json);
  Map<String, dynamic> toJson() => _$StockAllotToJson(this);
}

@JsonSerializable(includeIfNull: false)
class StockAllotDetail extends IdEntity{

  StockAllotDetail();

  int allotId;   //头表id
  int inputDetailId;   //入库详情id
  int materialDetailId;   //材料明细id
  int supplierId;   //材料明细id
  double number;   //数量
  double stockNum;   //库存数量
  String remarks;   //备注
  String materialDetailName;
  String type;
  String unit;
  String officeIds;

  factory StockAllotDetail.fromJson(Map<String, dynamic> json) => _$StockAllotDetailFromJson(json);
  Map<String, dynamic> toJson() => _$StockAllotDetailToJson(this);
}

@JsonSerializable(includeIfNull: false)
class Clock extends IdEntity{

  Clock();

  String address;
  String checkDate;
  double lat; // 纬度
  double lng; // 经度

  String officeIds;
  int officeId;
  String officeName;
  String beginDate;
  String endDate;

  factory Clock.fromJson(Map<String, dynamic> json) => _$ClockFromJson(json);
  Map<String, dynamic> toJson() => _$ClockToJson(this);
}

@JsonSerializable(includeIfNull: false)
class MachineBook extends IdEntity{

  MachineBook();

  String name;
  String code;
  String type;
  String driver; // 驾驶员
  String remark;
  String producePlace;
  String useType; // 使用类型：自有、月租、计时
  String manageNo; // 管理号码
  String beginDate; // 启用日期
  String endDate;   // 停用日期
  int officeId;

  String officeName;
  String createdByName;

  factory MachineBook.fromJson(Map<String, dynamic> json) => _$MachineBookFromJson(json);
  Map<String, dynamic> toJson() => _$MachineBookToJson(this);
}

@JsonSerializable(includeIfNull: false)
class MachineRefuel extends IdEntity{

  MachineRefuel();

  String writeDate; // 填报日期
  String refuelDate; // 加油日期
  int officeId;

  List<MachineRefuelDetail> details;
  String officeName;
  String createdByName;
  int machineCount;
  double refuelTotal;

  factory MachineRefuel.fromJson(Map<String, dynamic> json) => _$MachineRefuelFromJson(json);
  Map<String, dynamic> toJson() => _$MachineRefuelToJson(this);
}

@JsonSerializable(includeIfNull: false)
class MachineRefuelDetail extends IdEntity{

  MachineRefuelDetail();

  int machineRefuelId;   //头表id
  int machineId;
  double refuelNum;   // 加油数量L
  double price;   // 单价(元)
  double amount;   // 总价(元)
  String remark;   //备注

  String name;
  String type;
  String code;
  String manageNo;
  String driver;

  factory MachineRefuelDetail.fromJson(Map<String, dynamic> json) => _$MachineRefuelDetailFromJson(json);
  Map<String, dynamic> toJson() => _$MachineRefuelDetailToJson(this);
}

@JsonSerializable(includeIfNull: false)
class MachineStatus extends IdEntity{

  MachineStatus();

  String writeDate; // 填报日期
  String workDate; // 工作日期
  int officeId;

  List<MachineStatusDetail> details;
  String officeName;
  String createdByName;
  int machineCount;
  int machineWorkCount;

  factory MachineStatus.fromJson(Map<String, dynamic> json) => _$MachineStatusFromJson(json);
  Map<String, dynamic> toJson() => _$MachineStatusToJson(this);
}

@JsonSerializable(includeIfNull: false)
class MachineStatusDetail extends IdEntity{

  MachineStatusDetail();

  int machineRefuelId;   //头表id
  int machineId;
  String status;   // 工作状态：正常出勤、未出勤、维修中
  String jobPlace;   // 工作区域
  String jobContent;   // 工作内容
  String beginTime;
  String endTime;

  String name;
  String type;
  String code;
  String manageNo;
  String driver;

  factory MachineStatusDetail.fromJson(Map<String, dynamic> json) => _$MachineStatusDetailFromJson(json);
  Map<String, dynamic> toJson() => _$MachineStatusDetailToJson(this);
}

@JsonSerializable(includeIfNull: false)
class MachineRepair extends IdEntity{

  MachineRepair();

  String processInstanceId;
  String approveStatus;
  String billNo;
  String repairDate; // 维修开始日期
  String repairEndDate; // 维修结束日期
  String pics;
  int machineId;
  String repairPosition;
  double cost;
  int officeId;

  String name;
  String type;
  String code;
  String manageNo;
  String driver;
  String officeName;
  String createdByName;

  factory MachineRepair.fromJson(Map<String, dynamic> json) => _$MachineRepairFromJson(json);
  Map<String, dynamic> toJson() => _$MachineRepairToJson(this);
}


@JsonSerializable(includeIfNull: false)
class TravelExpense extends IdEntity{

  TravelExpense();

  String processInstanceId;
  String approveStatus;
  String billType;
  String billNo;
  String pics;
  String travelPlace;
  int personNum;
  String beginDate;
  String endDate;
  String applyReason;
  String applyDate;
  int officeId;

  List<TravelExpenseDetail> details;
  String officeName;
  String createdByName;
  String jobType;
  double applyAmount;
  double approvalAmount;

  factory TravelExpense.fromJson(Map<String, dynamic> json) => _$TravelExpenseFromJson(json);
  Map<String, dynamic> toJson() => _$TravelExpenseToJson(this);
}

@JsonSerializable(includeIfNull: false)
class TravelExpenseDetail extends IdEntity{

  TravelExpenseDetail();

  int travelExpenseId;   //头表id
  String category;
  int pageNum;
  double applyAmount;
  double approvalAmount;

  factory TravelExpenseDetail.fromJson(Map<String, dynamic> json) => _$TravelExpenseDetailFromJson(json);
  Map<String, dynamic> toJson() => _$TravelExpenseDetailToJson(this);
}

@JsonSerializable(includeIfNull: false)
class ManageExpense extends IdEntity{

  ManageExpense();

  String processInstanceId;
  String approveStatus;
  String no;
  String date;
  String pics;
  int pageNum;
  double applyFee;
  String applyReason;
  String place;
  int officeId;

  String officeName;
  String createdByName;

  factory ManageExpense.fromJson(Map<String, dynamic> json) => _$ManageExpenseFromJson(json);
  Map<String, dynamic> toJson() => _$ManageExpenseToJson(this);
}

@JsonSerializable(includeIfNull: false)
class ImprestExpense extends IdEntity{

  ImprestExpense();

  String processInstanceId;
  String approveStatus;
  String no;
  String date;
  double applyFee;
  String applyReason;
  String place;
  int officeId;

  String officeName;
  String createdByName;

  factory ImprestExpense.fromJson(Map<String, dynamic> json) => _$ImprestExpenseFromJson(json);
  Map<String, dynamic> toJson() => _$ImprestExpenseToJson(this);
}

/// 人机费
@JsonSerializable(includeIfNull: false)
class MachineExpense extends IdEntity{

  MachineExpense();

  double applyFee;
  String approveStatus;
  String bankName;
  String bankNo;
  String beginDate;
  String companyName;
  String date;
  String endDate;
  List<File> files;
  String memo;
  String no;
  int officeId;
  String officeIds;
  String officeName;
  String pics;
  String processInstanceId;
  String processState;
  String supplier;
  double totalFee;
  String type;
  /// 汇总的字段
  String year;
  String month;


  factory MachineExpense.fromJson(Map<String, dynamic> json) => _$MachineExpenseFromJson(json);
  Map<String, dynamic> toJson() => _$MachineExpenseToJson(this);
}

@JsonSerializable(includeIfNull: false)
class ReportInventory extends IdEntity{

  ReportInventory();

  String createdDate;
  String type;
  String materialName;
  String materialType;
  String materialUnit;
  String billDate;
  String no;
  double leftNum;
  double inNum;
  double outNum;
  double inPrice;
  double backNum;
  double allotNum;
  double leftPrice;

  factory ReportInventory.fromJson(Map<String, dynamic> json) => _$ReportInventoryFromJson(json);
  Map<String, dynamic> toJson() => _$ReportInventoryToJson(this);
}

@JsonSerializable(includeIfNull: false)
class ReportMachine{

  ReportMachine();

  String year;
  String month;
  String officeName;
  String name;
  String manageNo;
  String driver;
  String duration;
  int machineCount;
  int workDays;
  int repairDays;
  int days;
  double workRate;
  double refuelTotal;
  double refuelCost;
  int repairCount;
  double repairCost;

  factory ReportMachine.fromJson(Map<String, dynamic> json) => _$ReportMachineFromJson(json);
  Map<String, dynamic> toJson() => _$ReportMachineToJson(this);
}

@JsonSerializable(includeIfNull: false)
class ReportExpense{

  ReportExpense();

  String year;
  String month;
  String officeName;
  String createBy;
  int officeId;
  double travelExpense;
  double manageExpense;
  double imprestExpense;
  double pageNum;

  factory ReportExpense.fromJson(Map<String, dynamic> json) => _$ReportExpenseFromJson(json);
  Map<String, dynamic> toJson() => _$ReportExpenseToJson(this);
}

@JsonSerializable(includeIfNull: false)
class Office extends IdEntity{

  Office({this.name = ''});

  Office parent;	// 父级编号
  String parentIds; // 所有父级编号
  String name; 	// 机构名称
  String shortName; 	// 简称
  String code; 	// 机构编码
  String type; 	// 机构类型（集团公司、集团分公司、项目部、项目部门）
  String address; // 联系地址
  String zipCode; // 邮政编码
//  User master; 	// 负责人
  String phone; 	// 电话
  String fax; 	// 传真
  String email; 	// 邮箱
  double lng; // 经度
  double lat; // 纬度
  int sort;	//排序
  String xymCode;	//物料验收系统部门编码
  int carsId;	//十三局数据id
  String projectNo;	//项目编号
  String customId; // 第三方平台唯一标示
  String belongId; // 第三方平台父级id
  String remarks; // 备注

  factory Office.fromJson(Map<String, dynamic> json) => _$OfficeFromJson(json);
  Map<String, dynamic> toJson() => _$OfficeToJson(this);
}

@JsonSerializable(includeIfNull: false)
class Supplier extends IdEntity{

  Supplier({this.name = ''});

  String name;   //供应商
  int categoryId;//供应商类别id
  int purchaseWayId;//采购方式id
  int propertyId;//供应商属性id
  String businessLicence;//营业执照编号
  String address;   //详细地址资
  double registrationCapital;   //注册本
  String contactsName;   //联系人
  String contactsPhone;   //联系电话
  String cooperationProject;//合作项目
  String evaluate;//供应商评价

  String legalRepresentative;   //公司法人
  String idCard;//身份证号
  String forbiddenLevel;   //黑名单等级 绿(不限定) 黑 黄 灰
  int officeId;   //部门id
  String reportOffice;   //上报单位
  String region;   //区域
  String reportTime;   //发布时间
  String remarks;   //备注

  String selectWay;   //选定方式
  String materialName;   //供应物资类别
  String officialWeb;   //官网或微信公众号
  String bankName;   //开户行
  String bankAccount;   //开户行账号
  String legalRepresentativePhone;   //法人联系电话
  String contactsPosition;   //联系人职务
  String qqOrEmails;   //qq或邮箱
  String fixedPhone;   //固话/传真
  String agentManufacturer;   //代理制造商
  String businessRegistrationNo;   //工商注册号
  String organizationalNo;   //组织机构代码
  String registrationDate;   //成立日期
  String aptitudeLevel;   //资质等级
  String companyCategory;   //公司类别
  String taxpayerNumber;   //税务登记号
  String taxpayerLevel;   //纳税人等级
  int staffNum;   //职工数
  String supplyAbility;   //生产或供应能力
  double transDistance;   //运距
  String twoYearTurnover;   //公司经营范围和近两年营业额
  String mainBrand;   //主要产品品牌
  String qualityCertification;   //质量认证体系和机构
  String productionLicenseNo;   //生产许可证获证情况和编号
  String recentYearCustomer;   //近年主要客户和业绩
  String pics;   //图片


  String officeName;
  String createdByName;
  String officeIds;
  String allForbidden; //获取所有黑名单
  String property;//供应商属性
  String purchaseWay;//采购方式
  String category;//供应商类别


  factory Supplier.fromJson(Map<String, dynamic> json) => _$SupplierFromJson(json);
  Map<String, dynamic> toJson() => _$SupplierToJson(this);
}

@JsonSerializable(includeIfNull: false)
class MaterialDetail extends IdEntity{

  MaterialDetail();

  String conversionRatio;
  String officeName;
  String code;
  String materialCode;
  String subject;
  String computerCode;
  String description;
  String sort;
  String type;
  int materialId;
  String customId;
  String materialName;
  String materialDetailName;
  String unit;
  String isConcrete;
  double lossRatio;
  @JsonKey(
      name: 'officeId',
      fromJson: fmtOffice
      )
  int officeId;
  String price;
  int materialDetailId;
  String name;
  String warningNum;
  String category;
  String isRatio;
  String allSubject;
  String isLimit;
  String isEffective;
  String isApprove;
  String approveStatus;
  double leftNum; // 采购计划选择页面有用到
  double usedNum; // 采购计划选择页面有用到
  double actualNum; // 采购计划选择页面有用到

  /// 有些接口officeId返回字符串
  static int fmtOffice(dynamic e){
    return e is int? e: int.tryParse(e??'');
  }

  factory MaterialDetail.fromJson(Map<String, dynamic> json) => _$MaterialDetailFromJson(json);
  Map<String, dynamic> toJson() => _$MaterialDetailToJson(this);
}

@JsonSerializable(includeIfNull: false)
class Warehouse extends IdEntity{

  Warehouse();

  String name;   //仓库名称
  String address;   //仓库地点
  int officeId;   //所属部门id
  String officeName;   //所属部门id
  String type;   //仓库类型 虚拟仓库 存放型仓库(页面新增默认类型) 作业队型仓库
  String isFactory;   //仓库对应的作业队是否加工场
  String remarks;   //备注


  factory Warehouse.fromJson(Map<String, dynamic> json) => _$WarehouseFromJson(json);
  Map<String, dynamic> toJson() => _$WarehouseToJson(this);
}

@JsonSerializable(includeIfNull: false)
class Dict extends IdEntity{

  Dict();

  String description;
  int grade;
  String label;
  int officeId;
  String onOff;
  int parentId;
  String parentIds;
  String remarks;
  String sort;
  String type;
  String value;

  factory Dict.fromJson(Map<String, dynamic> json) => _$DictFromJson(json);
  Map<String, dynamic> toJson() => _$DictToJson(this);
}


