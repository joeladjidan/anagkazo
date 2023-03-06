import 'package:get/get.dart';

import '../controllers/EnseignementController.dart';
import '../controllers/HomeSignInController.dart';
import '../controllers/YoutubeController.dart';


class HomeSiginControllerBinding implements Bindings {
// default dependency
 @override
 void dependencies() {
   Get.lazyPut<HomeSignInController>(() => HomeSignInController(),fenix: true);
  Get.lazyPut<EnseignementController>(() => EnseignementController(),fenix: true);
  Get.lazyPut<YoutubeController>(() => YoutubeController(),fenix: true);

 }
}
