import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../globals/Header.dart';
import '../routes/router.dart';
import '../utils/AppColor.dart';

class HomeSignupScreen extends StatelessWidget {
  const HomeSignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: Get.height * 0.3,
                  padding: EdgeInsets.only(left: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "welcome".tr,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 28),
                      ),
                      RichText(
                          text: TextSpan(
                              text: 'on'.tr,
                              style: TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.white.withOpacity(0.8)),
                              children: [
                            TextSpan(
                                text: "app_name".tr,
                                style: TextStyle(
                                    fontSize: 18.0, color: Colors.white))
                          ])),
                      SizedBox(
                        height: 24.0,
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    width: Get.width,
                    height: Get.height * 0.7,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(45.0),
                            topLeft: Radius.circular(45.0))),
                    child: ListView(
                      shrinkWrap: true,
                      children: <Widget>[
                        SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          height: 130,
                          padding: const EdgeInsets.only(top: 4.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        GestureDetector(
                          onTap: () {
                              Get.toNamed(Routes.SigninScreen);
                          },
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Container(
                                height: 68,
                                padding: EdgeInsets.only(left: 20.0),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(45.0),
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.20),
                                        blurRadius: 10.0,
                                        offset: Offset(2.0, 5.0)),
                                  ],
                                ),
                                child: Row(children: <Widget>[
                                  Expanded(
                                    flex: 5,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            'se_connecter'.tr,
                                            style: TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 2.0,
                                          ),
                                          Text('se_connecter_details'.tr,
                                              style: TextStyle(
                                                fontSize: 11.0,
                                                color: Colors.black54,
                                              )),
                                          // Text('En developement',style:TextStyle(fontSize: 12,fontStyle: FontStyle.italic, color: Colors.red))
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Icon(
                                      Icons.lock,
                                      color: Colors.black38,
                                      size: 28.0,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15.0,
                                  )
                                ])),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                             Get.toNamed(Routes.SignupScreen);
                          },
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Container(
                                height: 68,
                                padding: EdgeInsets.only(left: 20.0),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(45.0),
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.20),
                                        blurRadius: 10.0,
                                        offset: Offset(2.0, 5.0)),
                                  ],
                                ),
                                child: Row(children: <Widget>[
                                  Expanded(
                                    flex: 5,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            'signup'.tr,
                                            style: TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 2.0,
                                          ),
                                          Text('signup_details'.tr,
                                              style: TextStyle(
                                                fontSize: 11.0,
                                                color: Colors.black54,
                                              )),
                                          // Text('En developement',style:TextStyle(fontSize: 12,fontStyle: FontStyle.italic, color: Colors.red))
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Icon(
                                      Icons.person_add,
                                      color: Colors.black38,
                                      size: 28.0,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15.0,
                                  )
                                ])),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            // Navigator.push(context,
                            //     MaterialPageRoute(builder: (_) => APropos()));
//                  ;
                          },
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Container(
                                height: 68,
                                padding: EdgeInsets.only(left: 20.0),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(45.0),
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.20),
                                        blurRadius: 10.0,
                                        offset: Offset(2.0, 5.0)),
                                  ],
                                ),
                                child: Row(children: <Widget>[
                                  Expanded(
                                    flex: 5,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            'about'.tr,
                                            style: TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 2.0,
                                          ),
                                          Text('about_details'.tr,
                                              style: TextStyle(
                                                fontSize: 11.0,
                                                color: Colors.black54,
                                              )),
                                          // Text('En developement',style:TextStyle(fontSize: 12,fontStyle: FontStyle.italic, color: Colors.red))
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Icon(
                                      Icons.info,
                                      color: Colors.black38,
                                      size: 28.0,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15.0,
                                  )
                                ])),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Header(),
          ],
        ),
        backgroundColor: AppColor.blueColor,
      ),
    ));
  }
}