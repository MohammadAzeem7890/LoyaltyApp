import 'package:flutter/material.dart';
import 'package:pakistancurrency/Common/Constants.dart';

import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:http/http.dart' as http;
import 'package:pakistancurrency/Controller/HomePageController.dart';
import 'dart:convert' as convert;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:pakistancurrency/Components/AppBar.dart';
import 'package:pakistancurrency/Components/HomeScreen/ServicesSection.dart';
import 'package:pakistancurrency/Components/HomeScreen/BannerList.dart';
import 'package:pakistancurrency/Components/AppDrawer.dart';
import 'package:pakistancurrency/Components/HomeScreen/Partners.dart';
import 'package:pakistancurrency/Components/bottomNavigationBar.dart';
import 'package:pakistancurrency/Components/Heading.dart';
import 'package:pakistancurrency/Screens/HomeScreenTabs/HomeTab.dart';
import 'package:pakistancurrency/Screens/HomeScreenTabs/LoyaltyTab.dart';
import 'package:pakistancurrency/Screens/HomeScreenTabs/LocatorTab.dart';
import 'package:pakistancurrency/Components/GuestUserWarning.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  final homeController = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {

    List<Widget> _widgetOptions = <Widget>[
      HomeTab(onTap: (){
        // ignore: unnecessary_statements
        homeController.onItemTapped;
      },),
      LocatorTab(),
      Center(child: Text('Explore')),
      Obx(() => homeController.isGuest.value ? GuestUserWarning() : LoyaltyTab()),
    ];

    return Container(
      child: GetX<HomePageController>(
        builder: (snapshot) {
          return Scaffold(
            key: snapshot.scaffoldKey ?? 0,
            drawer: AppDrawer(
                name: snapshot.name.value ?? '',
                identityNo: snapshot.identityNo.value ?? '',
                onClose: () {
                  Navigator.pop(context);
                }),
            bottomNavigationBar:
            bottomNavigationBar(snapshot.selectedIndex.value ?? 0, snapshot.selectedIndex),
            body: SafeArea(
              child: NestedScrollView(
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    snapshot.selectedIndex.value != 1
                        ? appBar(
                      flatButton: false,
                      menu: false,
                      menuPressed: () {
                        snapshot.scaffoldKey.currentState.openDrawer();
                      },
                      tabs: false,
                      logo: true,
                      points: snapshot.isGuest.value ? false : true,
                      pointsValue: snapshot.pointsValue.value ?? '',
                    )
                        : SliverToBoxAdapter()
                  ];
                },
                body: _widgetOptions.elementAt(snapshot.selectedIndex.value ?? 1),
              ),
            ),
          );
        }
      ),
    );
  }
}
