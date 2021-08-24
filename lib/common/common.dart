class Constant {
  static const String keyLanguage = 'key_language';
  static const String keySessionId = 'jsessionid';
  static const String keyUserId = 'key_user_id';
  static const String keyUserInfo = 'key_user_info';
  static const String keyOffice = 'key_office';
  static const String keyOffices = 'key_offices';
  static const String keyPermissions = 'key_permissions';

  static const int status_success = 0;

  static const String server_address = xcy_android;
  static const String xcy_android = "http://wz1702.xingcyun.com";

  static const int type_sys_update = 1;
  static const int type_menu_update = 2;
  static const int type_chat_update = 3;
  static const String key_theme_color = 'key_theme_color';
  static const String key_guide = 'key_guide';
  static const String key_splash_model = 'key_splash_models';
}

class AppConfig {
  static const String appName = 'djy';
  static const String version = '1.3.0';
  static const bool isDebug = true;
}

class OAuthConfig{
  static const String oauthUrl = 'https://www.yuque.com/oauth2/authorize';
  static const String tokenUrl = 'https://www.yuque.com/oauth2/token';
  static const String clientId = 'IbUXwsSO4jfQRVI54Gvo';
  static const String clientSecret = 'U5B9hZVM6jkSupOHH52EOUq9hWtvapVIdDTs7wug';
  static const String keyCode = 'yuque_code';
  static const String keyToken = 'yuque_token';
}

class LoadStatus {
  static const int fail = -1;
  static const int loading = 0;
  static const int success = 1;
  static const int empty = 2;
}
