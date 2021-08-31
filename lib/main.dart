

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fluintl/fluintl.dart';
import 'package:fluro/fluro.dart' as fluro;
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:my_yuque/common/common.dart';
import 'package:my_yuque/common/sp_helper.dart';
import 'package:my_yuque/components/blocs/application_bloc.dart';
import 'package:my_yuque/components/blocs/bloc_provider.dart';
import 'package:my_yuque/components/blocs/main_bloc.dart';
import 'package:my_yuque/config/application.dart';
import 'package:my_yuque/config/routes.dart';
import 'package:my_yuque/db/db_util.dart';
import 'package:my_yuque/model/models.dart';
import 'package:my_yuque/net/dio_util.dart';
import 'package:my_yuque/net/intercept.dart';
import 'package:my_yuque/res/chinese_cupertino_localizations.dart';
import 'package:my_yuque/res/colors.dart';
import 'package:my_yuque/res/strings.dart';
import 'package:my_yuque/views/splash_page.dart';
import 'package:oktoast/oktoast.dart';
import 'package:permission_handler/permission_handler.dart';

final List<Permission> needPermissionList = [
  Permission.location,
  Permission.storage,
  Permission.phone,
];

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {

  MyAppState(){
    final router = new fluro.FluroRouter();
    Routes.configureRoutes(router);
    Application.router = router;
  }

  Locale _locale;
  Color _themeColor = themeColorMap[SpHelper.getThemeColor()];

  @override
  void initState() {
    super.initState();

    setLocalizedValues(localizedValues);


    _init();
    _initAsync();
    _initListener();
    _checkPermissions();

    // 数据库初始化
    DbUtil().db;
  }

  @override
  void reassemble() {
    super.reassemble();
    _checkPermissions();
  }

  void _checkPermissions() async {
    Map<Permission, PermissionStatus> statuses =
    await needPermissionList.request();
    statuses.forEach((key, value) {
      print('$key premissionStatus is $value');
    });
  }

  void _init() {
    BaseOptions options = DioUtil.getDefOptions();
    HttpConfig config = HttpConfig(options: options);
    DioUtil().setConfig(config);

    /// 登录认证信息
    /// DioUtil().getDio().interceptors.add(CookieManager(CookieJar()));
    DioUtil().getDio().interceptors.add(AuthInterceptor());
    /// 开启日志
    // DioUtil().getDio().interceptors.add(LogInterceptor(requestBody: true));
  }

  void _initAsync() async {
    await SpUtil.getInstance();
    if (!mounted) return;
    _loadLocale();
  }

  void _initListener() {
    final ApplicationBloc bloc = BlocProvider.of<ApplicationBloc>(context);
    bloc.appEventStream.listen((value) {
      LogUtil.e("sys event get......");
      _loadLocale();
    });
  }

  void _loadLocale() {
    setState(() {
      LanguageModel model = SpHelper.getObject<LanguageModel>(Constant.keyLanguage);
      if (model != null) {
        _locale = new Locale(model.languageCode, model.countryCode);
      } else {
        _locale = new Locale('zh', 'CH');
      }

      String _colorKey = SpHelper.getThemeColor();
      if (themeColorMap[_colorKey] != null)
        _themeColor = themeColorMap[_colorKey];
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return OKToast(
      child: MaterialApp(
        title: '我的语雀',
        debugShowCheckedModeBanner: false,
        home: new SplashPage(),
        theme: ThemeData.light().copyWith(
          primaryColor: _themeColor,
          accentColor: _themeColor,
          indicatorColor: Colors.white,
        ),
        locale: _locale,
        localizationsDelegates: [
          ChineseCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          CustomLocalizations.delegate
        ],
        supportedLocales: CustomLocalizations.supportedLocales,
        onGenerateRoute: Application.router.generator,
      ),
    );
  }
}

void main() {

  runApp(BlocProvider<ApplicationBloc>(
    bloc: ApplicationBloc(),
    child: BlocProvider(child: MyApp(), bloc: MainBloc()),
  ));

  // 透明状态栏
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle =
    SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}
