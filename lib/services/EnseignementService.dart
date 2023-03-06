import 'dart:async';

import 'package:anagkazo/models/Enseignement.dart';
import 'package:get/get.dart';

import '../globals/globals.dart';
import '../models/TitreMessage.dart';
import '../models/TypeEnseignement.dart';
import 'NetworkUtils.dart';

class EnseignementService {
  static Future<List<Enseignement>> getAllEnseignements() async {
    var url = 'anagkazo/enseignement/tous';
    var response;
    try {
      response = await NetworkUtils().get(url);
    } on TimeoutException catch (e) {
      print('Timeout');
      errorDialog(Get.context!, "connexion_timeout".tr);
    } on Error catch (e) {
      errorDialog(Get.context!, "error_internet".tr);
    }
    List<Enseignement> enseignements = [];
    if (response.isEmpty) {
      return enseignements;
    }
    response.forEach((item) {
      Enseignement em = Enseignement(
        dateObject: convertTimestampToDate(item['donnee']['date']),
        fileName: item['donnee']['fileName'],
        format: item['donnee']['format'],
        id: item['donnee']['id'],
        url: item['donnee']['url'],
        titreMessage: item['titreMessage']['intitule'],
        typeEnseignement: item['typeEnseignement']['intitule'],
        isYoutube: item['youtube'],
      );
      enseignements.add(em);
    });
    return enseignements;
  }

  static Future<List<TitreMessage>> getAllTitreMessage() async {
    var url = 'anagkazo/titre-message/tous';
    var response;
    try {
      response = await NetworkUtils().get(url);
    } on TimeoutException catch (e) {
      print('Timeout');
      errorDialog(Get.context!, "connexion_timeout".tr);
    } on Error catch (e) {
      errorDialog(Get.context!, "error_internet".tr);
    }
    List<TitreMessage> titres = [];
    if (response.isEmpty) {
      return titres;
    }
    response.forEach((item) {
      TitreMessage em = TitreMessage(
        intitule: item['intitule'],
        description: item['description'],
        id: item['intitule'],
      );
      titres.add(em);
    });
    return titres;
  }

  static Future<List<TypeEnseignement>> getAllTypeEnseignements() async {
    var url = 'anagkazo/type-enseignement/tous';
    var response;
    try {
      response = await NetworkUtils().get(url);
    } on TimeoutException catch (e) {
      print('Timeout');
      errorDialog(Get.context!, "connexion_timeout".tr);
    } on Error catch (e) {
      errorDialog(Get.context!, "error_internet".tr);
    }
    List<TypeEnseignement> titres = [];
    if (response.isEmpty) {
      return titres;
    }
    response.forEach((item) {
      TypeEnseignement em = TypeEnseignement(
          intitule: item['intitule'],
          description: item['description'],
          id: item['intitule']);
      titres.add(em);
    });
    return titres;
  }
}
