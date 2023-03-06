import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dialogs {
  static Future<void> showLoadingDialog(
      BuildContext context, GlobalKey key) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new WillPopScope(
              onWillPop: () async => false,
              child: SimpleDialog(
                  key: key,
                  backgroundColor: Colors.white,
                  children: <Widget>[
                    Center(
                      child: Column(children: [
                        CircularProgressIndicator(
                          valueColor: new AlwaysStoppedAnimation<Color>(Colors.deepPurple),
                        ),
                        SizedBox(height: 10,),
                        Text("dialog_wait_message".tr,style: TextStyle(color: Colors.black),)
                      ]),
                    )
                  ]));
        });
  }
}