import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/SignController.dart';
import '../globals/Dropdown.dart';
import '../globals/Input.dart';
import '../utils/AppColor.dart';

class SingupScreen extends StatelessWidget {
  SingupScreen({super.key});
  final signCtrl = Get.find<SignController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body:
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height:MediaQuery.of(context).size.height*0.3,
              padding: EdgeInsets.only(left: 20.0),
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 20.0,),
                  Text('INSCRIPTION', style: TextStyle(color:Colors.white, fontWeight: FontWeight.bold, fontSize: 28),),
                  Text('Pour plus de fonctionnalité', style: TextStyle(fontSize: 15.0,color: Colors.white.withOpacity(0.8)),),
                  SizedBox(height: 5.0,),
                ],

              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topRight: Radius.circular(45.0), topLeft:Radius.circular(45.0))
                ),
                child: Form(
                  // key: _formKey,
                  child: Container(
                    padding: EdgeInsets.only(top:30.0),
                    child: ListView(
                      shrinkWrap: true,
                      children: <Widget>[
                        MyFormField(
                          hintText: 'Nom',
                          prefixIcon: Icon(Icons.person, color: Colors.white,),
                          validator: (String? value) {
                          },
                          onSaved: (String? value) {
                           
                          },
                        ),
                        MyFormField(
                          hintText: 'Prénom(s)',
                          prefixIcon: Icon(Icons.person, color: Colors.white,),
                          validator: (String? value) {
                            // if (value.isEmpty) {
                            //   return 'Remplissez le champs';
                            // } else {
                            //   return null;
                            // }
                          },
                          onSaved: (String? value) {
                            // this.userModel.lastname = value;
                          },
                        ),
                        Padding(
                          padding:
                          EdgeInsets.fromLTRB(12, 0.0, 15.0, 1),
                          child: Row(
                            children: <Widget>[
                              // Container(
                              //   width: MediaQuery.of(context)
                              //       .size
                              //       .width *
                              //       0.40,
                              //   child: Obx(()=>CustomDropDownWidget(
                              //     titleText: '',
                              //     hintText: 'Civilité',
                              //     value: signCtrl.value.value,
                              //     dataSource: [
                              //       {
                              //         'display': 'M.',
                              //         'value': '1',
                              //       },
                              //       {'display': 'Mme', 'value': '2'},
                              //       {'display': 'Mlle', 'value': '3'},
                              //     ],
                              //     textField: 'display',
                              //     valueField: 'value',
                              //     onSaved: (value) {
                                  
                              //     },
                              //     onChanged: (value) {
                                  
                              //     },
                              //     validator: (value) {
                                   
                              //     },
                              //   )),
                              // ),
                            ],
                          ),
                        ),
                        MyFormField(
                          hintText: 'Profession',
                          prefixIcon: Icon(Icons.work, color: Colors.white,),
                          validator: (String? value) {
                           
                          },
                          onSaved: (String? value) {}
                           
                        ),
                        MyFormFieldNumber(
                          hintText: 'Téléphone',
                          validator: (String? value) {
                          
                          },
                          onSaved: (String? value) {
                          },
                        ),
                        Center(
                          child: GestureDetector(
                            onTap: () {
                              // if (_formKey.currentState.validate()) {
                              //   _formKey.currentState.save();
                              //   userModel.birthday =
                              //       jour_anniv.toString() +
                              //           '-' +
                              //           mois_anniv;
                              //   // LoginService.signup(this.userModel).then((res){
                              //   //   if(res!='null'){
                              //   //     if(res){
                              //   Navigator.push(
                              //       context,
                              //       PageTransition(
                              //           child: SignInSecondPage(
                              //             data: userModel,
                              //           ),
                              //           type: PageTransitionType.fade,
                              //           duration:
                              //           Duration(seconds: 2)));
                              //   //     }else{
                              //   //       return 'Ce numéro existe déjà dans la base';
                              //   //     }}else{}
                              //   // });
                              // }
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 50,
                                width: 200,
                                decoration: BoxDecoration(
                                    color: AppColor.blueColor,
                                    border: Border.all(
                                        color: AppColor.blueColor,
                                        width: 2.0),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0))),
                                child: Center(
                                  child: Text(
                                    'CONTINUER',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 2.0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      backgroundColor: AppColor.blueColor,
        )
    ));
  }
}