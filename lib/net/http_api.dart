

class Api{

  static const String BASE_URL = 'http://jyjz.xingcyun.com';

  static const String LOGIN = BASE_URL+'/api/user/login';
  static const String USER_SAVE = BASE_URL+'/api/user/save';
  static const String USER_PWD_UPDATE = BASE_URL+'/api/user/pwd/update';
  /// 用户权限
  static const String USER_INFO = BASE_URL+'/api/user/info';
  /// 部门用户
  static const String USER_OFFICE_LIST = BASE_URL+'/api/user/list/office';
  /// 部门
  static const String USER_OFFICE_TREE = BASE_URL+'/api/user/office/tree';
  /// 更改部门
  static const String OFFICE_CHANGE = BASE_URL+'/api/office/change';
  static const String OFFICE_LIST = BASE_URL+'/api/office/list';
  static const String OFFICE_LIST_PROJECT = BASE_URL+'/api/office/list/project';
  /// 数据字典
  static const String DICT_LIST = BASE_URL+'/api/dict/list';
  /// 根据父级编码获取材料后四位编码
  static const String MATERIAL_SERIAL_DETAIL = BASE_URL+'/api/material/serial/detail';
  /// 工程工号
  static const String PROJECT_TREE = BASE_URL+'/api/project/tree';

  /// 附件下载
  static const String ATTACHMENT_DOWNLOAD = BASE_URL + '/commons/attachment/download/';
  /// 附件上次传
  static const String ATTACHMENT_UPLOAD = BASE_URL + '/commons/attachment/upload/';

  /// 消息列表
  static const String MESSAGE_LIST = BASE_URL+'/api/message/list';
  static const String MESSAGE_DEL = BASE_URL+'/api/message/del';
  static const String MESSAGE_SAVE = BASE_URL+'/api/message/save';
  /// 未读消息数量
  static const String MESSAGE_UNREAD_COUNT = BASE_URL+'/api/message/count/unread';
  /// 消息处理
  static const String MESSAGE_HANDLE = BASE_URL+'/api/message/read';


  /// 版本检测
  static const String VERSION_CHECK = 'http://www.xingcyun.com/prod-api/system/version/check';

}


