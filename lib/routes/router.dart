import 'package:get/get.dart';

import '../binding/AuthControllerBinding.dart';
import '../binding/EnseignementBinding.dart';
import '../binding/HomeControllerBinding.dart';
import '../binding/HomeSiginControllerBinding.dart';
import '../binding/PlayerControllerBinding.dart';
import '../binding/SplashControllerBinding.dart';
import '../ui/AudioplayScreen.dart';
import '../ui/EmissionScreen.dart';
import '../ui/EnseignementScreen.dart';
import '../ui/HomeScreen.dart';
import '../ui/HomeSiginScreen.dart';
import '../ui/HomeSignupScreen.dart';
import '../ui/SigninScreen.dart';
import '../ui/SignupScreen.dart';
import '../ui/SplashScreen.dart';

/// Routes name to directly navigate the route by its name
class Routes {
  static String SplashScreen = '/';
  static String HomeScreen = '/home';
  static String HomeSignupScreen = '/homesignup';
  static String SignupScreen = '/signup';
  static String SigninScreen = '/signin';
  static String HomeConnectScreen = '/homeconnect';
  static String PlayerScreen = '/player';
  static String EmissionScreen = '/emission';
  static String EnseignementScreen = '/enseignement';
}

/// Add this list variable into your GetMaterialApp as the value of getPages parameter.
/// You can get the reference to the above GetMaterialApp code.
final getPages = [
  GetPage(
      name: Routes.SplashScreen,
      page: () => SplashScreen(),
      binding: SplashControllerBinding()),
  GetPage(
      name: Routes.HomeScreen,
      page: () => HomeScreen(),
      binding: HomeControllerBinding(),
      transition: Transition.leftToRightWithFade),
  GetPage(
      name: Routes.HomeSignupScreen,
      page: () => HomeSignupScreen(),
      transition: Transition.leftToRightWithFade),
  GetPage(
      name: Routes.SignupScreen,
      page: () => SingupScreen(),
      binding: AuthControllerBinding(),
      transition: Transition.leftToRightWithFade),
  GetPage(
      name: Routes.SigninScreen,
      page: () => SignInScreen(),
      binding: AuthControllerBinding(),
      transition: Transition.leftToRightWithFade),
  GetPage(
      name: Routes.HomeConnectScreen,
      page: () => HomeSignInScreen(),
      binding: HomeSiginControllerBinding(),
      transition: Transition.leftToRightWithFade),
  // GetPage(
  //     name: Routes.HomeConnectScreen,
  //     page: () => EmissionScreen(),
  //     binding: HomeSiginControllerBinding(),
  //     transition: Transition.leftToRightWithFade),
  GetPage(
      name: Routes.EmissionScreen,
      page: () => EmissionScreen(), //AudioPlayScreen(),
      binding: PlayerControllerBinding(),
      transition: Transition.leftToRightWithFade),
  GetPage(
      name: Routes.EnseignementScreen,
      page: () => EnseignementScreen(), 
      binding: EnseignementControllerBinding(),
      transition: Transition.leftToRightWithFade),
];
