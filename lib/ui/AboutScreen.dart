import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/AppColor.dart';
import '../utils/Constant.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

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
                    height: 60,
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
                                Container(
                                  width: Get.width * 0.8,
                                  child: Text('about_first_text'.tr,
                                      maxLines: 2,
                                      style: TextStyle(
                                          color: Colors.black87,
                                          fontWeight: FontWeight.bold)),
                                ),
                                SizedBox(height: 5.0),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        )
                      ],
                    )),
              ),
              SizedBox(
                height: 5.0,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    height: Get.height * 0.45,
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
                        SizedBox(
                          height: 10,
                        ),
                        Flexible(
                          child: InteractiveViewer(
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(Constant.ABOUT_IMAGE_URL),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                      ],
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    height: 130,
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
                            height: 120,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.12),
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  width: Get.width * 0.89,
                                  child: Text('about_second_text'.tr,
                                      maxLines: 6,
                                      style: TextStyle(
                                          color: Colors.black87,
                                          fontWeight: FontWeight.bold)),
                                ),
                                SizedBox(height: 5.0),
                              ],
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
                height: 5.0,
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
