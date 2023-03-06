import 'package:get/get.dart';

import '../controllers/HomeController.dart';


class HomeControllerBinding implements Bindings {
// default dependency
 @override
 void dependencies() {
   Get.lazyPut<HomeController>(() => HomeController(),fenix: true);
 }
}
