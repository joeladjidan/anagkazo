import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/AppColor.dart';
import '../utils/Constant.dart';

Widget Header() {
    return Positioned(
      top: Get.height * 0.20,
      left: 10.0,
      child: Container(
          padding: EdgeInsets.all(2.0),
          constraints: BoxConstraints(
            maxWidth: 100,
            maxHeight: 100,
          ),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.black.withOpacity(0.50),
                    blurRadius: 10,
                    offset: Offset(1.0, 5.0))
              ]),
          child: Container(
            padding: EdgeInsets.all(10.0),
            constraints: BoxConstraints(
              maxWidth: 100,
              maxHeight: 100,
            ),
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: AppColor.blueColor),
            child: Container(
              height: Get.height * 0.3,
              child: Container(
                  padding: EdgeInsets.all(2.0),
                  constraints: BoxConstraints(
                    maxWidth: 100,
                    maxHeight: 100,
                  ),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    constraints: BoxConstraints(
                      maxWidth: 100,
                      maxHeight: 100,
                    ),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                    child: ClipRRect(
                      child: Image.asset(Constant.LOGO_PATH,width: 100,height: 100,),
                    ),
                  )),
            ),
          )),
    );
  }