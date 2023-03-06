import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/EnseignementController.dart';
import '../globals/Dropdown.dart';
import '../globals/globals.dart';
import '../utils/AppColor.dart';

class ArchiveScreen extends StatelessWidget {
  ArchiveScreen({super.key});

  final enseignmtCtrl = Get.find<EnseignementController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => enseignmtCtrl.pageState.value == AppState.loading
        ? shimmerUi()
        : archives(enseignmtCtrl, enseignmtCtrl.myDatas));
  }
}

Widget archives(enseignmtCtrl, datas) {
  return Container(
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
          height: double.infinity,
          margin: EdgeInsets.only(top: 20),
          width: double.infinity,
          child: Column(
            children: <Widget>[
              Container(
                height: Get.height * 0.19,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            //  height: Get.height * 0.4,
                            width: Get.width * 0.35,
                            child: CustomDropDownWidget(
                                value: enseignmtCtrl.monthValue.value,
                                dataSource: enseignmtCtrl.months,
                                textField: 'intitule',
                                valueField: 'intitule',
                                model: 2,
                                onChanged: enseignmtCtrl.selectMonthValue)),
                        Container(
                            //  height: Get.height * 0.4,
                            width: Get.width * 0.35,
                            child: CustomDropDownWidget(
                                value: enseignmtCtrl.yearValue.value,
                                dataSource: enseignmtCtrl.years,
                                textField: 'intitule',
                                valueField: 'intitule',
                                model: 2,
                                onChanged: enseignmtCtrl.selectMonthValue)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            child: Text('Afficher'),
                            style: ElevatedButton.styleFrom(
                              primary: AppColor.blueColor,
                            ),
                            onPressed: () {
                              enseignmtCtrl.fetchAllEnseignementsData(
                                  search: true);
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            child: Text('Annuler'),
                            style: ElevatedButton.styleFrom(
                              primary: AppColor.yellowColor,
                            ),
                            onPressed: () {
                              enseignmtCtrl.titreMess.value = '';
                              enseignmtCtrl.typeEns.value = '';
                              enseignmtCtrl.fetchAllEnseignementsData(
                                  search: true);
                            },
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Card(
                elevation: 2.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Container(),
              )
            ],
          ),
        ),
      ));
}
