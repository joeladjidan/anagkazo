import 'dart:async';

import 'package:get/get.dart';

import '../globals/globals.dart';
import '../routes/router.dart';

class SignController extends GetxController {
    RxString value = ''.obs;
    String? login;
    String? mdp;

    loginUser() async{
      closeKeyboard();
       Loader().showIndicator(Get.context!);
      var _duration = new Duration(seconds: 5);
      return new Timer(_duration, (){
        Loader().hideIndicator(Get.context!);
        Get.toNamed(Routes.HomeConnectScreen);
      });
    }
}