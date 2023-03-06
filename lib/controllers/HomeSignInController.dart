import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:url_launcher/url_launcher.dart';

import '../services/EmissionService.dart';
import '../services/PhotoService.dart';
import '../utils/AppColor.dart';
import '../utils/Constant.dart';

class HomeSignInController extends GetxController {
  RxString currentTabsTitle = 'accueil'.tr.capitalize!.obs;
  RxInt currentIndex = 0.obs;
  String user_name = 'ANAGKAZO';
  String initialLetter = 'A';
  late PersistentTabController controller;
  final box = GetStorage();

  movePageBottomNavigation(index) {
    currentTabsTitle.value = index == 0
        ? 'emissions'.tr
        : index == 1
            ? 'enseignements'.tr
            : index == 2
                ? 'archives'.tr
                : index == 3
                    ? 'galerie'.tr
                    : index == 4
                        ? 'dons'.tr
                        : 'a_propos'.tr;
  }

  @override
  void onInit() {
    super.onInit();
    controller = PersistentTabController(initialIndex: 0);
    currentIndex.value = 0;
  }

  donByPaypal() async {
    var url = Uri.parse(Constant.PAYPAL_URL);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  List<PersistentBottomNavBarItem> navBarsItems(context) {
    return [
      PersistentBottomNavBarItem(
          icon: Icon(Icons.live_tv),
          title: "Emissions",
          activeColorPrimary: AppColor.yellowColor,
          inactiveColorPrimary: Colors.grey,
          inactiveColorSecondary: Colors.grey,
          onPressed: (context) {
            this.movePageBottomNavigation(0);
            controller.jumpToTab(0);
          }),
      PersistentBottomNavBarItem(
          icon: Icon(Icons.book),
          title: "Enseigne..",
          activeColorPrimary: AppColor.yellowColor,
          inactiveColorPrimary: Colors.grey,
          inactiveColorSecondary: Colors.grey,
          onPressed: (context) {
            this.movePageBottomNavigation(1);
            controller.jumpToTab(1);
          }),
      PersistentBottomNavBarItem(
          icon: Icon(Icons.archive),
          title: "Archives",
          activeColorPrimary: AppColor.yellowColor,
          inactiveColorPrimary: Colors.grey,
          inactiveColorSecondary: Colors.grey,
          onPressed: (context) {
            this.movePageBottomNavigation(2);
            controller.jumpToTab(2);
          }),
      PersistentBottomNavBarItem(
          icon: Icon(Icons.image),
          title: "Galerie",
          activeColorPrimary: AppColor.yellowColor,
          inactiveColorPrimary: Colors.grey,
          inactiveColorSecondary: Colors.grey,
          onPressed: (context) {
            this.movePageBottomNavigation(3);
            controller.jumpToTab(3);
          }),
      PersistentBottomNavBarItem(
          icon: Icon(Icons.card_giftcard),
          title: "Dons",
          activeColorPrimary: AppColor.yellowColor,
          inactiveColorPrimary: Colors.grey,
          inactiveColorSecondary: Colors.grey,
          onPressed: (context) {
            this.movePageBottomNavigation(4);
            controller.jumpToTab(4);
          }),
      PersistentBottomNavBarItem(
          icon: Icon(Icons.settings),
          title: "A propos",
          activeColorPrimary: AppColor.yellowColor,
          inactiveColorPrimary: Colors.grey,
          inactiveColorSecondary: Colors.grey,
          onPressed: (context) {
            this.movePageBottomNavigation(5);
            controller.jumpToTab(5);
          }),
    ];
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future fetchAllEmissions() async {
    var emissions = await EmissionService.getAllEmissions();
    return emissions;
  }

  Future fetchAllPhotos() async {
    var photos = await PhotoService.getAllPhotos();
    return photos;
  }
}
