import 'package:anagkazo/controllers/EnseignementController.dart';
import 'package:get/get.dart';



class EnseignementControllerBinding implements Bindings {
// default dependency
 @override
 void dependencies() {
   Get.lazyPut<EnseignementController>(() => EnseignementController(),fenix: true);
 }
}
