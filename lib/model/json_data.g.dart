// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'json_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyPage<T> _$MyPageFromJson<T>(Map<String, dynamic> json) {
  return MyPage<T>(
    params: json['params'] as Map<String, dynamic>,
    rows: (json['rows'] as List)?.map(_Converter<T>().fromJson)?.toList(),
  )
    ..pageNo = json['pageNo'] as int
    ..pageSize = json['pageSize'] as int
    ..totalCount = json['totalCount'] as int
    ..totalPages = json['totalPages'] as int;
}

Map<String, dynamic> _$MyPageToJson<T>(MyPage<T> instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('params', instance.params);
  writeNotNull('pageNo', instance.pageNo);
  writeNotNull('pageSize', instance.pageSize);
  writeNotNull('totalCount', instance.totalCount);
  writeNotNull('totalPages', instance.totalPages);
  writeNotNull('rows', instance.rows?.map(_Converter<T>().toJson)?.toList());
  return val;
}

IdEntity _$IdEntityFromJson(Map<String, dynamic> json) {
  return IdEntity()
    ..id = json['id'] as int
    ..delFlag = json['delFlag'] as int
    ..createdBy = json['createdBy'] as int
    ..createdByName = json['createdByName'] as String
    ..createdDate = json['createdDate'] as String;
}

Map<String, dynamic> _$IdEntityToJson(IdEntity instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('delFlag', instance.delFlag);
  writeNotNull('createdBy', instance.createdBy);
  writeNotNull('createdByName', instance.createdByName);
  writeNotNull('createdDate', instance.createdDate);
  return val;
}

File _$FileFromJson(Map<String, dynamic> json) {
  return File()
    ..id = json['id'] as int
    ..delFlag = json['delFlag'] as int
    ..createdBy = json['createdBy'] as int
    ..createdByName = json['createdByName'] as String
    ..createdDate = json['createdDate'] as String
    ..bytes = json['bytes'] as String
    ..contentType = json['contentType'] as String
    ..dimension = json['dimension'] as String
    ..fileName = json['fileName'] as String
    ..fileSize = (json['fileSize'] as num)?.toDouble()
    ..fileUrl = json['fileUrl'] as String
    ..height = (json['height'] as num)?.toDouble()
    ..width = (json['width'] as num)?.toDouble()
    ..name = json['name'] as String
    ..suffix = json['suffix'] as String;
}

Map<String, dynamic> _$FileToJson(File instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('delFlag', instance.delFlag);
  writeNotNull('createdBy', instance.createdBy);
  writeNotNull('createdByName', instance.createdByName);
  writeNotNull('createdDate', instance.createdDate);
  writeNotNull('bytes', instance.bytes);
  writeNotNull('contentType', instance.contentType);
  writeNotNull('dimension', instance.dimension);
  writeNotNull('fileName', instance.fileName);
  writeNotNull('fileSize', instance.fileSize);
  writeNotNull('fileUrl', instance.fileUrl);
  writeNotNull('height', instance.height);
  writeNotNull('width', instance.width);
  writeNotNull('name', instance.name);
  writeNotNull('suffix', instance.suffix);
  return val;
}

User _$UserFromJson(Map<String, dynamic> json) {
  return User()
    ..id = json['id'] as int
    ..delFlag = json['delFlag'] as int
    ..createdBy = json['createdBy'] as int
    ..createdByName = json['createdByName'] as String
    ..createdDate = json['createdDate'] as String
    ..loginName = json['loginName'] as String
    ..name = json['name'] as String
    ..phoneNumber = json['phoneNumber'] as String
    ..phone = json['phone'] as String
    ..email = json['email'] as String
    ..password = json['password'] as String
    ..post = json['post'] as String
    ..status = json['status'] as String
    ..roleName = json['roleName'] as String
    ..isManager = json['isManager'] as bool;
}

Map<String, dynamic> _$UserToJson(User instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('delFlag', instance.delFlag);
  writeNotNull('createdBy', instance.createdBy);
  writeNotNull('createdByName', instance.createdByName);
  writeNotNull('createdDate', instance.createdDate);
  writeNotNull('loginName', instance.loginName);
  writeNotNull('name', instance.name);
  writeNotNull('phoneNumber', instance.phoneNumber);
  writeNotNull('phone', instance.phone);
  writeNotNull('email', instance.email);
  writeNotNull('password', instance.password);
  writeNotNull('post', instance.post);
  writeNotNull('status', instance.status);
  writeNotNull('roleName', instance.roleName);
  writeNotNull('isManager', instance.isManager);
  return val;
}

Menu _$MenuFromJson(Map<String, dynamic> json) {
  return Menu()
    ..id = json['id'] as int
    ..delFlag = json['delFlag'] as int
    ..createdBy = json['createdBy'] as int
    ..createdByName = json['createdByName'] as String
    ..createdDate = json['createdDate'] as String
    ..parentId = json['parentId'] as int
    ..parentIds = json['parentIds'] as String
    ..name = json['name'] as String
    ..ename = json['ename'] as String
    ..code = json['code'] as String
    ..type = json['type'] as String
    ..url = json['url'] as String
    ..icon = json['icon'] as String
    ..officeId = json['officeId'] as int;
}

Map<String, dynamic> _$MenuToJson(Menu instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('delFlag', instance.delFlag);
  writeNotNull('createdBy', instance.createdBy);
  writeNotNull('createdByName', instance.createdByName);
  writeNotNull('createdDate', instance.createdDate);
  writeNotNull('parentId', instance.parentId);
  writeNotNull('parentIds', instance.parentIds);
  writeNotNull('name', instance.name);
  writeNotNull('ename', instance.ename);
  writeNotNull('code', instance.code);
  writeNotNull('type', instance.type);
  writeNotNull('url', instance.url);
  writeNotNull('icon', instance.icon);
  writeNotNull('officeId', instance.officeId);
  return val;
}

Message _$MessageFromJson(Map<String, dynamic> json) {
  return Message(
    id: json['id'] as int,
    billNo: json['billNo'] as String,
    content: json['content'] as String,
  )
    ..ruleId = json['ruleId'] as int
    ..ruleName = json['ruleName'] as String
    ..officeId = json['officeId'] as int
    ..receiverId = json['receiverId'] as int
    ..alertType = json['alertType'] as int
    ..createdBy = json['createdBy'] as int
    ..createdDate = json['createdDate'] as String
    ..priority = json['priority'] as String
    ..title = json['title'] as String
    ..receiverName = json['receiverName'] as String
    ..createdByName = json['createdByName'] as String
    ..officeName = json['officeName'] as String
    ..pName = json['pName'] as String
    ..handleByName = json['handleByName'] as String;
}

Map<String, dynamic> _$MessageToJson(Message instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('ruleId', instance.ruleId);
  writeNotNull('billNo', instance.billNo);
  writeNotNull('ruleName', instance.ruleName);
  writeNotNull('officeId', instance.officeId);
  writeNotNull('receiverId', instance.receiverId);
  writeNotNull('alertType', instance.alertType);
  writeNotNull('createdBy', instance.createdBy);
  writeNotNull('createdDate', instance.createdDate);
  writeNotNull('content', instance.content);
  writeNotNull('priority', instance.priority);
  writeNotNull('title', instance.title);
  writeNotNull('receiverName', instance.receiverName);
  writeNotNull('createdByName', instance.createdByName);
  writeNotNull('officeName', instance.officeName);
  writeNotNull('pName', instance.pName);
  writeNotNull('handleByName', instance.handleByName);
  return val;
}

Version _$VersionFromJson(Map<String, dynamic> json) {
  return Version()
    ..code = json['code'] as String
    ..remark = json['remark'] as String
    ..url = json['url'] as String
    ..ver = json['ver'] as String
    ..platform = json['platform'] as String;
}

Map<String, dynamic> _$VersionToJson(Version instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('code', instance.code);
  writeNotNull('remark', instance.remark);
  writeNotNull('url', instance.url);
  writeNotNull('ver', instance.ver);
  writeNotNull('platform', instance.platform);
  return val;
}

