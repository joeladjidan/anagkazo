import 'package:get/get.dart';

import '../controllers/SplashScreenController.dart';


class SplashControllerBinding implements Bindings {
// default dependency
 @override
 void dependencies() {
   Get.lazyPut<SpashScreenControler>(() => SpashScreenControler(),fenix: true);
 }
}
