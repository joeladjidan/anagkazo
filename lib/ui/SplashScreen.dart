import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/SplashScreenController.dart';
import '../utils/AppColor.dart';
import '../utils/Constant.dart';

class SplashScreen extends StatelessWidget {

  SplashScreen({super.key});
  
  final spashController = Get.find<SpashScreenControler>();
  @override
  Widget build(BuildContext context) {

    return SafeArea(child: Scaffold(body: Container(
      decoration: BoxDecoration(
        color: AppColor.blueColor,
        image: DecorationImage(
          image: AssetImage(
            Constant.LOGO_PATH,
          ),
          fit: BoxFit.contain,
        ),
      ),
    )));
  }
}