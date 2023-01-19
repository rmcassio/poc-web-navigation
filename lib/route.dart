import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poc_web_navigation/home.dart';
import 'package:poc_web_navigation/home_binding.dart';
import 'package:poc_web_navigation/login.dart';
import 'package:poc_web_navigation/login_binding.dart';
import 'package:poc_web_navigation/persons.dart';
import 'package:poc_web_navigation/persons_binding.dart';
import 'package:poc_web_navigation/signup.dart';
import 'package:poc_web_navigation/signup_binding.dart';

abstract class Routes {
  static const HOME = '/home';
  static const LOGIN = '/login';
  static const SIGNUP = '/signup';
  static const PERSONS = '/person';
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
      name: Routes.LOGIN,
      page: () => const Login(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.SIGNUP,
      page: () => const Signup(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => const Home(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.PERSONS,
      page: () => const Persons(),
      binding: PersonsBinding(),
    ),
  ];
}
