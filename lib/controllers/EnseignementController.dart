import 'package:anagkazo/models/TitreMessage.dart';
import 'package:anagkazo/models/TypeEnseignement.dart';
import 'package:get/get.dart';

import '../globals/globals.dart';
import '../models/Enseignement.dart';
import '../services/EnseignementService.dart';

class EnseignementController extends GetxController {
  String titreMessageValue = '';
  RxString titreMess = ''.obs;
  RxString typeEns = ''.obs;
  List<Enseignement> enseignements = [];
  List<Enseignement> backupenseignements = [];
  List<TitreMessage> titreMessages = [];
  List<TypeEnseignement> typeEnseignements = [];
  Rx<AppState> pageState = AppState.initial.obs;
  var myDatas = {}.obs;
  RxString monthValue = RxString('Janvier');
  RxString yearValue = RxString('2022');

  var months = [
    {"value": "Janvier", "libelle": "Janvier"},
    {"value": "Fevrier", "libelle": "Fevrier"},
    {"value": "Mars", "libelle": "Mars"},
    {"value": "Avril", "libelle": "Avril"},
    {"value": "Mai", "libelle": "Mai"},
    {"value": "Juin", "libelle": "Juin"},
    {"value": "Juillet", "libelle": "Juillet"},
    {"value": "Aout", "libelle": "Aout"},
    {"value": "Septembre", "libelle": "Septembre"},
    {"value": "Octobre", "libelle": "Octobre"},
    {"value": "Novembre", "libelle": "Novembre"},
    {"value": "Decembre", "libelle": "Decembre"},
  ];

  var years = [
    {"value": "2022", "libelle": "2022"},
    {"value": "2021", "libelle": "2021"},
    {"value": "2020", "libelle": "2020"},
    {"value": "2019", "libelle": "2019"},
    {"value": "2018", "libelle": "2018"},
    {"value": "2017", "libelle": "2017"},
    {"value": "2016", "libelle": "2016"},
  ];

  selectMonthValue(newValue) {
    monthValue.value = newValue;
  }

  selectYearValue(newValue) {
    yearValue.value = newValue;
  }

  @override
  void onInit() {
    super.onInit();
    fetchAllEnseignementsData();
  }

  changeTitreMessage(String NewValue) {
    this.titreMess.value = NewValue;
  }

  changeTypEns(String NewValue) {
    this.typeEns.value = NewValue;
  }

  //////// Liste des audios
  List<Enseignement> getAllAudio() {
    List<Enseignement> audios = [];
    audios =
        enseignements.where((element) => element.isYoutube == false).toList();
    return audios;
  }

  Future fetchAllEnseignementsData({bool search = false}) async {
    pageState.value = AppState.loading;
    if (search == true) {
      if (titreMess.value.isNotEmpty && typeEns.value.isNotEmpty) {
        enseignements = enseignements
            .where((element) =>
                element.titreMessage == titreMess.value &&
                element.typeEnseignement == typeEns.value)
            .toList();
      } else {
        enseignements = backupenseignements;
      }
      myDatas.value = {
        "enseignements": enseignements,
        "titreMessage": titreMessages,
        "typeEnseignement": typeEnseignements
      };
      pageState.value = AppState.loaded;
      return myDatas;
    } else {
      pageState.value = AppState.loading;
      enseignements = await EnseignementService.getAllEnseignements();
      backupenseignements = enseignements;
      titreMessages = await EnseignementService.getAllTitreMessage();
      typeEnseignements = await EnseignementService.getAllTypeEnseignements();
      myDatas.value = {
        "enseignements": enseignements,
        "titreMessage": titreMessages,
        "typeEnseignement": typeEnseignements
      };
      pageState.value = AppState.loaded;
      return myDatas;
    }
  }
}
