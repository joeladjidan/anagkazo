import 'package:anagkazo/utils/Internationalization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'binding/HomeSiginControllerBinding.dart';
import 'routes/router.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
   await GetStorage.init();
      runApp(GetMaterialApp(
        // home: SplashScreen(),
        initialBinding: HomeSiginControllerBinding(),
        debugShowCheckedModeBanner: true,
        initialRoute: Routes.SplashScreen,
        getPages: getPages,
        translations: Messages(),
        locale: Locale('fr', 'FR'), 
        fallbackLocale: Locale('fr', 'FR'),
      ));
}
