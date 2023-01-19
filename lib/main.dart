import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poc_web_navigation/route.dart';

void main() async {
  runApp(GetMaterialApp.router(
    debugShowCheckedModeBanner: false,
    defaultTransition: Transition.fade,
    getPages: AppPages.pages,
    routerDelegate: AppRouterDelegate(),
  ));
}
