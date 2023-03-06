import 'dart:async';

import 'package:get/get.dart';

import '../globals/globals.dart';
import '../models/Emissions.dart';
import 'NetworkUtils.dart';

class EmissionService {
  static Future<List<Emission>> getAllEmissions() async {
    var url = 'anagkazo/emission/tous';
    var response;
    try {
      response = await NetworkUtils().get(url);
    } on TimeoutException catch (e) {
      print('Timeout');
      errorDialog(Get.context!, "connexion_timeout".tr);
    } on Error catch (e) {
      errorDialog(Get.context!, "error_internet".tr);
    }
    List<Emission> emissions = [];
    if (response.isEmpty) {
      return emissions;
    }
    response.forEach((item) {
      Emission em = Emission(
          dateObject: item['dateEmission'] != null
              ? convertTimestampToDate(item['dateEmission'])
              : '',
          fileName: item['donnee']['fileName'],
          format: item['donnee']['format'],
          id: item['id'],
          url: item['donnee']['url']);
      emissions.add(em);
    });
    return emissions;
  }
}
