import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

import '../controllers/EnseignementController.dart';
import '../globals/Dropdown.dart';
import '../globals/globals.dart';
import '../routes/router.dart';
import '../utils/AppColor.dart';
import 'AudioplayScreen.dart';
import 'YoutubePlayerScreen.dart';

class EnseignementScreen extends StatelessWidget {
  EnseignementScreen({super.key});

  final enseignmtCtrl = Get.find<EnseignementController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => enseignmtCtrl.pageState.value == AppState.loading
        ? shimmerUi()
        : Enseignements(enseignmtCtrl, enseignmtCtrl.myDatas));
  }
}

Widget Enseignements(enseignmtCtrl, datas) {
  return Container(
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
                          value: enseignmtCtrl.typeEns.value,
                          dataSource: datas['typeEnseignement'],
                          textField: 'intitule',
                          valueField: 'intitule',
                          onChanged: enseignmtCtrl.changeTypEns)),
                  Container(
                      //  height: Get.height * 0.4,
                      width: Get.width * 0.35,
                      child: CustomDropDownWidget(
                          value: enseignmtCtrl.titreMess.value,
                          dataSource: datas['titreMessage'],
                          textField: 'intitule',
                          valueField: 'intitule',
                          onChanged: enseignmtCtrl.changeTitreMessage)),
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
                        enseignmtCtrl.fetchAllEnseignementsData(search: true);
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
                        enseignmtCtrl.fetchAllEnseignementsData(search: true);
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
          child: datas['enseignements'].length == 0
              ? Container(
                  height: Get.height * 0.5,
                  child: Center(
                      child: Text(
                    'Pas de données chargées',
                    style: TextStyle(
                        color: Colors.grey,
                        fontStyle: FontStyle.italic,
                        fontFamily: 'changa'),
                  )),
                )
              : Container(
                  height: Get.height * 0.6,
                  child: ListView.builder(
                      itemCount: datas['enseignements'].length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            if (datas['enseignements'][index].isYoutube ==
                                false) {
                              var value = enseignmtCtrl
                                  .getAllAudio()
                                  .where((element) =>
                                      element.id ==
                                      datas['enseignements'][index].id)
                                  .toList();
                              if (value.isNotEmpty) {
                                var valueIndex = enseignmtCtrl
                                    .getAllAudio()
                                    .indexOf(value[0]);
                                if (valueIndex != null) {
                                  pushNewScreen(context,
                                      screen: AudioPlayScreen(
                                          songIndex: valueIndex,
                                          songs: enseignmtCtrl.getAllAudio()),
                                      withNavBar: false);
                                  // Navigator.pushReplacement(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) => AudioPlayScreen(
                                  //             songIndex: valueIndex,
                                  //             songs: enseignmtCtrl
                                  //                 .getAllAudio())));
                                }
                              }
                            } else {
                              pushNewScreen(context,
                                  screen: YoutubePlayerScreen(
                                      enseignement: datas['enseignements']
                                          [index]),
                                  withNavBar: false);
                              // Navigator.pushReplacement(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => YoutubePlayerScreen(
                              //             enseignement: datas['enseignements']
                              //                 [index])));
                            }
                          },
                          child: Card(
                              child: ListTile(
                            title: Text(datas['enseignements'][index].fileName),
                            subtitle: Text('le ' +
                                datas['enseignements'][index]
                                    .dateObject
                                    .toString()),
                            leading:
                                datas['enseignements'][index].isYoutube == false
                                    ? CircleAvatar(
                                        child: Icon(
                                          Icons.play_circle_rounded,
                                          color: AppColor.yellowColor,
                                        ),
                                        backgroundColor: AppColor.blueColor)
                                    : CircleAvatar(
                                        child: Icon(
                                          Icons.play_circle_rounded,
                                          color: Colors.white,
                                        ),
                                        backgroundColor: Colors.red),
                          )),
                        );
                      })),
        )
      ],
    ),
  );
}
