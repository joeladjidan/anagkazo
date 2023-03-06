import 'package:get/get.dart';

import '../controllers/PlayerController.dart';


class PlayerControllerBinding implements Bindings {
// default dependency
 @override
 void dependencies() {
   Get.lazyPut<PlayerController>(() => PlayerController(),fenix: true);
 }
}
