import 'dart:async';

import 'package:flutter/animation.dart';
import 'package:get/get.dart';

import '../routes/router.dart';

class SpashScreenControler extends GetxController with GetSingleTickerProviderStateMixin{

  RxBool _visible = true.obs;

  late AnimationController animationController;
  late Animation<double> animation;

  startTime() async {
    var _duration = new Duration(seconds: 5);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Get.offAllNamed(Routes.HomeConnectScreen);
  }

  @override
  void onInit() {
    super.onInit();
    animationController = new AnimationController(
        vsync: this, duration: new Duration(seconds: 3));
    animation =
        new CurvedAnimation(parent: animationController, curve: Curves.easeOut);

    // animation.addListener(() => this.setState(() {}));
    animationController.forward();
    this._visible.value = !this._visible.value;
     startTime();
  }
}