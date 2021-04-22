import 'package:flutter/material.dart';
import 'package:pakistancurrency/Common/Theme.dart';
import 'package:pakistancurrency/Common/Constants.dart';

import 'package:http/http.dart' as http;
import 'package:pakistancurrency/Controller/CurrencyExchangeController.dart';
import 'dart:convert' as convert;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

import 'package:pakistancurrency/Components/AppBar.dart';
import 'package:pakistancurrency/Components/Heading.dart';
import 'package:pakistancurrency/Components/News/CurrencyList.dart';
import 'package:pakistancurrency/Components/CurrencyTable.dart';
import 'package:pakistancurrency/Components/CurrencyExchange/InfoTab.dart';

class CurrencyExchange extends StatelessWidget {
  final currencyController = Get.put(CurrencyExchangeController());
  @override
  Widget build(BuildContext context) {
    List<Widget> _tabWidgets = <Widget>[
      InfoTab(),
      Obx(() => CurrencyTable(currencyData: currencyController.currencyData.value)),
    ];

    return Container(
      child: Scaffold(
        key: currencyController.scaffoldKey,
        body: SafeArea(
          child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                Obx(() => appBar(
                      flatButton: false,
                      menu: false,
                      tabs: false,
                      logo: true,
                      points: currencyController.isGuest.value ? false : true,
                      pointsValue: currencyController.pointsValue.value,
                    ))
              ];
            },
            body: ListView(
              padding: EdgeInsets.only(bottom: 20.0),
              children: <Widget>[
                Container(
                  child: Image.asset(
                    'Assets/images/currencyExchangeBanner.jpg',
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Obx(() => FlatButton(
                              color: currencyController.selectedIndex.value == 0
                                  ? appTheme.primaryColor
                                  : Colors.grey.withOpacity(0.1),
                              onPressed: () {
                                currencyController.onInfoButtonPressed();
                              },
                              child: Text(
                                'Info',
                                style: TextStyle(
                                    color: currencyController
                                                .selectedIndex.value ==
                                            0
                                        ? Colors.white
                                        : appTheme.primaryColor,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            )),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Obx(() => FlatButton(
                              color: currencyController.selectedIndex.value == 1
                                  ? appTheme.primaryColor
                                  : Colors.grey.withOpacity(0.1),
                              onPressed: () {
                                currencyController.onRateButtonPressed();
                              },
                              child: Text(
                                'Rates',
                                style: TextStyle(
                                    color: currencyController
                                                .selectedIndex.value ==
                                            1
                                        ? Colors.white
                                        : appTheme.primaryColor,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            )),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Obx(() => Container(
                      child: _tabWidgets
                          .elementAt(currencyController.selectedIndex.value),
                    )),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
