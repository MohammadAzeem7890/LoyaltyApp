import 'package:flutter/material.dart';
import 'package:pakistancurrency/Common/Constants.dart';
import 'package:pakistancurrency/Common/Theme.dart';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:get/get.dart';
import 'package:pakistancurrency/Controller/MoneyTransferController.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:pakistancurrency/Components/AppBar.dart';
import 'package:pakistancurrency/Components/CurrencyTable.dart';
import 'package:pakistancurrency/Components/MoneyTransfer/InfoTab.dart';

class MoneyTransfer extends StatelessWidget {
  final moneyTransferController = Get.put(MoneyTransferController());
  @override
  Widget build(BuildContext context) {
    List<Widget> _tabWidgets = <Widget>[
      InfoTab(),
      Obx(() => CurrencyTable(
          currencyData: moneyTransferController.currencyData.value)),
    ];

    return Container(
      child: Scaffold(
        key: moneyTransferController.scaffoldKey,
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
                      points:
                          moneyTransferController.isGuest.value ? false : true,
                      pointsValue: moneyTransferController.pointsValue.value,
                    ))
              ];
            },
            body: ListView(
              padding: EdgeInsets.only(bottom: 20.0),
              children: <Widget>[
                Container(
                  child: Image.asset(
                    'Assets/images/moneyTransferBanner.jpg',
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
                              color:
                                  moneyTransferController.selectedIndex.value ==
                                          0
                                      ? appTheme.primaryColor
                                      : Colors.grey.withOpacity(0.1),
                              onPressed: () {
                                moneyTransferController.onInfoButtonPressed();
                              },
                              child: Text(
                                'Info',
                                style: TextStyle(
                                    color: moneyTransferController
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
                              color:
                                  moneyTransferController.selectedIndex.value ==
                                          1
                                      ? appTheme.primaryColor
                                      : Colors.grey.withOpacity(0.1),
                              onPressed: () {
                                moneyTransferController.onRateButtonPressed();
                              },
                              child: Text(
                                'Rates',
                                style: TextStyle(
                                    color: moneyTransferController
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
                Container(
//                  height: MediaQuery.of(context).size.height / 1.5,
                  child: Obx(() => _tabWidgets
                      .elementAt(moneyTransferController.selectedIndex.value)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
