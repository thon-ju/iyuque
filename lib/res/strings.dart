class Ids {
  static const String titleBoqPlan = 'title_boq_plan';
  static const String titleAddBoqPlan = 'title_add_boq_plan';
  static const String titleEditBoqPlan = 'title_edit_boq_plan';
  static const String titleBoqPlanSelect = 'title_boq_plan_select';
  static const String titleInput = 'title_input';
  static const String titleAddInput = 'title_add_input';
  static const String titleEditInput = 'title_edit_input';
  static const String titleInputSelect = 'title_input_select';
  static const String titleOutput = 'title_output';
  static const String titleOutputSelect = 'title_output_select';
  static const String titleStockBack = 'title_stock_back';
  static const String titleStockBackSelect = 'title_stock_back_select';
  static const String titleStockAllot = 'title_stock_allot';
  static const String titleStockAllotSelect = 'title_stock_allot_select';
  static const String titleAddOutput = 'title_add_output';
  static const String titleEditOutput = 'title_edit_output';
  static const String titleMaterial = 'title_material';
  static const String titleApprovalHistory = 'title_approval_history';
  static const String titleApproval = 'title_approval';
  // 考勤记录
  static const String titleAttendanceClockList = 'title_attendance_clock_list';
  static const String titleAttendanceLastClock = 'title_attendance_last_clock';

  static const String titleMachineBook = 'title_machine_book';
  static const String titleMachineStatus = 'title_machine_status';
  static const String titleMachineRefuel = 'title_machine_refuel';
  static const String titleMachineRepair = 'title_machine_repair';

  static const String titleTravelExpense = 'title_travel_expense';
  static const String titleManageExpense = 'title_manage_expense';
  static const String titleImprestExpense = 'title_imprest_expense';
  static const String titleMachineExpense = 'title_machine_expense';

  static const String titleReportInventory = 'title_report_inventory';
  static const String titleReportInventoryDetail = 'title_report_inventory_detail';
  static const String titleReportMachine = 'title_report_machine';
  static const String titleReportExpense = 'title_report_expense';
  static const String titleReportExpenseMachine = 'title_report_expense_machine';

  static const String titleBookmarks = 'title_bookmarks';
  static const String titleCollection = 'title_collection';
  static const String titleSetting = 'title_setting';
  static const String titleAbout = 'title_about';
  static const String titleMessage = 'title_message';
  static const String titleShare = 'title_share';
  static const String titleSignOut = 'title_signout';
  static const String titleLanguage = 'title_language';
  static const String titleTheme = 'title_theme';
  static const String titleAuthor = 'title_author';
  static const String titleOther = 'title_other';
  static const String titlePersonalInfo = 'title_personal_info';
  static const String titleChangePassword = 'title_change_password';

  static const String languageAuto = 'language_auto';
  static const String languageZH = 'language_zh';
  static const String languageTW = 'language_tw';
  static const String languageHK = 'language_hk';
  static const String languageEN = 'language_en';

  static const String save = 'save';
  static const String more = 'more';
}

Map<String, Map<String, String>> localizedSimpleValues = {
  'en': {
    Ids.titleInput: 'Input',
    Ids.titleAddInput: 'Add Input',
    Ids.titleEditInput: 'Edit Input',
    Ids.titleOutput: 'Output',
    Ids.titleAddOutput: 'Add Output',
    Ids.titleEditOutput: 'Edit Output',
    Ids.titleMaterial: 'Material',
    Ids.titleApprovalHistory: 'Approval History',
    Ids.titleApproval: 'Approval',

    Ids.titleBookmarks: 'Bookmarks',
    Ids.titleSetting: 'Setting',
    Ids.titleAbout: 'About',
    Ids.titleMessage: 'Message',
    Ids.titleShare: 'Share',
    Ids.titleSignOut: 'Sign Out',
    Ids.titleLanguage: 'Language',
    Ids.languageAuto: 'Auto',
  },
  'zh': {
    Ids.titleInput: '入库单',
    Ids.titleAddInput: '新增入库单',
    Ids.titleEditInput: '编辑入库单',
    Ids.titleOutput: '出库单',
    Ids.titleAddOutput: '新增出库单',
    Ids.titleEditOutput: '编辑出库单',
    Ids.titleMaterial: '材料信息',
    Ids.titleApprovalHistory: '审批历史',
    Ids.titleApproval: '我的审批',

    Ids.titleBookmarks: '书签',
    Ids.titleSetting: '设置',
    Ids.titleAbout: '关于',
    Ids.titleMessage: '消息',
    Ids.titleShare: '分享',
    Ids.titleSignOut: '注销',
    Ids.titleLanguage: '多语言',
    Ids.languageAuto: '跟随系统',
  },
};

Map<String, Map<String, Map<String, String>>> localizedValues = {
  'en': {
    'US': {
      Ids.titleInput: 'Input',
      Ids.titleAddInput: 'Add Input',
      Ids.titleEditInput: 'Edit Input',
      Ids.titleOutput: 'Output',
      Ids.titleAddOutput: 'Add Output',
      Ids.titleEditOutput: 'Edit Output',
      Ids.titleMaterial: 'Material',
      Ids.titleApprovalHistory: 'Approval History',
      Ids.titleApproval: 'Approval',

      Ids.titleBookmarks: 'Bookmarks',
      Ids.titleCollection: 'Collection',
      Ids.titleSetting: 'Setting',
      Ids.titleAbout: 'About',
      Ids.titleMessage: 'Message',
      Ids.titleShare: 'Share',
      Ids.titleSignOut: 'Sign Out',
      Ids.titleLanguage: 'Language',
      Ids.languageAuto: 'Auto',
      Ids.save: 'Save',
      Ids.more: 'More',
      Ids.titleTheme: 'Theme',
    }
  },
  'zh': {
    'CN': {
      Ids.titleInput: '入库单',
      Ids.titleAddInput: '新增入库单',
      Ids.titleEditInput: '编辑入库单',
      Ids.titleOutput: '出库单',
      Ids.titleAddOutput: '新增出库单',
      Ids.titleEditOutput: '编辑出库单',
      Ids.titleMaterial: '材料信息',
      Ids.titleApprovalHistory: '审批历史',
      Ids.titleApproval: '我的审批',

      Ids.titleBookmarks: '书签',
      Ids.titleCollection: '收藏',
      Ids.titleSetting: '设置',
      Ids.titleAbout: '关于',
      Ids.titleMessage: '消息',
      Ids.titleShare: '分享',
      Ids.titleSignOut: '注销',
      Ids.titleLanguage: '多语言',
      Ids.languageAuto: '跟随系统',
      Ids.languageZH: '简体中文',
      Ids.languageTW: '繁體中文（台灣）',
      Ids.languageHK: '繁體中文（香港）',
      Ids.languageEN: 'English',
      Ids.save: '保存',
      Ids.more: '更多',
      Ids.titleTheme: '主题',
    },
  }
};
