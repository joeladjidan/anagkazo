import 'dart:async';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../utils/Constant.dart';

class HomeController extends GetxController {

   final box = GetStorage();
    ////get user connexted
    Future<bool> checkUserLogin() async {
      bool  isConnected = box.read(Constant.ISCONNECTED) ?? false;
      return isConnected;
    }
}