TreeNode _$TreeNodeFromJson(Map<String, dynamic> json) {
  return TreeNode(
    id: json['id'] as String,
    text: json['text'] as String,
    code: json['code'] as String,
  )
    ..pcode = json['pcode'] as String
    ..iconCls = json['iconCls'] as String
    ..children = (json['children'] as List)
        ?.map((e) =>
            e == null ? null : TreeNode.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..attributes = json['attributes'] as Map<String, dynamic>
    ..isApprove = json['isApprove'] as String;
}

Map<String, dynamic> _$TreeNodeToJson(TreeNode instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('code', instance.code);
  writeNotNull('pcode', instance.pcode);
  writeNotNull('text', instance.text);
  writeNotNull('iconCls', instance.iconCls);
  writeNotNull('children', instance.children);
  writeNotNull('attributes', instance.attributes);
  writeNotNull('isApprove', instance.isApprove);
  return val;
}

FlowRecord _$FlowRecordFromJson(Map<String, dynamic> json) {
  return FlowRecord()
    ..id = json['id'] as int
    ..delFlag = json['delFlag'] as int
    ..createdBy = json['createdBy'] as int
    ..createdByName = json['createdByName'] as String
    ..createdDate = json['createdDate'] as String
    ..taskId = json['taskId'] as String
    ..taskName = json['taskName'] as String
    ..instanceName = json['instanceName'] as String
    ..instanceType = json['instanceType'] as String
    ..instanceId = json['instanceId'] as String
    ..startTime = json['startTime'] as String
    ..endTime = json['endTime'] as String
    ..officeName = json['officeName'] as String;
}

Map<String, dynamic> _$FlowRecordToJson(FlowRecord instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('delFlag', instance.delFlag);
  writeNotNull('createdBy', instance.createdBy);
  writeNotNull('createdByName', instance.createdByName);
  writeNotNull('createdDate', instance.createdDate);
  writeNotNull('taskId', instance.taskId);
  writeNotNull('taskName', instance.taskName);
  writeNotNull('instanceName', instance.instanceName);
  writeNotNull('instanceType', instance.instanceType);
  writeNotNull('instanceId', instance.instanceId);
  writeNotNull('startTime', instance.startTime);
  writeNotNull('endTime', instance.endTime);
  writeNotNull('officeName', instance.officeName);
  return val;
}

FlowRecordDetail _$FlowRecordDetailFromJson(Map<String, dynamic> json) {
  return FlowRecordDetail()
    ..id = json['id'] as int
    ..delFlag = json['delFlag'] as int
    ..createdBy = json['createdBy'] as int
    ..createdByName = json['createdByName'] as String
    ..createdDate = json['createdDate'] as String
    ..startTime = json['startTime'] as String
    ..endTime = json['endTime'] as String
    ..duration = json['duration'] as String
    ..activityName = json['activityName'] as String
    ..userId = json['userId'] as String
    ..userName = json['userName'] as String
    ..reason = json['reason'] as String
    ..isAgree = json['isAgree'] as String
    ..taskId = json['taskId'] as String;
}

Map<String, dynamic> _$FlowRecordDetailToJson(FlowRecordDetail instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('delFlag', instance.delFlag);
  writeNotNull('createdBy', instance.createdBy);
  writeNotNull('createdByName', instance.createdByName);
  writeNotNull('createdDate', instance.createdDate);
  writeNotNull('startTime', instance.startTime);
  writeNotNull('endTime', instance.endTime);
  writeNotNull('duration', instance.duration);
  writeNotNull('activityName', instance.activityName);
  writeNotNull('userId', instance.userId);
  writeNotNull('userName', instance.userName);
  writeNotNull('reason', instance.reason);
  writeNotNull('isAgree', instance.isAgree);
  writeNotNull('taskId', instance.taskId);
  return val;
}

BoqPlan _$BoqPlanFromJson(Map<String, dynamic> json) {
  return BoqPlan()
    ..id = json['id'] as int
    ..delFlag = json['delFlag'] as int
    ..createdBy = json['createdBy'] as int
    ..createdDate = json['createdDate'] as String
    ..processInstanceId = json['processInstanceId'] as String
    ..approveStatus = json['approveStatus'] as String
    ..planNo = json['planNo'] as String
    ..officeId = json['officeId'] as int
    ..planDate = json['planDate'] as String
    ..remarks = json['remarks'] as String
    ..amount = (json['amount'] as num)?.toDouble()
    ..details = (json['details'] as List)
        ?.map((e) => e == null
            ? null
            : BoqPlanDetail.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..officeName = json['officeName'] as String
    ..createdByName = json['createdByName'] as String
    ..source = json['source'] as String
    ..officeIds = json['officeIds'] as String
    ..beginDate = json['beginDate'] as String
    ..endDate = json['endDate'] as String;
}

Map<String, dynamic> _$BoqPlanToJson(BoqPlan instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('delFlag', instance.delFlag);
  writeNotNull('createdBy', instance.createdBy);
  writeNotNull('createdDate', instance.createdDate);
  writeNotNull('processInstanceId', instance.processInstanceId);
  writeNotNull('approveStatus', instance.approveStatus);
  writeNotNull('planNo', instance.planNo);
  writeNotNull('officeId', instance.officeId);
  writeNotNull('planDate', instance.planDate);
  writeNotNull('remarks', instance.remarks);
  writeNotNull('amount', instance.amount);
  writeNotNull('details', instance.details);
  writeNotNull('officeName', instance.officeName);
  writeNotNull('createdByName', instance.createdByName);
  writeNotNull('source', instance.source);
  writeNotNull('officeIds', instance.officeIds);
  writeNotNull('beginDate', instance.beginDate);
  writeNotNull('endDate', instance.endDate);
  return val;
}

BoqPlanDetail _$BoqPlanDetailFromJson(Map<String, dynamic> json) {
  return BoqPlanDetail()
    ..id = json['id'] as int
    ..delFlag = json['delFlag'] as int
    ..createdBy = json['createdBy'] as int
    ..createdByName = json['createdByName'] as String
    ..createdDate = json['createdDate'] as String
    ..boqPlanId = json['boqPlanId'] as int
    ..materialDetailId = json['materialDetailId'] as int
    ..materialDetailName = json['materialDetailName'] as String
    ..code = json['code'] as String
    ..type = json['type'] as String
    ..unit = json['unit'] as String
    ..price = (json['price'] as num)?.toDouble()
    ..amount = (json['amount'] as num)?.toDouble()
    ..planNum = (json['planNum'] as num)?.toDouble()
    ..leftNum = (json['leftNum'] as num)?.toDouble()
    ..planNo = json['planNo'] as String
    ..remarks = json['remarks'] as String;
}

Map<String, dynamic> _$BoqPlanDetailToJson(BoqPlanDetail instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('delFlag', instance.delFlag);
  writeNotNull('createdBy', instance.createdBy);
  writeNotNull('createdByName', instance.createdByName);
  writeNotNull('createdDate', instance.createdDate);
  writeNotNull('boqPlanId', instance.boqPlanId);
  writeNotNull('materialDetailId', instance.materialDetailId);
  writeNotNull('materialDetailName', instance.materialDetailName);
  writeNotNull('code', instance.code);
  writeNotNull('type', instance.type);
  writeNotNull('unit', instance.unit);
  writeNotNull('price', instance.price);
  writeNotNull('amount', instance.amount);
  writeNotNull('planNum', instance.planNum);
  writeNotNull('leftNum', instance.leftNum);
  writeNotNull('planNo', instance.planNo);
  writeNotNull('remarks', instance.remarks);
  return val;
}

Input _$InputFromJson(Map<String, dynamic> json) {
  return Input()
    ..id = json['id'] as int
    ..delFlag = json['delFlag'] as int
    ..createdBy = json['createdBy'] as int
    ..createdDate = json['createdDate'] as String
    ..no = json['no'] as String
    ..category = json['category'] as String
    ..labType = json['labType'] as String
    ..officeId = json['officeId'] as int
    ..supplierId = json['supplierId'] as int
    ..inputDate = json['inputDate'] as String
    ..receiver = json['receiver'] as String
    ..pics = json['pics'] as String
    ..remarks = json['remarks'] as String
    ..status = json['status'] as String
    ..moneyStatus = json['moneyStatus'] as String
    ..details = (json['details'] as List)
        ?.map((e) =>
            e == null ? null : InputDetail.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..officeName = json['officeName'] as String
    ..supplierName = json['supplierName'] as String
    ..createdByName = json['createdByName'] as String
    ..officeIds = json['officeIds'] as String
    ..detailIsConfirm = json['detailIsConfirm'] as bool
    ..beginDate = json['beginDate'] as String
    ..endDate = json['endDate'] as String;
}

Map<String, dynamic> _$InputToJson(Input instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('delFlag', instance.delFlag);
  writeNotNull('createdBy', instance.createdBy);
  writeNotNull('createdDate', instance.createdDate);
  writeNotNull('no', instance.no);
  writeNotNull('category', instance.category);
  writeNotNull('labType', instance.labType);
  writeNotNull('officeId', instance.officeId);
  writeNotNull('supplierId', instance.supplierId);
  writeNotNull('inputDate', instance.inputDate);
  writeNotNull('receiver', instance.receiver);
  writeNotNull('pics', instance.pics);
  writeNotNull('remarks', instance.remarks);
  writeNotNull('status', instance.status);
  writeNotNull('moneyStatus', instance.moneyStatus);
  writeNotNull('details', instance.details);
  writeNotNull('officeName', instance.officeName);
  writeNotNull('supplierName', instance.supplierName);
  writeNotNull('createdByName', instance.createdByName);
  writeNotNull('officeIds', instance.officeIds);
  writeNotNull('detailIsConfirm', instance.detailIsConfirm);
  writeNotNull('beginDate', instance.beginDate);
  writeNotNull('endDate', instance.endDate);
  return val;
}

InputDetail _$InputDetailFromJson(Map<String, dynamic> json) {
  return InputDetail()
    ..id = json['id'] as int
    ..delFlag = json['delFlag'] as int
    ..createdBy = json['createdBy'] as int
    ..createdByName = json['createdByName'] as String
    ..createdDate = json['createdDate'] as String
    ..inputId = json['inputId'] as int
    ..planDetailId = json['planDetailId'] as int
    ..materialDetailId = json['materialDetailId'] as int
    ..produceArea = json['produceArea'] as String
    ..batchNo = json['batchNo'] as String
    ..produceDate = json['produceDate'] as String
    ..warehouseId = json['warehouseId'] as int
    ..number = (json['number'] as num)?.toDouble()
    ..carNo = json['carNo'] as String
    ..remarks = json['remarks'] as String
    ..isConfirm = json['isConfirm'] as String
    ..warehouseName = json['warehouseName'] as String
    ..materialDetailName = json['materialDetailName'] as String
    ..type = json['type'] as String
    ..unit = json['unit'] as String
    ..inputNo = json['inputNo'] as String
    ..outputReceiveWarehouseId = json['outputReceiveWarehouseId'] as int
    ..inputDate = json['inputDate'] as String
    ..receiver = json['receiver'] as String
    ..uncheckedNum = (json['uncheckedNum'] as num)?.toDouble()
    ..stockNum = (json['stockNum'] as num)?.toDouble()
    ..contractDetailId = json['contractDetailId'] as int;
}

Map<String, dynamic> _$InputDetailToJson(InputDetail instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('delFlag', instance.delFlag);
  writeNotNull('createdBy', instance.createdBy);
  writeNotNull('createdByName', instance.createdByName);
  writeNotNull('createdDate', instance.createdDate);
  writeNotNull('inputId', instance.inputId);
  writeNotNull('planDetailId', instance.planDetailId);
  writeNotNull('materialDetailId', instance.materialDetailId);
  writeNotNull('produceArea', instance.produceArea);
  writeNotNull('batchNo', instance.batchNo);
  writeNotNull('produceDate', instance.produceDate);
  writeNotNull('warehouseId', instance.warehouseId);
  writeNotNull('number', instance.number);
  writeNotNull('carNo', instance.carNo);
  writeNotNull('remarks', instance.remarks);
  writeNotNull('isConfirm', instance.isConfirm);
  writeNotNull('warehouseName', instance.warehouseName);
  writeNotNull('materialDetailName', instance.materialDetailName);
  writeNotNull('type', instance.type);
  writeNotNull('unit', instance.unit);
  writeNotNull('inputNo', instance.inputNo);
  writeNotNull('outputReceiveWarehouseId', instance.outputReceiveWarehouseId);
  writeNotNull('inputDate', instance.inputDate);
  writeNotNull('receiver', instance.receiver);
  writeNotNull('uncheckedNum', instance.uncheckedNum);
  writeNotNull('stockNum', instance.stockNum);
  writeNotNull('contractDetailId', instance.contractDetailId);
  return val;
}

Output _$OutputFromJson(Map<String, dynamic> json) {
  return Output()
    ..id = json['id'] as int
    ..delFlag = json['delFlag'] as int
    ..createdBy = json['createdBy'] as int
    ..createdByName = json['createdByName'] as String
    ..createdDate = json['createdDate'] as String
    ..no = json['no'] as String
    ..category = json['category'] as String
    ..outputType = json['outputType'] as String
    ..outputWarehouseId = json['outputWarehouseId'] as int
    ..receiveWarehouseId = json['receiveWarehouseId'] as int
    ..outputDate = json['outputDate'] as String
    ..pics = json['pics'] as String
    ..remarks = json['remarks'] as String
    ..useTo = json['useTo'] as String
    ..receiver = json['receiver'] as String
    ..projectId = json['projectId'] as int
    ..projectName = json['projectName'] as String
    ..details = (json['details'] as List)
        ?.map((e) =>
            e == null ? null : OutputDetail.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..outputWarehouseName = json['outputWarehouseName'] as String
    ..receiveWarehouseName = json['receiveWarehouseName'] as String
    ..outputIds = json['outputIds'] as String
    ..officeIds = json['officeIds'] as String
    ..officeId = json['officeId'] as int
    ..beginDate = json['beginDate'] as String
    ..endDate = json['endDate'] as String;
}

Map<String, dynamic> _$OutputToJson(Output instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('delFlag', instance.delFlag);
  writeNotNull('createdBy', instance.createdBy);
  writeNotNull('createdByName', instance.createdByName);
  writeNotNull('createdDate', instance.createdDate);
  writeNotNull('no', instance.no);
  writeNotNull('category', instance.category);
  writeNotNull('outputType', instance.outputType);
  writeNotNull('outputWarehouseId', instance.outputWarehouseId);
  writeNotNull('receiveWarehouseId', instance.receiveWarehouseId);
  writeNotNull('outputDate', instance.outputDate);
  writeNotNull('pics', instance.pics);
  writeNotNull('remarks', instance.remarks);
  writeNotNull('useTo', instance.useTo);
  writeNotNull('receiver', instance.receiver);
  writeNotNull('projectId', instance.projectId);
  writeNotNull('projectName', instance.projectName);
  writeNotNull('details', instance.details);
  writeNotNull('outputWarehouseName', instance.outputWarehouseName);
  writeNotNull('receiveWarehouseName', instance.receiveWarehouseName);
  writeNotNull('outputIds', instance.outputIds);
  writeNotNull('officeIds', instance.officeIds);
  writeNotNull('officeId', instance.officeId);
  writeNotNull('beginDate', instance.beginDate);
  writeNotNull('endDate', instance.endDate);
  return val;
}

OutputDetail _$OutputDetailFromJson(Map<String, dynamic> json) {
  return OutputDetail()
    ..id = json['id'] as int
    ..delFlag = json['delFlag'] as int
    ..createdBy = json['createdBy'] as int
    ..createdByName = json['createdByName'] as String
    ..createdDate = json['createdDate'] as String
    ..outputId = json['outputId'] as int
    ..outputDetailNo = json['outputDetailNo'] as String
    ..inputDetailId = json['inputDetailId'] as int
    ..materialDetailId = json['materialDetailId'] as int
    ..projectId = json['projectId'] as int
    ..number = (json['number'] as num)?.toDouble()
    ..remarks = json['remarks'] as String
    ..materialDetailName = json['materialDetailName'] as String
    ..type = json['type'] as String
    ..unit = json['unit'] as String
    ..projectName = json['projectName'] as String
    ..produceArea = json['produceArea'] as String
    ..batchNo = json['batchNo'] as String
    ..stockNum = (json['stockNum'] as num)?.toDouble()
    ..backNum = (json['backNum'] as num)?.toDouble()
    ..inputNo = json['inputNo'] as String;
}

Map<String, dynamic> _$OutputDetailToJson(OutputDetail instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('delFlag', instance.delFlag);
  writeNotNull('createdBy', instance.createdBy);
  writeNotNull('createdByName', instance.createdByName);
  writeNotNull('createdDate', instance.createdDate);
  writeNotNull('outputId', instance.outputId);
  writeNotNull('outputDetailNo', instance.outputDetailNo);
  writeNotNull('inputDetailId', instance.inputDetailId);
  writeNotNull('materialDetailId', instance.materialDetailId);
  writeNotNull('projectId', instance.projectId);
  writeNotNull('number', instance.number);
  writeNotNull('remarks', instance.remarks);
  writeNotNull('materialDetailName', instance.materialDetailName);
  writeNotNull('type', instance.type);
  writeNotNull('unit', instance.unit);
  writeNotNull('projectName', instance.projectName);
  writeNotNull('produceArea', instance.produceArea);
  writeNotNull('batchNo', instance.batchNo);
  writeNotNull('stockNum', instance.stockNum);
  writeNotNull('backNum', instance.backNum);
  writeNotNull('inputNo', instance.inputNo);
  return val;
}

StockBack _$StockBackFromJson(Map<String, dynamic> json) {
  return StockBack()
    ..id = json['id'] as int
    ..delFlag = json['delFlag'] as int
    ..createdBy = json['createdBy'] as int
    ..createdByName = json['createdByName'] as String
    ..createdDate = json['createdDate'] as String
    ..no = json['no'] as String
    ..outputId = json['outputId'] as int
    ..warehouseId = json['warehouseId'] as int
    ..billDate = json['billDate'] as String
    ..pics = json['pics'] as String
    ..remarks = json['remarks'] as String
    ..operator = json['operator'] as String
    ..details = (json['details'] as List)
        ?.map((e) => e == null
            ? null
            : StockBackDetail.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..warehouseName = json['warehouseName'] as String
    ..officeName = json['officeName'] as String
    ..officeIds = json['officeIds'] as String
    ..officeId = json['officeId'] as int
    ..beginDate = json['beginDate'] as String
    ..endDate = json['endDate'] as String;
}

Map<String, dynamic> _$StockBackToJson(StockBack instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('delFlag', instance.delFlag);
  writeNotNull('createdBy', instance.createdBy);
  writeNotNull('createdByName', instance.createdByName);
  writeNotNull('createdDate', instance.createdDate);
  writeNotNull('no', instance.no);
  writeNotNull('outputId', instance.outputId);
  writeNotNull('warehouseId', instance.warehouseId);
  writeNotNull('billDate', instance.billDate);
  writeNotNull('pics', instance.pics);
  writeNotNull('remarks', instance.remarks);
  writeNotNull('operator', instance.operator);
  writeNotNull('details', instance.details);
  writeNotNull('warehouseName', instance.warehouseName);
  writeNotNull('officeName', instance.officeName);
  writeNotNull('officeIds', instance.officeIds);
  writeNotNull('officeId', instance.officeId);
  writeNotNull('beginDate', instance.beginDate);
  writeNotNull('endDate', instance.endDate);
  return val;
}

StockBackDetail _$StockBackDetailFromJson(Map<String, dynamic> json) {
  return StockBackDetail()
    ..id = json['id'] as int
    ..delFlag = json['delFlag'] as int
    ..createdBy = json['createdBy'] as int
    ..createdByName = json['createdByName'] as String
    ..createdDate = json['createdDate'] as String
    ..backId = json['backId'] as int
    ..outputDetailId = json['outputDetailId'] as int
    ..materialDetailId = json['materialDetailId'] as int
    ..number = (json['number'] as num)?.toDouble()
    ..stockNum = (json['stockNum'] as num)?.toDouble()
    ..remarks = json['remarks'] as String
    ..materialDetailName = json['materialDetailName'] as String
    ..type = json['type'] as String
    ..unit = json['unit'] as String;
}

Map<String, dynamic> _$StockBackDetailToJson(StockBackDetail instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('delFlag', instance.delFlag);
  writeNotNull('createdBy', instance.createdBy);
  writeNotNull('createdByName', instance.createdByName);
  writeNotNull('createdDate', instance.createdDate);
  writeNotNull('backId', instance.backId);
  writeNotNull('outputDetailId', instance.outputDetailId);
  writeNotNull('materialDetailId', instance.materialDetailId);
  writeNotNull('number', instance.number);
  writeNotNull('stockNum', instance.stockNum);
  writeNotNull('remarks', instance.remarks);
  writeNotNull('materialDetailName', instance.materialDetailName);
  writeNotNull('type', instance.type);
  writeNotNull('unit', instance.unit);
  return val;
}

StockAllot _$StockAllotFromJson(Map<String, dynamic> json) {
  return StockAllot()
    ..id = json['id'] as int
    ..delFlag = json['delFlag'] as int
    ..createdBy = json['createdBy'] as int
    ..createdByName = json['createdByName'] as String
    ..createdDate = json['createdDate'] as String
    ..no = json['no'] as String
    ..allotOfficeId = json['allotOfficeId'] as int
    ..allotOfficeName = json['allotOfficeName'] as String
    ..allotWarehouseId = json['allotWarehouseId'] as int
    ..allotWarehouseName = json['allotWarehouseName'] as String
    ..billDate = json['billDate'] as String
    ..operator = json['operator'] as String
    ..warehouseId = json['warehouseId'] as int
    ..warehouseName = json['warehouseName'] as String
    ..pics = json['pics'] as String
    ..remarks = json['remarks'] as String
    ..details = (json['details'] as List)
        ?.map((e) => e == null
            ? null
            : StockAllotDetail.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..officeIds = json['officeIds'] as String
    ..officeId = json['officeId'] as int
    ..officeName = json['officeName'] as String
    ..beginDate = json['beginDate'] as String
    ..endDate = json['endDate'] as String;
}

Map<String, dynamic> _$StockAllotToJson(StockAllot instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('delFlag', instance.delFlag);
  writeNotNull('createdBy', instance.createdBy);
  writeNotNull('createdByName', instance.createdByName);
  writeNotNull('createdDate', instance.createdDate);
  writeNotNull('no', instance.no);
  writeNotNull('allotOfficeId', instance.allotOfficeId);
  writeNotNull('allotOfficeName', instance.allotOfficeName);
  writeNotNull('allotWarehouseId', instance.allotWarehouseId);
  writeNotNull('allotWarehouseName', instance.allotWarehouseName);
  writeNotNull('billDate', instance.billDate);
  writeNotNull('operator', instance.operator);
  writeNotNull('warehouseId', instance.warehouseId);
  writeNotNull('warehouseName', instance.warehouseName);
  writeNotNull('pics', instance.pics);
  writeNotNull('remarks', instance.remarks);
  writeNotNull('details', instance.details);
  writeNotNull('officeIds', instance.officeIds);
  writeNotNull('officeId', instance.officeId);
  writeNotNull('officeName', instance.officeName);
  writeNotNull('beginDate', instance.beginDate);
  writeNotNull('endDate', instance.endDate);
  return val;
}

StockAllotDetail _$StockAllotDetailFromJson(Map<String, dynamic> json) {
  return StockAllotDetail()
    ..id = json['id'] as int
    ..delFlag = json['delFlag'] as int
    ..createdBy = json['createdBy'] as int
    ..createdByName = json['createdByName'] as String
    ..createdDate = json['createdDate'] as String
    ..allotId = json['allotId'] as int
    ..inputDetailId = json['inputDetailId'] as int
    ..materialDetailId = json['materialDetailId'] as int
    ..supplierId = json['supplierId'] as int
    ..number = (json['number'] as num)?.toDouble()
    ..stockNum = (json['stockNum'] as num)?.toDouble()
    ..remarks = json['remarks'] as String
    ..materialDetailName = json['materialDetailName'] as String
    ..type = json['type'] as String
    ..unit = json['unit'] as String
    ..officeIds = json['officeIds'] as String;
}

Map<String, dynamic> _$StockAllotDetailToJson(StockAllotDetail instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('delFlag', instance.delFlag);
  writeNotNull('createdBy', instance.createdBy);
  writeNotNull('createdByName', instance.createdByName);
  writeNotNull('createdDate', instance.createdDate);
  writeNotNull('allotId', instance.allotId);
  writeNotNull('inputDetailId', instance.inputDetailId);
  writeNotNull('materialDetailId', instance.materialDetailId);
  writeNotNull('supplierId', instance.supplierId);
  writeNotNull('number', instance.number);
  writeNotNull('stockNum', instance.stockNum);
  writeNotNull('remarks', instance.remarks);
  writeNotNull('materialDetailName', instance.materialDetailName);
  writeNotNull('type', instance.type);
  writeNotNull('unit', instance.unit);
  writeNotNull('officeIds', instance.officeIds);
  return val;
}

Clock _$ClockFromJson(Map<String, dynamic> json) {
  return Clock()
    ..id = json['id'] as int
    ..delFlag = json['delFlag'] as int
    ..createdBy = json['createdBy'] as int
    ..createdByName = json['createdByName'] as String
    ..createdDate = json['createdDate'] as String
    ..address = json['address'] as String
    ..checkDate = json['checkDate'] as String
    ..lat = (json['lat'] as num)?.toDouble()
    ..lng = (json['lng'] as num)?.toDouble()
    ..officeIds = json['officeIds'] as String
    ..officeId = json['officeId'] as int
    ..officeName = json['officeName'] as String
    ..beginDate = json['beginDate'] as String
    ..endDate = json['endDate'] as String;
}

Map<String, dynamic> _$ClockToJson(Clock instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('delFlag', instance.delFlag);
  writeNotNull('createdBy', instance.createdBy);
  writeNotNull('createdByName', instance.createdByName);
  writeNotNull('createdDate', instance.createdDate);
  writeNotNull('address', instance.address);
  writeNotNull('checkDate', instance.checkDate);
  writeNotNull('lat', instance.lat);
  writeNotNull('lng', instance.lng);
  writeNotNull('officeIds', instance.officeIds);
  writeNotNull('officeId', instance.officeId);
  writeNotNull('officeName', instance.officeName);
  writeNotNull('beginDate', instance.beginDate);
  writeNotNull('endDate', instance.endDate);
  return val;
}

MachineBook _$MachineBookFromJson(Map<String, dynamic> json) {
  return MachineBook()
    ..id = json['id'] as int
    ..delFlag = json['delFlag'] as int
    ..createdBy = json['createdBy'] as int
    ..createdDate = json['createdDate'] as String
    ..name = json['name'] as String
    ..code = json['code'] as String
    ..type = json['type'] as String
    ..driver = json['driver'] as String
    ..remark = json['remark'] as String
    ..producePlace = json['producePlace'] as String
    ..useType = json['useType'] as String
    ..manageNo = json['manageNo'] as String
    ..beginDate = json['beginDate'] as String
    ..endDate = json['endDate'] as String
    ..officeId = json['officeId'] as int
    ..officeName = json['officeName'] as String
    ..createdByName = json['createdByName'] as String;
}

Map<String, dynamic> _$MachineBookToJson(MachineBook instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('delFlag', instance.delFlag);
  writeNotNull('createdBy', instance.createdBy);
  writeNotNull('createdDate', instance.createdDate);
  writeNotNull('name', instance.name);
  writeNotNull('code', instance.code);
  writeNotNull('type', instance.type);
  writeNotNull('driver', instance.driver);
  writeNotNull('remark', instance.remark);
  writeNotNull('producePlace', instance.producePlace);
  writeNotNull('useType', instance.useType);
  writeNotNull('manageNo', instance.manageNo);
  writeNotNull('beginDate', instance.beginDate);
  writeNotNull('endDate', instance.endDate);
  writeNotNull('officeId', instance.officeId);
  writeNotNull('officeName', instance.officeName);
  writeNotNull('createdByName', instance.createdByName);
  return val;
}

MachineRefuel _$MachineRefuelFromJson(Map<String, dynamic> json) {
  return MachineRefuel()
    ..id = json['id'] as int
    ..delFlag = json['delFlag'] as int
    ..createdBy = json['createdBy'] as int
    ..createdDate = json['createdDate'] as String
    ..writeDate = json['writeDate'] as String
    ..refuelDate = json['refuelDate'] as String
    ..officeId = json['officeId'] as int
    ..details = (json['details'] as List)
        ?.map((e) => e == null
            ? null
            : MachineRefuelDetail.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..officeName = json['officeName'] as String
    ..createdByName = json['createdByName'] as String
    ..machineCount = json['machineCount'] as int
    ..refuelTotal = (json['refuelTotal'] as num)?.toDouble();
}

Map<String, dynamic> _$MachineRefuelToJson(MachineRefuel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('delFlag', instance.delFlag);
  writeNotNull('createdBy', instance.createdBy);
  writeNotNull('createdDate', instance.createdDate);
  writeNotNull('writeDate', instance.writeDate);
  writeNotNull('refuelDate', instance.refuelDate);
  writeNotNull('officeId', instance.officeId);
  writeNotNull('details', instance.details);
  writeNotNull('officeName', instance.officeName);
  writeNotNull('createdByName', instance.createdByName);
  writeNotNull('machineCount', instance.machineCount);
  writeNotNull('refuelTotal', instance.refuelTotal);
  return val;
}

MachineRefuelDetail _$MachineRefuelDetailFromJson(Map<String, dynamic> json) {
  return MachineRefuelDetail()
    ..id = json['id'] as int
    ..delFlag = json['delFlag'] as int
    ..createdBy = json['createdBy'] as int
    ..createdByName = json['createdByName'] as String
    ..createdDate = json['createdDate'] as String
    ..machineRefuelId = json['machineRefuelId'] as int
    ..machineId = json['machineId'] as int
    ..refuelNum = (json['refuelNum'] as num)?.toDouble()
    ..price = (json['price'] as num)?.toDouble()
    ..amount = (json['amount'] as num)?.toDouble()
    ..remark = json['remark'] as String
    ..name = json['name'] as String
    ..type = json['type'] as String
    ..code = json['code'] as String
    ..manageNo = json['manageNo'] as String
    ..driver = json['driver'] as String;
}

Map<String, dynamic> _$MachineRefuelDetailToJson(MachineRefuelDetail instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('delFlag', instance.delFlag);
  writeNotNull('createdBy', instance.createdBy);
  writeNotNull('createdByName', instance.createdByName);
  writeNotNull('createdDate', instance.createdDate);
  writeNotNull('machineRefuelId', instance.machineRefuelId);
  writeNotNull('machineId', instance.machineId);
  writeNotNull('refuelNum', instance.refuelNum);
  writeNotNull('price', instance.price);
  writeNotNull('amount', instance.amount);
  writeNotNull('remark', instance.remark);
  writeNotNull('name', instance.name);
  writeNotNull('type', instance.type);
  writeNotNull('code', instance.code);
  writeNotNull('manageNo', instance.manageNo);
  writeNotNull('driver', instance.driver);
  return val;
}

MachineStatus _$MachineStatusFromJson(Map<String, dynamic> json) {
  return MachineStatus()
    ..id = json['id'] as int
    ..delFlag = json['delFlag'] as int
    ..createdBy = json['createdBy'] as int
    ..createdDate = json['createdDate'] as String
    ..writeDate = json['writeDate'] as String
    ..workDate = json['workDate'] as String
    ..officeId = json['officeId'] as int
    ..details = (json['details'] as List)
        ?.map((e) => e == null
            ? null
            : MachineStatusDetail.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..officeName = json['officeName'] as String
    ..createdByName = json['createdByName'] as String
    ..machineCount = json['machineCount'] as int
    ..machineWorkCount = json['machineWorkCount'] as int;
}

Map<String, dynamic> _$MachineStatusToJson(MachineStatus instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('delFlag', instance.delFlag);
  writeNotNull('createdBy', instance.createdBy);
  writeNotNull('createdDate', instance.createdDate);
  writeNotNull('writeDate', instance.writeDate);
  writeNotNull('workDate', instance.workDate);
  writeNotNull('officeId', instance.officeId);
  writeNotNull('details', instance.details);
  writeNotNull('officeName', instance.officeName);
  writeNotNull('createdByName', instance.createdByName);
  writeNotNull('machineCount', instance.machineCount);
  writeNotNull('machineWorkCount', instance.machineWorkCount);
  return val;
}

MachineStatusDetail _$MachineStatusDetailFromJson(Map<String, dynamic> json) {
  return MachineStatusDetail()
    ..id = json['id'] as int
    ..delFlag = json['delFlag'] as int
    ..createdBy = json['createdBy'] as int
    ..createdByName = json['createdByName'] as String
    ..createdDate = json['createdDate'] as String
    ..machineRefuelId = json['machineRefuelId'] as int
    ..machineId = json['machineId'] as int
    ..status = json['status'] as String
    ..jobPlace = json['jobPlace'] as String
    ..jobContent = json['jobContent'] as String
    ..beginTime = json['beginTime'] as String
    ..endTime = json['endTime'] as String
    ..name = json['name'] as String
    ..type = json['type'] as String
    ..code = json['code'] as String
    ..manageNo = json['manageNo'] as String
    ..driver = json['driver'] as String;
}

Map<String, dynamic> _$MachineStatusDetailToJson(MachineStatusDetail instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('delFlag', instance.delFlag);
  writeNotNull('createdBy', instance.createdBy);
  writeNotNull('createdByName', instance.createdByName);
  writeNotNull('createdDate', instance.createdDate);
  writeNotNull('machineRefuelId', instance.machineRefuelId);
  writeNotNull('machineId', instance.machineId);
  writeNotNull('status', instance.status);
  writeNotNull('jobPlace', instance.jobPlace);
  writeNotNull('jobContent', instance.jobContent);
  writeNotNull('beginTime', instance.beginTime);
  writeNotNull('endTime', instance.endTime);
  writeNotNull('name', instance.name);
  writeNotNull('type', instance.type);
  writeNotNull('code', instance.code);
  writeNotNull('manageNo', instance.manageNo);
  writeNotNull('driver', instance.driver);
  return val;
}

MachineRepair _$MachineRepairFromJson(Map<String, dynamic> json) {
  return MachineRepair()
    ..id = json['id'] as int
    ..delFlag = json['delFlag'] as int
    ..createdBy = json['createdBy'] as int
    ..createdDate = json['createdDate'] as String
    ..processInstanceId = json['processInstanceId'] as String
    ..approveStatus = json['approveStatus'] as String
    ..billNo = json['billNo'] as String
    ..repairDate = json['repairDate'] as String
    ..repairEndDate = json['repairEndDate'] as String
    ..pics = json['pics'] as String
    ..machineId = json['machineId'] as int
    ..repairPosition = json['repairPosition'] as String
    ..cost = (json['cost'] as num)?.toDouble()
    ..officeId = json['officeId'] as int
    ..name = json['name'] as String
    ..type = json['type'] as String
    ..code = json['code'] as String
    ..manageNo = json['manageNo'] as String
    ..driver = json['driver'] as String
    ..officeName = json['officeName'] as String
    ..createdByName = json['createdByName'] as String;
}

Map<String, dynamic> _$MachineRepairToJson(MachineRepair instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('delFlag', instance.delFlag);
  writeNotNull('createdBy', instance.createdBy);
  writeNotNull('createdDate', instance.createdDate);
  writeNotNull('processInstanceId', instance.processInstanceId);
  writeNotNull('approveStatus', instance.approveStatus);
  writeNotNull('billNo', instance.billNo);
  writeNotNull('repairDate', instance.repairDate);
  writeNotNull('repairEndDate', instance.repairEndDate);
  writeNotNull('pics', instance.pics);
  writeNotNull('machineId', instance.machineId);
  writeNotNull('repairPosition', instance.repairPosition);
  writeNotNull('cost', instance.cost);
  writeNotNull('officeId', instance.officeId);
  writeNotNull('name', instance.name);
  writeNotNull('type', instance.type);
  writeNotNull('code', instance.code);
  writeNotNull('manageNo', instance.manageNo);
  writeNotNull('driver', instance.driver);
  writeNotNull('officeName', instance.officeName);
  writeNotNull('createdByName', instance.createdByName);
  return val;
}

TravelExpense _$TravelExpenseFromJson(Map<String, dynamic> json) {
  return TravelExpense()
    ..id = json['id'] as int
    ..delFlag = json['delFlag'] as int
    ..createdBy = json['createdBy'] as int
    ..createdDate = json['createdDate'] as String
    ..processInstanceId = json['processInstanceId'] as String
    ..approveStatus = json['approveStatus'] as String
    ..billType = json['billType'] as String
    ..billNo = json['billNo'] as String
    ..pics = json['pics'] as String
    ..travelPlace = json['travelPlace'] as String
    ..personNum = json['personNum'] as int
    ..beginDate = json['beginDate'] as String
    ..endDate = json['endDate'] as String
    ..applyReason = json['applyReason'] as String
    ..applyDate = json['applyDate'] as String
    ..officeId = json['officeId'] as int
    ..details = (json['details'] as List)
        ?.map((e) => e == null
            ? null
            : TravelExpenseDetail.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..officeName = json['officeName'] as String
    ..createdByName = json['createdByName'] as String
    ..jobType = json['jobType'] as String
    ..applyAmount = (json['applyAmount'] as num)?.toDouble()
    ..approvalAmount = (json['approvalAmount'] as num)?.toDouble();
}

Map<String, dynamic> _$TravelExpenseToJson(TravelExpense instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('delFlag', instance.delFlag);
  writeNotNull('createdBy', instance.createdBy);
  writeNotNull('createdDate', instance.createdDate);
  writeNotNull('processInstanceId', instance.processInstanceId);
  writeNotNull('approveStatus', instance.approveStatus);
  writeNotNull('billType', instance.billType);
  writeNotNull('billNo', instance.billNo);
  writeNotNull('pics', instance.pics);
  writeNotNull('travelPlace', instance.travelPlace);
  writeNotNull('personNum', instance.personNum);
  writeNotNull('beginDate', instance.beginDate);
  writeNotNull('endDate', instance.endDate);
  writeNotNull('applyReason', instance.applyReason);
  writeNotNull('applyDate', instance.applyDate);
  writeNotNull('officeId', instance.officeId);
  writeNotNull('details', instance.details);
  writeNotNull('officeName', instance.officeName);
  writeNotNull('createdByName', instance.createdByName);
  writeNotNull('jobType', instance.jobType);
  writeNotNull('applyAmount', instance.applyAmount);
  writeNotNull('approvalAmount', instance.approvalAmount);
  return val;
}

TravelExpenseDetail _$TravelExpenseDetailFromJson(Map<String, dynamic> json) {
  return TravelExpenseDetail()
    ..id = json['id'] as int
    ..delFlag = json['delFlag'] as int
    ..createdBy = json['createdBy'] as int
    ..createdByName = json['createdByName'] as String
    ..createdDate = json['createdDate'] as String
    ..travelExpenseId = json['travelExpenseId'] as int
    ..category = json['category'] as String
    ..pageNum = json['pageNum'] as int
    ..applyAmount = (json['applyAmount'] as num)?.toDouble()
    ..approvalAmount = (json['approvalAmount'] as num)?.toDouble();
}

Map<String, dynamic> _$TravelExpenseDetailToJson(TravelExpenseDetail instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('delFlag', instance.delFlag);
  writeNotNull('createdBy', instance.createdBy);
  writeNotNull('createdByName', instance.createdByName);
  writeNotNull('createdDate', instance.createdDate);
  writeNotNull('travelExpenseId', instance.travelExpenseId);
  writeNotNull('category', instance.category);
  writeNotNull('pageNum', instance.pageNum);
  writeNotNull('applyAmount', instance.applyAmount);
  writeNotNull('approvalAmount', instance.approvalAmount);
  return val;
}

ManageExpense _$ManageExpenseFromJson(Map<String, dynamic> json) {
  return ManageExpense()
    ..id = json['id'] as int
    ..delFlag = json['delFlag'] as int
    ..createdBy = json['createdBy'] as int
    ..createdDate = json['createdDate'] as String
    ..processInstanceId = json['processInstanceId'] as String
    ..approveStatus = json['approveStatus'] as String
    ..no = json['no'] as String
    ..date = json['date'] as String
    ..pics = json['pics'] as String
    ..pageNum = json['pageNum'] as int
    ..applyFee = (json['applyFee'] as num)?.toDouble()
    ..applyReason = json['applyReason'] as String
    ..place = json['place'] as String
    ..officeId = json['officeId'] as int
    ..officeName = json['officeName'] as String
    ..createdByName = json['createdByName'] as String;
}

Map<String, dynamic> _$ManageExpenseToJson(ManageExpense instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('delFlag', instance.delFlag);
  writeNotNull('createdBy', instance.createdBy);
  writeNotNull('createdDate', instance.createdDate);
  writeNotNull('processInstanceId', instance.processInstanceId);
  writeNotNull('approveStatus', instance.approveStatus);
  writeNotNull('no', instance.no);
  writeNotNull('date', instance.date);
  writeNotNull('pics', instance.pics);
  writeNotNull('pageNum', instance.pageNum);
  writeNotNull('applyFee', instance.applyFee);
  writeNotNull('applyReason', instance.applyReason);
  writeNotNull('place', instance.place);
  writeNotNull('officeId', instance.officeId);
  writeNotNull('officeName', instance.officeName);
  writeNotNull('createdByName', instance.createdByName);
  return val;
}

ImprestExpense _$ImprestExpenseFromJson(Map<String, dynamic> json) {
  return ImprestExpense()
    ..id = json['id'] as int
    ..delFlag = json['delFlag'] as int
    ..createdBy = json['createdBy'] as int
    ..createdDate = json['createdDate'] as String
    ..processInstanceId = json['processInstanceId'] as String
    ..approveStatus = json['approveStatus'] as String
    ..no = json['no'] as String
    ..date = json['date'] as String
    ..applyFee = (json['applyFee'] as num)?.toDouble()
    ..applyReason = json['applyReason'] as String
    ..place = json['place'] as String
    ..officeId = json['officeId'] as int
    ..officeName = json['officeName'] as String
    ..createdByName = json['createdByName'] as String;
}

Map<String, dynamic> _$ImprestExpenseToJson(ImprestExpense instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('delFlag', instance.delFlag);
  writeNotNull('createdBy', instance.createdBy);
  writeNotNull('createdDate', instance.createdDate);
  writeNotNull('processInstanceId', instance.processInstanceId);
  writeNotNull('approveStatus', instance.approveStatus);
  writeNotNull('no', instance.no);
  writeNotNull('date', instance.date);
  writeNotNull('applyFee', instance.applyFee);
  writeNotNull('applyReason', instance.applyReason);
  writeNotNull('place', instance.place);
  writeNotNull('officeId', instance.officeId);
  writeNotNull('officeName', instance.officeName);
  writeNotNull('createdByName', instance.createdByName);
  return val;
}

MachineExpense _$MachineExpenseFromJson(Map<String, dynamic> json) {
  return MachineExpense()
    ..id = json['id'] as int
    ..delFlag = json['delFlag'] as int
    ..createdBy = json['createdBy'] as int
    ..createdByName = json['createdByName'] as String
    ..createdDate = json['createdDate'] as String
    ..applyFee = (json['applyFee'] as num)?.toDouble()
    ..approveStatus = json['approveStatus'] as String
    ..bankName = json['bankName'] as String
    ..bankNo = json['bankNo'] as String
    ..beginDate = json['beginDate'] as String
    ..companyName = json['companyName'] as String
    ..date = json['date'] as String
    ..endDate = json['endDate'] as String
    ..files = (json['files'] as List)
        ?.map(
            (e) => e == null ? null : File.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..memo = json['memo'] as String
    ..no = json['no'] as String
    ..officeId = json['officeId'] as int
    ..officeIds = json['officeIds'] as String
    ..officeName = json['officeName'] as String
    ..pics = json['pics'] as String
    ..processInstanceId = json['processInstanceId'] as String
    ..processState = json['processState'] as String
    ..supplier = json['supplier'] as String
    ..totalFee = (json['totalFee'] as num)?.toDouble()
    ..type = json['type'] as String
    ..year = json['year'] as String
    ..month = json['month'] as String;
}

Map<String, dynamic> _$MachineExpenseToJson(MachineExpense instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('delFlag', instance.delFlag);
  writeNotNull('createdBy', instance.createdBy);
  writeNotNull('createdByName', instance.createdByName);
  writeNotNull('createdDate', instance.createdDate);
  writeNotNull('applyFee', instance.applyFee);
  writeNotNull('approveStatus', instance.approveStatus);
  writeNotNull('bankName', instance.bankName);
  writeNotNull('bankNo', instance.bankNo);
  writeNotNull('beginDate', instance.beginDate);
  writeNotNull('companyName', instance.companyName);
  writeNotNull('date', instance.date);
  writeNotNull('endDate', instance.endDate);
  writeNotNull('files', instance.files);
  writeNotNull('memo', instance.memo);
  writeNotNull('no', instance.no);
  writeNotNull('officeId', instance.officeId);
  writeNotNull('officeIds', instance.officeIds);
  writeNotNull('officeName', instance.officeName);
  writeNotNull('pics', instance.pics);
  writeNotNull('processInstanceId', instance.processInstanceId);
  writeNotNull('processState', instance.processState);
  writeNotNull('supplier', instance.supplier);
  writeNotNull('totalFee', instance.totalFee);
  writeNotNull('type', instance.type);
  writeNotNull('year', instance.year);
  writeNotNull('month', instance.month);
  return val;
}

ReportInventory _$ReportInventoryFromJson(Map<String, dynamic> json) {
  return ReportInventory()
    ..id = json['id'] as int
    ..delFlag = json['delFlag'] as int
    ..createdBy = json['createdBy'] as int
    ..createdByName = json['createdByName'] as String
    ..createdDate = json['createdDate'] as String
    ..type = json['type'] as String
    ..materialName = json['materialName'] as String
    ..materialType = json['materialType'] as String
    ..materialUnit = json['materialUnit'] as String
    ..billDate = json['billDate'] as String
    ..no = json['no'] as String
    ..leftNum = (json['leftNum'] as num)?.toDouble()
    ..inNum = (json['inNum'] as num)?.toDouble()
    ..outNum = (json['outNum'] as num)?.toDouble()
    ..inPrice = (json['inPrice'] as num)?.toDouble()
    ..backNum = (json['backNum'] as num)?.toDouble()
    ..allotNum = (json['allotNum'] as num)?.toDouble()
    ..leftPrice = (json['leftPrice'] as num)?.toDouble();
}

Map<String, dynamic> _$ReportInventoryToJson(ReportInventory instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('delFlag', instance.delFlag);
  writeNotNull('createdBy', instance.createdBy);
  writeNotNull('createdByName', instance.createdByName);
  writeNotNull('createdDate', instance.createdDate);
  writeNotNull('type', instance.type);
  writeNotNull('materialName', instance.materialName);
  writeNotNull('materialType', instance.materialType);
  writeNotNull('materialUnit', instance.materialUnit);
  writeNotNull('billDate', instance.billDate);
  writeNotNull('no', instance.no);
  writeNotNull('leftNum', instance.leftNum);
  writeNotNull('inNum', instance.inNum);
  writeNotNull('outNum', instance.outNum);
  writeNotNull('inPrice', instance.inPrice);
  writeNotNull('backNum', instance.backNum);
  writeNotNull('allotNum', instance.allotNum);
  writeNotNull('leftPrice', instance.leftPrice);
  return val;
}

ReportMachine _$ReportMachineFromJson(Map<String, dynamic> json) {
  return ReportMachine()
    ..year = json['year'] as String
    ..month = json['month'] as String
    ..officeName = json['officeName'] as String
    ..name = json['name'] as String
    ..manageNo = json['manageNo'] as String
    ..driver = json['driver'] as String
    ..duration = json['duration'] as String
    ..machineCount = json['machineCount'] as int
    ..workDays = json['workDays'] as int
    ..repairDays = json['repairDays'] as int
    ..days = json['days'] as int
    ..workRate = (json['workRate'] as num)?.toDouble()
    ..refuelTotal = (json['refuelTotal'] as num)?.toDouble()
    ..refuelCost = (json['refuelCost'] as num)?.toDouble()
    ..repairCount = json['repairCount'] as int
    ..repairCost = (json['repairCost'] as num)?.toDouble();
}

Map<String, dynamic> _$ReportMachineToJson(ReportMachine instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('year', instance.year);
  writeNotNull('month', instance.month);
  writeNotNull('officeName', instance.officeName);
  writeNotNull('name', instance.name);
  writeNotNull('manageNo', instance.manageNo);
  writeNotNull('driver', instance.driver);
  writeNotNull('duration', instance.duration);
  writeNotNull('machineCount', instance.machineCount);
  writeNotNull('workDays', instance.workDays);
  writeNotNull('repairDays', instance.repairDays);
  writeNotNull('days', instance.days);
  writeNotNull('workRate', instance.workRate);
  writeNotNull('refuelTotal', instance.refuelTotal);
  writeNotNull('refuelCost', instance.refuelCost);
  writeNotNull('repairCount', instance.repairCount);
  writeNotNull('repairCost', instance.repairCost);
  return val;
}

ReportExpense _$ReportExpenseFromJson(Map<String, dynamic> json) {
  return ReportExpense()
    ..year = json['year'] as String
    ..month = json['month'] as String
    ..officeName = json['officeName'] as String
    ..createBy = json['createBy'] as String
    ..officeId = json['officeId'] as int
    ..travelExpense = (json['travelExpense'] as num)?.toDouble()
    ..manageExpense = (json['manageExpense'] as num)?.toDouble()
    ..imprestExpense = (json['imprestExpense'] as num)?.toDouble()
    ..pageNum = (json['pageNum'] as num)?.toDouble();
}

Map<String, dynamic> _$ReportExpenseToJson(ReportExpense instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('year', instance.year);
  writeNotNull('month', instance.month);
  writeNotNull('officeName', instance.officeName);
  writeNotNull('createBy', instance.createBy);
  writeNotNull('officeId', instance.officeId);
  writeNotNull('travelExpense', instance.travelExpense);
  writeNotNull('manageExpense', instance.manageExpense);
  writeNotNull('imprestExpense', instance.imprestExpense);
  writeNotNull('pageNum', instance.pageNum);
  return val;
}

Office _$OfficeFromJson(Map<String, dynamic> json) {
  return Office(
    name: json['name'] as String,
  )
    ..id = json['id'] as int
    ..delFlag = json['delFlag'] as int
    ..createdBy = json['createdBy'] as int
    ..createdByName = json['createdByName'] as String
    ..createdDate = json['createdDate'] as String
    ..parent = json['parent'] == null
        ? null
        : Office.fromJson(json['parent'] as Map<String, dynamic>)
    ..parentIds = json['parentIds'] as String
    ..shortName = json['shortName'] as String
    ..code = json['code'] as String
    ..type = json['type'] as String
    ..address = json['address'] as String
    ..zipCode = json['zipCode'] as String
    ..phone = json['phone'] as String
    ..fax = json['fax'] as String
    ..email = json['email'] as String
    ..lng = (json['lng'] as num)?.toDouble()
    ..lat = (json['lat'] as num)?.toDouble()
    ..sort = json['sort'] as int
    ..xymCode = json['xymCode'] as String
    ..carsId = json['carsId'] as int
    ..projectNo = json['projectNo'] as String
    ..customId = json['customId'] as String
    ..belongId = json['belongId'] as String
    ..remarks = json['remarks'] as String;
}

Map<String, dynamic> _$OfficeToJson(Office instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('delFlag', instance.delFlag);
  writeNotNull('createdBy', instance.createdBy);
  writeNotNull('createdByName', instance.createdByName);
  writeNotNull('createdDate', instance.createdDate);
  writeNotNull('parent', instance.parent);
  writeNotNull('parentIds', instance.parentIds);
  writeNotNull('name', instance.name);
  writeNotNull('shortName', instance.shortName);
  writeNotNull('code', instance.code);
  writeNotNull('type', instance.type);
  writeNotNull('address', instance.address);
  writeNotNull('zipCode', instance.zipCode);
  writeNotNull('phone', instance.phone);
  writeNotNull('fax', instance.fax);
  writeNotNull('email', instance.email);
  writeNotNull('lng', instance.lng);
  writeNotNull('lat', instance.lat);
  writeNotNull('sort', instance.sort);
  writeNotNull('xymCode', instance.xymCode);
  writeNotNull('carsId', instance.carsId);
  writeNotNull('projectNo', instance.projectNo);
  writeNotNull('customId', instance.customId);
  writeNotNull('belongId', instance.belongId);
  writeNotNull('remarks', instance.remarks);
  return val;
}

Supplier _$SupplierFromJson(Map<String, dynamic> json) {
  return Supplier(
    name: json['name'] as String,
  )
    ..id = json['id'] as int
    ..delFlag = json['delFlag'] as int
    ..createdBy = json['createdBy'] as int
    ..createdDate = json['createdDate'] as String
    ..categoryId = json['categoryId'] as int
    ..purchaseWayId = json['purchaseWayId'] as int
    ..propertyId = json['propertyId'] as int
    ..businessLicence = json['businessLicence'] as String
    ..address = json['address'] as String
    ..registrationCapital = (json['registrationCapital'] as num)?.toDouble()
    ..contactsName = json['contactsName'] as String
    ..contactsPhone = json['contactsPhone'] as String
    ..cooperationProject = json['cooperationProject'] as String
    ..evaluate = json['evaluate'] as String
    ..legalRepresentative = json['legalRepresentative'] as String
    ..idCard = json['idCard'] as String
    ..forbiddenLevel = json['forbiddenLevel'] as String
    ..officeId = json['officeId'] as int
    ..reportOffice = json['reportOffice'] as String
    ..region = json['region'] as String
    ..reportTime = json['reportTime'] as String
    ..remarks = json['remarks'] as String
    ..selectWay = json['selectWay'] as String
    ..materialName = json['materialName'] as String
    ..officialWeb = json['officialWeb'] as String
    ..bankName = json['bankName'] as String
    ..bankAccount = json['bankAccount'] as String
    ..legalRepresentativePhone = json['legalRepresentativePhone'] as String
    ..contactsPosition = json['contactsPosition'] as String
    ..qqOrEmails = json['qqOrEmails'] as String
    ..fixedPhone = json['fixedPhone'] as String
    ..agentManufacturer = json['agentManufacturer'] as String
    ..businessRegistrationNo = json['businessRegistrationNo'] as String
    ..organizationalNo = json['organizationalNo'] as String
    ..registrationDate = json['registrationDate'] as String
    ..aptitudeLevel = json['aptitudeLevel'] as String
    ..companyCategory = json['companyCategory'] as String
    ..taxpayerNumber = json['taxpayerNumber'] as String
    ..taxpayerLevel = json['taxpayerLevel'] as String
    ..staffNum = json['staffNum'] as int
    ..supplyAbility = json['supplyAbility'] as String
    ..transDistance = (json['transDistance'] as num)?.toDouble()
    ..twoYearTurnover = json['twoYearTurnover'] as String
    ..mainBrand = json['mainBrand'] as String
    ..qualityCertification = json['qualityCertification'] as String
    ..productionLicenseNo = json['productionLicenseNo'] as String
    ..recentYearCustomer = json['recentYearCustomer'] as String
    ..pics = json['pics'] as String
    ..officeName = json['officeName'] as String
    ..createdByName = json['createdByName'] as String
    ..officeIds = json['officeIds'] as String
    ..allForbidden = json['allForbidden'] as String
    ..property = json['property'] as String
    ..purchaseWay = json['purchaseWay'] as String
    ..category = json['category'] as String;
}

Map<String, dynamic> _$SupplierToJson(Supplier instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('delFlag', instance.delFlag);
  writeNotNull('createdBy', instance.createdBy);
  writeNotNull('createdDate', instance.createdDate);
  writeNotNull('name', instance.name);
  writeNotNull('categoryId', instance.categoryId);
  writeNotNull('purchaseWayId', instance.purchaseWayId);
  writeNotNull('propertyId', instance.propertyId);
  writeNotNull('businessLicence', instance.businessLicence);
  writeNotNull('address', instance.address);
  writeNotNull('registrationCapital', instance.registrationCapital);
  writeNotNull('contactsName', instance.contactsName);
  writeNotNull('contactsPhone', instance.contactsPhone);
  writeNotNull('cooperationProject', instance.cooperationProject);
  writeNotNull('evaluate', instance.evaluate);
  writeNotNull('legalRepresentative', instance.legalRepresentative);
  writeNotNull('idCard', instance.idCard);
  writeNotNull('forbiddenLevel', instance.forbiddenLevel);
  writeNotNull('officeId', instance.officeId);
  writeNotNull('reportOffice', instance.reportOffice);
  writeNotNull('region', instance.region);
  writeNotNull('reportTime', instance.reportTime);
  writeNotNull('remarks', instance.remarks);
  writeNotNull('selectWay', instance.selectWay);
  writeNotNull('materialName', instance.materialName);
  writeNotNull('officialWeb', instance.officialWeb);
  writeNotNull('bankName', instance.bankName);
  writeNotNull('bankAccount', instance.bankAccount);
  writeNotNull('legalRepresentativePhone', instance.legalRepresentativePhone);
  writeNotNull('contactsPosition', instance.contactsPosition);
  writeNotNull('qqOrEmails', instance.qqOrEmails);
  writeNotNull('fixedPhone', instance.fixedPhone);
  writeNotNull('agentManufacturer', instance.agentManufacturer);
  writeNotNull('businessRegistrationNo', instance.businessRegistrationNo);
  writeNotNull('organizationalNo', instance.organizationalNo);
  writeNotNull('registrationDate', instance.registrationDate);
  writeNotNull('aptitudeLevel', instance.aptitudeLevel);
  writeNotNull('companyCategory', instance.companyCategory);
  writeNotNull('taxpayerNumber', instance.taxpayerNumber);
  writeNotNull('taxpayerLevel', instance.taxpayerLevel);
  writeNotNull('staffNum', instance.staffNum);
  writeNotNull('supplyAbility', instance.supplyAbility);
  writeNotNull('transDistance', instance.transDistance);
  writeNotNull('twoYearTurnover', instance.twoYearTurnover);
  writeNotNull('mainBrand', instance.mainBrand);
  writeNotNull('qualityCertification', instance.qualityCertification);
  writeNotNull('productionLicenseNo', instance.productionLicenseNo);
  writeNotNull('recentYearCustomer', instance.recentYearCustomer);
  writeNotNull('pics', instance.pics);
  writeNotNull('officeName', instance.officeName);
  writeNotNull('createdByName', instance.createdByName);
  writeNotNull('officeIds', instance.officeIds);
  writeNotNull('allForbidden', instance.allForbidden);
  writeNotNull('property', instance.property);
  writeNotNull('purchaseWay', instance.purchaseWay);
  writeNotNull('category', instance.category);
  return val;
}

MaterialDetail _$MaterialDetailFromJson(Map<String, dynamic> json) {
  return MaterialDetail()
    ..id = json['id'] as int
    ..delFlag = json['delFlag'] as int
    ..createdBy = json['createdBy'] as int
    ..createdByName = json['createdByName'] as String
    ..createdDate = json['createdDate'] as String
    ..conversionRatio = json['conversionRatio'] as String
    ..officeName = json['officeName'] as String
    ..code = json['code'] as String
    ..materialCode = json['materialCode'] as String
    ..subject = json['subject'] as String
    ..computerCode = json['computerCode'] as String
    ..description = json['description'] as String
    ..sort = json['sort'] as String
    ..type = json['type'] as String
    ..materialId = json['materialId'] as int
    ..customId = json['customId'] as String
    ..materialName = json['materialName'] as String
    ..materialDetailName = json['materialDetailName'] as String
    ..unit = json['unit'] as String
    ..isConcrete = json['isConcrete'] as String
    ..lossRatio = (json['lossRatio'] as num)?.toDouble()
    ..officeId = MaterialDetail.fmtOffice(json['officeId'])
    ..price = json['price'] as String
    ..materialDetailId = json['materialDetailId'] as int
    ..name = json['name'] as String
    ..warningNum = json['warningNum'] as String
    ..category = json['category'] as String
    ..isRatio = json['isRatio'] as String
    ..allSubject = json['allSubject'] as String
    ..isLimit = json['isLimit'] as String
    ..isEffective = json['isEffective'] as String
    ..isApprove = json['isApprove'] as String
    ..approveStatus = json['approveStatus'] as String
    ..leftNum = (json['leftNum'] as num)?.toDouble()
    ..usedNum = (json['usedNum'] as num)?.toDouble()
    ..actualNum = (json['actualNum'] as num)?.toDouble();
}

Map<String, dynamic> _$MaterialDetailToJson(MaterialDetail instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('delFlag', instance.delFlag);
  writeNotNull('createdBy', instance.createdBy);
  writeNotNull('createdByName', instance.createdByName);
  writeNotNull('createdDate', instance.createdDate);
  writeNotNull('conversionRatio', instance.conversionRatio);
  writeNotNull('officeName', instance.officeName);
  writeNotNull('code', instance.code);
  writeNotNull('materialCode', instance.materialCode);
  writeNotNull('subject', instance.subject);
  writeNotNull('computerCode', instance.computerCode);
  writeNotNull('description', instance.description);
  writeNotNull('sort', instance.sort);
  writeNotNull('type', instance.type);
  writeNotNull('materialId', instance.materialId);
  writeNotNull('customId', instance.customId);
  writeNotNull('materialName', instance.materialName);
  writeNotNull('materialDetailName', instance.materialDetailName);
  writeNotNull('unit', instance.unit);
  writeNotNull('isConcrete', instance.isConcrete);
  writeNotNull('lossRatio', instance.lossRatio);
  writeNotNull('officeId', instance.officeId);
  writeNotNull('price', instance.price);
  writeNotNull('materialDetailId', instance.materialDetailId);
  writeNotNull('name', instance.name);
  writeNotNull('warningNum', instance.warningNum);
  writeNotNull('category', instance.category);
  writeNotNull('isRatio', instance.isRatio);
  writeNotNull('allSubject', instance.allSubject);
  writeNotNull('isLimit', instance.isLimit);
  writeNotNull('isEffective', instance.isEffective);
  writeNotNull('isApprove', instance.isApprove);
  writeNotNull('approveStatus', instance.approveStatus);
  writeNotNull('leftNum', instance.leftNum);
  writeNotNull('usedNum', instance.usedNum);
  writeNotNull('actualNum', instance.actualNum);
  return val;
}

Warehouse _$WarehouseFromJson(Map<String, dynamic> json) {
  return Warehouse()
    ..id = json['id'] as int
    ..delFlag = json['delFlag'] as int
    ..createdBy = json['createdBy'] as int
    ..createdByName = json['createdByName'] as String
    ..createdDate = json['createdDate'] as String
    ..name = json['name'] as String
    ..address = json['address'] as String
    ..officeId = json['officeId'] as int
    ..officeName = json['officeName'] as String
    ..type = json['type'] as String
    ..isFactory = json['isFactory'] as String
    ..remarks = json['remarks'] as String;
}

Map<String, dynamic> _$WarehouseToJson(Warehouse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('delFlag', instance.delFlag);
  writeNotNull('createdBy', instance.createdBy);
  writeNotNull('createdByName', instance.createdByName);
  writeNotNull('createdDate', instance.createdDate);
  writeNotNull('name', instance.name);
  writeNotNull('address', instance.address);
  writeNotNull('officeId', instance.officeId);
  writeNotNull('officeName', instance.officeName);
  writeNotNull('type', instance.type);
  writeNotNull('isFactory', instance.isFactory);
  writeNotNull('remarks', instance.remarks);
  return val;
}

Dict _$DictFromJson(Map<String, dynamic> json) {
  return Dict()
    ..id = json['id'] as int
    ..delFlag = json['delFlag'] as int
    ..createdBy = json['createdBy'] as int
    ..createdByName = json['createdByName'] as String
    ..createdDate = json['createdDate'] as String
    ..description = json['description'] as String
    ..grade = json['grade'] as int
    ..label = json['label'] as String
    ..officeId = json['officeId'] as int
    ..onOff = json['onOff'] as String
    ..parentId = json['parentId'] as int
    ..parentIds = json['parentIds'] as String
    ..remarks = json['remarks'] as String
    ..sort = json['sort'] as String
    ..type = json['type'] as String
    ..value = json['value'] as String;
}

Map<String, dynamic> _$DictToJson(Dict instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('delFlag', instance.delFlag);
  writeNotNull('createdBy', instance.createdBy);
  writeNotNull('createdByName', instance.createdByName);
  writeNotNull('createdDate', instance.createdDate);
  writeNotNull('description', instance.description);
  writeNotNull('grade', instance.grade);
  writeNotNull('label', instance.label);
  writeNotNull('officeId', instance.officeId);
  writeNotNull('onOff', instance.onOff);
  writeNotNull('parentId', instance.parentId);
  writeNotNull('parentIds', instance.parentIds);
  writeNotNull('remarks', instance.remarks);
  writeNotNull('sort', instance.sort);
  writeNotNull('type', instance.type);
  writeNotNull('value', instance.value);
  return val;
}
