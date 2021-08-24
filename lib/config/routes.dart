
import 'package:fluro/fluro.dart' as fluro;
import 'package:flutter/material.dart';
import 'package:my_yuque/views/login/login.dart';
import 'package:my_yuque/views/login/login_oauth.dart';
import 'package:my_yuque/views/main_page.dart';

class Routes {
  static String login = "/login";
  static String loginOAuth = "/login/oauth";
  static String home = "/home";

  static void configureRoutes(fluro.FluroRouter router) {
    router.notFoundHandler = fluro.Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
        print("ROUTE WAS NOT FOUND !!!");
      }
    );

    router.define(login, handler: fluro.Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
          return LoginPage();
        })
    );

    router.define(loginOAuth, handler: fluro.Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
          return LoginOAuthPage();
        })
    );

    router.define(home, handler: fluro.Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
          String message = params["message"]?.first;

          return MainPage();
        }
    ));
  }
}

