import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

import '../controllers/HomeSignInController.dart';
import '../globals/BottomNavigator.dart';
import '../globals/Drawer.dart';
import '../utils/AppColor.dart';
import 'AboutScreen.dart';
import 'ArchiveScreen.dart';
import 'DonScreen.dart';
import 'EmissionScreen.dart';
import 'EnseignementScreen.dart';
import 'GalleryScreen.dart';

class HomeSignInScreen extends StatelessWidget {
  HomeSignInScreen({super.key});

  final homeCtrl = Get.find<HomeSignInController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: WillPopScope(
      onWillPop: () async => false,
      child: new Obx(
        () => Scaffold(
            appBar: AppBar(
              bottomOpacity: 0.0,
              backgroundColor: AppColor.blueColor,
              iconTheme: new IconThemeData(color: Colors.white),
              centerTitle: true,
              elevation: 0.0,
              title: SizedBox(
                child: Text(
                  homeCtrl.currentTabsTitle.value,
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Montserrat',
                      color: Colors.white),
                ),
              ),
            ),
            drawerScrimColor: Colors.grey[500],
            // drawer: DrawerWidget(),
            body: PersistentTabView(
              context,
              controller: homeCtrl.controller,
              screens: [
                EmissionScreen(),
                EnseignementScreen(),
                ArchiveScreen(),
                GalleryScreen(),
                DonScreen(),
                AboutScreen()
              ],
              items: homeCtrl.navBarsItems(context),
              confineInSafeArea: true,
              backgroundColor: AppColor.blueColor, // Default is Colors.white.
              handleAndroidBackButtonPress: true, // Default is true.
              resizeToAvoidBottomInset:
                  true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
              stateManagement: true, // Default is true.
              hideNavigationBarWhenKeyboardShows:
                  true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
              decoration: NavBarDecoration(
                borderRadius: BorderRadius.circular(10.0),
                colorBehindNavBar: Colors.white,
              ),
              popAllScreensOnTapOfSelectedTab: true,
              popActionScreens: PopActionScreensType.all,
              itemAnimationProperties: ItemAnimationProperties(
                // Navigation Bar's items animation properties.
                duration: Duration(milliseconds: 200),
                curve: Curves.ease,
              ),
              screenTransitionAnimation: ScreenTransitionAnimation(
                // Screen transition animation on change of selected tab.
                animateTabTransition: true,
                curve: Curves.ease,
                duration: Duration(milliseconds: 200),
              ),
              navBarStyle: NavBarStyle
                  .style6, // Choose the nav bar style with this property.
            )),
      ),
    ));
  }
}
