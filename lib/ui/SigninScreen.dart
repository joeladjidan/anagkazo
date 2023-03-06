import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/SignController.dart';
import '../globals/Input.dart';
import '../routes/router.dart';
import '../utils/AppColor.dart';
import '../utils/Constant.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});
  final authCtrl = Get.find<SignController>();

  @override
  Widget build(BuildContext context) {
    final _key = GlobalKey<ScaffoldState>();
    final _formKey = GlobalKey<FormState>();

    return SafeArea(child: Scaffold(
      key: _key,
      body: Column(
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
                  'connexion'.tr,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 28),
                ),
                Text(
                  'connect_anagkazo'.tr,
                  style: TextStyle(
                      fontSize: 15.0, color: Colors.white.withOpacity(0.8)),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(45.0),
                      topLeft: Radius.circular(45.0))),
              child: ListView(
                children: <Widget>[
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child: Column(
                            children: <Widget>[
                              Image(
                                image: AssetImage(Constant.LOGO_PATH),
                                width: 130,
                                height: 130,
                              ),
                              SizedBox(
                                height:
                                    Get.height * 0.03,
                              ),
                              Form(
                                key: _formKey,
                                child: Container(
                                    height: 150,
                                    child: Column(
                                      children: <Widget>[
                                        MyFormFieldNumber(
                                          hintText: 'input_numero'.tr,
                                          validator: (String? value) {
                                                if (value!.isEmpty) {
                                                    return 'champs_requis'.tr;
                                                  } else {
                                                    return null;
                                                  }
                                          },
                                          onSaved: (String? value) {

                                          },
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        MyFormField(
                                          hintText: 'mot_passe'.tr,
                                          isPassword: true,
                                          prefixIcon: Icon(
                                            Icons.lock,
                                            color: Colors.white,
                                          ),
                                          validator: (String? value) {
                                            // if (value.length < 4) {
                                            //   setState(() {
                                            //     isLoading = false;
                                            //   });
                                            //   return 'Longueur minimale pas atteinte';
                                            // }
                                            return null;
                                          },
                                          onSaved: (String? value) {
                                            // this.model['password'] = value;
                                          },
                                        )
                                      ],
                                    )),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            width: Get.width * 0.6,
                            height: 50,
                            child: Center(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'se_connecter'.tr,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 2.0),
                                ),
                              ],
                            )),
                            decoration: BoxDecoration(
                                color: AppColor.blueColor,
                                border:
                                    Border.all(color: Colors.white, width: 2.1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                          ),
                          onTap: () {
                            authCtrl.loginUser();
                          },
                        ),
                        TextButton(
                            onPressed: () {
                            Get.toNamed(Routes.SignupScreen);
                            },
                            child: Container(
                                child: Text('ou_sinscrire'.tr,
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontWeight: FontWeight.bold))))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      backgroundColor: AppColor.blueColor,
    ));
  }
}