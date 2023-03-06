import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/HomeSignInController.dart';
import '../routes/router.dart';
import '../utils/AppColor.dart';


class DrawerWidget extends StatelessWidget {
  DrawerWidget({super.key});
  final homeCtrl = Get.find<HomeSignInController>();
  
  @override
  Widget build(BuildContext context) {
    return  Drawer(
      elevation: 0.0,
      child: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 0.0),
            padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
            decoration: BoxDecoration(
                color: AppColor.blueColor,
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.elliptical(30, 120))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      homeCtrl.user_name.toString().toUpperCase(),
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 13,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      height: 80,
                      width: 80,
                      child: CircleAvatar(
                        backgroundColor: Colors.white24,
                        child: Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.white, width: 4.0),
                                  borderRadius: BorderRadius.circular(35.0)),
                              child: Center(
                                  child: Text(
                                      homeCtrl.initialLetter.toString().toUpperCase(),
                                      style: TextStyle(
                                          fontSize: 32, color: Colors.white)))),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
              ],
            ),
          ),
          ListTile(
            dense: true,
            leading: Icon(Icons.home, color: AppColor.yellowColor),
            title: Text(
              'accueil'.tr,
              style: TextStyle(
                  fontSize: 13,
                  color: AppColor.yellowColor,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat'),
            ),
            onTap: () {
            //  Get.toNamed(Routes.HomeConnectScreen,arguments: [
            //                             {"page": 0}
            //                         ]);
            },
          ),
         
          ListTile(
            onTap: () {
              // homeCtrl.navigationDrawer(1);
              //  Get.toNamed(Routes.HomeConnectScreen,arguments: [
              //                           {"page": 1}
              //                       ]);
            },
            leading: Icon(Icons.live_tv, color: Colors.black45),
            title: Text(
              'emissions'.tr,
              style: TextStyle(
                  fontSize: 13,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat'),
            ),
          ),
          ListTile(
            onTap: () {
                // Get.toNamed(Routes.HomeConnectScreen,arguments: [
                //                         {"page": 2}
                //                     ]);
            },
            leading: Icon(Icons.book, color: Colors.black45),
            title: Text(
              'enseignements'.tr,
              style: TextStyle(
                  fontSize: 13,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat'),
            ),
          ),
          ListTile(
            onTap: () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => HomeCEBMOUVASSOCGROUP()));
            },
            leading: Icon(Icons.image, color: Colors.black45),
            title: Text(
              'galerie'.tr,
              style: TextStyle(
                  fontSize: 13,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat'),
            ),
          ),
          ListTile(
            onTap: () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => HomeCEBMOUVASSOCGROUP()));
            },
            leading: Icon(Icons.archive, color: Colors.black45),
            title: Text(
              'archive'.tr,
              style: TextStyle(
                  fontSize: 13,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat'),
            ),
          ),
          ListTile(
            onTap: () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => HomeDonsSignUpUser()));
            },
            leading: Icon(Icons.card_giftcard, color: Colors.black45),
            title: Text(
              'dons'.tr,
              style: TextStyle(
                  fontSize: 13,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat'),
            ),
          ),
          // ListTile(
          //   onTap: () {
          //     // Navigator.push(context,
          //     //     MaterialPageRoute(builder: (context) => HomeParametre()));
          //   },
          //   leading: Icon(Icons.person, color: Colors.black45),
          //   title: Text(
          //     'profile'.tr,
          //     style: TextStyle(
          //         fontSize: 13,
          //         color: Colors.black87,
          //         fontWeight: FontWeight.bold,
          //         fontFamily: 'Montserrat'),
          //   ),
          // ),
          ListTile(
            onTap: () async {
              // SharedPreferences sharedPreferences =
              //     await SharedPreferences.getInstance();
              // sharedPreferences.setBool('isLogin', false);
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => HomeNonSignUpUser()));
            },
            leading: Icon(Icons.settings, color: Colors.black45),
            title: Text(
              'about'.tr.capitalize!,
              style: TextStyle(
                  fontSize: 13,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat'),
            ),
          ),
          // ListTile(
          //   onTap: () async {
          //     // SharedPreferences sharedPreferences =
          //     //     await SharedPreferences.getInstance();
          //     // sharedPreferences.setBool('isLogin', false);
          //     // Navigator.push(context,
          //     //     MaterialPageRoute(builder: (context) => HomeNonSignUpUser()));
          //   },
          //   leading: Icon(Icons.exit_to_app, color: Colors.black45),
          //   title: Text(
          //     'deconnexion'.tr.capitalize!,
          //     style: TextStyle(
          //         fontSize: 13,
          //         color: Colors.black87,
          //         fontWeight: FontWeight.bold,
          //         fontFamily: 'Montserrat'),
          //   ),
          // ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}