class Constant {
  static const String keyLanguage = 'key_language';
  static const String keyUserId = 'key_user_id';
  static const String keyUserInfo = 'key_user_info';
  static const String keyUserRepo= 'key_user_repo';
  static const String keyUserRepos= 'key_user_repos';

  static const int status_success = 0;

  /// 同步状态 0 没有待进行的同步 1有未完成的同步
  static const String sync_data_status ="key_sync_data_status";
  static const String sync_data_last_time ="key_sync_data_last_time";

  static const String key_theme_color = 'key_theme_color';
  static const String key_guide = 'key_guide';
  static const String key_splash_model = 'key_splash_models';
}

class AppConfig {
  static const String appName = 'iyuque';
  static const String version = '1.0.0';
  static const bool isDebug = true;
}



class LoadStatus {
  static const int fail = -1;
  static const int loading = 0;
  static const int success = 1;
  static const int empty = 2;
}

class EventConfig{
  static const int event_sys_update = 1;

  static const int event_sync_begin = 2;
  static const int event_sync_book_finish = 3;
  static const int event_sync_doc_finish = 4;
}
