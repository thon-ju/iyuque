class Ids {
  static const String titleDoc = 'title_doc';

  static const String titleBookmarks = 'title_bookmarks';
  static const String titleCollection = 'title_collection';
  static const String titleSetting = 'title_setting';
  static const String titleMeSyncData = 'title_me_sync_data';
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
    Ids.titleDoc: 'My Doc',

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
    Ids.titleDoc: '我的文档',

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
      Ids.titleDoc: 'My Doc',

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
      Ids.titleDoc: '我的文档',

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
