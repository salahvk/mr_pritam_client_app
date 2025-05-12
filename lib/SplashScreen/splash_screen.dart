import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../SpController/controller.dart';


class SplashScreen extends StatelessWidget {
  final SplashController splashController = Get.put(SplashController());
  SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset("assets/images/logo.png"),
      ),
    );
  }
}
