import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/HomeSignInController.dart';
import '../globals/globals.dart';

class GalleryScreen extends StatelessWidget {
  GalleryScreen({super.key});
  final homeCtrl = Get.find<HomeSignInController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      extendBodyBehindAppBar: true,
      body: FutureBuilder(
          future: homeCtrl.fetchAllPhotos(),
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
                    : phototheque(snapshot.data);
              }
            }
            return Container();
          }),
    ));
  }

  Widget phototheque(photos) {
    return Container(
        height: double.infinity,
        // margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        child: Column(children: <Widget>[
          Container(
              height: Get.height * 0.85,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0,
                  crossAxisCount: 2,
                ),
                itemCount: photos.length,
                itemBuilder: (context, index) {
                  // Item rendering
                  return Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(photos[index].url),
                      ),
                    ),
                  );
                },
              ))
        ]));
  }
}
