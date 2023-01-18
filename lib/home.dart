import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poc_web_navigation/route.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: TextButton(
        child: const Text(
          'Home',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () => Get.rootDelegate.toNamed(Routes.LOGIN),
      ),
    );
  }
}
