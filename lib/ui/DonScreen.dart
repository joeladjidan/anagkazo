import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/HomeSignInController.dart';
import '../utils/AppColor.dart';
import '../utils/Constant.dart';

class DonScreen extends StatelessWidget {
  final homeCtrl = Get.find<HomeSignInController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      color: AppColor.blueColor,
      child: Container(
        margin: EdgeInsets.only(top: 20.0),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.fromBorderSide(BorderSide.none),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(45), topRight: Radius.circular(45))),
        child: Container(
          padding: EdgeInsets.only(top: 30.0),
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    height: 150,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(45.0),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.12),
                              offset: Offset(-2.0, 5.0),
                              blurRadius: 10.0)
                        ]),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Container(
                            height: 50,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.12),
                              borderRadius: BorderRadius.circular(45.0),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text('PAR PAYPAL',
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(height: 5.0),
                                // Text('Institution Diocésaine', style: TextStyle(color: Colors.grey,),)
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        GestureDetector(
                          onTap: () {
                            homeCtrl.donByPaypal();
                          },
                          child: Container(
                            height: 50,
                            width: 150,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.grey.withOpacity(0.30)),
                                borderRadius: BorderRadius.circular(120.0),
                                color: AppColor.yellowColor),
                            child: Center(
                              child: Text(
                                'FAIRE UN DON',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        )
                      ],
                    )),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    height: 350,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(45.0),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.12),
                              offset: Offset(-2.0, 5.0),
                              blurRadius: 10.0)
                        ]),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Container(
                            height: 50,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.12),
                              borderRadius: BorderRadius.circular(45.0),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text('PAR VIREMENT BANCAIRE',
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(height: 5.0),
                                // Text('Institution Diocésaine', style: TextStyle(color: Colors.grey,),)
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Flexible(
                          child: InteractiveViewer(
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image:
                                      NetworkImage(Constant.VIREMENT_FILE_URL),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        SizedBox(
                          height: 5.0,
                        )
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
