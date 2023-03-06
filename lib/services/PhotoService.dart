import 'dart:async';

import 'package:get/get.dart';

import '../globals/globals.dart';
import '../models/PhotoItem.dart';
import 'NetworkUtils.dart';

class PhotoService {
  static Future<List<PhotoItem>> getAllPhotos() async {
    var url = 'anagkazo/galerie/tous';
    var response;
    try {
      response = await NetworkUtils().get(url);
    } on TimeoutException catch (e) {
      print('Timeout');
      errorDialog(Get.context!, "connexion_timeout".tr);
    } on Error catch (e) {
      errorDialog(Get.context!, "error_internet".tr);
    }
    List<PhotoItem> photos = [];
    if (response.isEmpty) {
      return photos;
    }
    response.forEach((item) {
      PhotoItem ph = PhotoItem(
          url: item['donnee']['url'],
          id: item['donnee']['id'],
          fileName: item['donnee']['fileName'],
          date: item['donnee']['date'] != null
              ? convertTimestampToDate(item['donnee']['date'])
              : '');
      photos.add(ph);
    });
    return photos;
  }
}
