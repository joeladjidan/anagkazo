import 'package:anagkazo/models/Emissions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

import '../controllers/HomeSignInController.dart';
import '../globals/globals.dart';
import '../routes/router.dart';
import '../utils/AppColor.dart';
import 'AudioplayScreen.dart';

class EmissionScreen extends StatelessWidget {
  EmissionScreen({super.key});

  final homeSignCtrl = Get.find<HomeSignInController>();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: homeSignCtrl.fetchAllEmissions(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.none &&
                  !snapshot.hasData ||
              snapshot.connectionState == ConnectionState.waiting) {
            return shimmerUi();
          } else {
            if (snapshot.hasError) {
              print(snapshot.error);
            }
            if (snapshot.hasData) {
              return snapshot.data.length == 0
                  ? Center(
                      child: Text(
                      'Pas de données chargées',
                      style: TextStyle(
                          color: Colors.grey,
                          fontStyle: FontStyle.italic,
                          fontFamily: 'changa'),
                    ))
                  : Emissions(snapshot.data);
            }
          }
          return Container();
        });
  }
}

Widget Emissions(emissions) {
  return Container(
    height: double.infinity,
    margin: EdgeInsets.only(top: 20),
    width: double.infinity,
    child: Column(
      children: <Widget>[
        Container(
            height: Get.height * 0.77,
            child: ListView.builder(
                itemCount: emissions.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      pushNewScreen(context,
                          screen: AudioPlayScreen(
                              songIndex: index, songs: emissions),
                          withNavBar: false);
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => AudioPlayScreen(
                      //             songIndex: index, songs: emissions)));
                    },
                    child: Card(
                        child: ListTile(
                      title: Text(emissions[index].fileName),
                      subtitle:
                          Text('le ' + emissions[index].dateObject.toString()),
                      leading: CircleAvatar(
                          child: Icon(
                            Icons.play_circle_rounded,
                            color: AppColor.yellowColor,
                          ),
                          backgroundColor: AppColor.blueColor),
                    )),
                  );
                }))
      ],
    ),
  );
}
