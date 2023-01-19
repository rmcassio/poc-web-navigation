import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poc_web_navigation/route.dart';
import 'package:poc_web_navigation/shared_preferences_utils.dart';

void main() async {
  await SharedPreferencesUtils.init();

  runApp(GetMaterialApp.router(
    debugShowCheckedModeBanner: false,
    defaultTransition: Transition.fadeIn,
    getPages: AppPages.pages,
    routerDelegate: AppRouterDelegate(),
  ));
}
