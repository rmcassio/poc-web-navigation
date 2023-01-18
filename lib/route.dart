import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poc_web_navigation/home.dart';
import 'package:poc_web_navigation/login.dart';
import 'package:poc_web_navigation/login_binding.dart';
import 'package:poc_web_navigation/signup.dart';
import 'package:poc_web_navigation/signup_binding.dart';

abstract class Routes {
  static const HOME = '/';
  static const LOGIN = '/login';
  static const SIGNUP = '/signup';
}

class AppRouterDelegate extends GetDelegate {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      onPopPage: (route, result) => route.didPop(result),
      pages: currentConfiguration != null ? [currentConfiguration!.currentPage!] : [GetNavConfig.fromRoute(Routes.LOGIN)!.currentPage!],
    );
  }
}

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.HOME,
      page: () => Home(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => Login(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.SIGNUP,
      page: () => Signup(),
      binding: SignupBinding(),
    ),
  ];
}
