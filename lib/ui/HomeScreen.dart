import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/HomeController.dart';
import 'HomeSignupScreen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final homeCtrl = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
            future: homeCtrl.checkUserLogin(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data ==  true) return Home();
              }
              return HomeSignupScreen();
            });
  }
}

Widget Home(){
  return SafeArea(child: Scaffold(body: Container(child: Text('Home'),)),);
}