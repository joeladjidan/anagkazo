import 'package:get/get.dart';

import '../controllers/SignController.dart';


class AuthControllerBinding implements Bindings {
// default dependency
 @override
 void dependencies() {
   Get.lazyPut<SignController>(() => SignController(),fenix: true);
 }
}
