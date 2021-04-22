import 'package:flutter/material.dart';
import 'package:pakistancurrency/Common/Theme.dart';
import 'package:pakistancurrency/Common/Constants.dart';

import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:pakistancurrency/Controller/CurrencyCalculatorController.dart';
import 'package:pakistancurrency/Controller/HomeTabController.dart';
import 'dart:convert' as convert;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:pakistancurrency/Components/AppBar.dart';
import 'package:pakistancurrency/Components/Heading.dart';
import 'package:pakistancurrency/Components/dropDownList.dart';
import 'package:pakistancurrency/Components/InputField.dart';

class CurrencyCalculator extends StatelessWidget {
  final currencyCalculateController = Get.put(CurrencyCalculatorController());
  final homeTabController = Get.find<
      HomeTabController>(); // access user data and currency data from homeTabController
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () {
          currencyCalculateController.setOnFocus(context);
        },
        child: Scaffold(
          key: currencyCalculateController.scaffoldKey,
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
                      points: currencyCalculateController.isGuest.value
                          ? false
                          : true,
                      pointsValue:
                          currencyCalculateController.pointsValue.value))
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
                    height: 20.0,
                  ),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    margin: EdgeInsets.symmetric(horizontal: 20.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 15.0,
                          offset: Offset(0, 10), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      children: <Widget>[
                        Table(
                          defaultVerticalAlignment:
                              TableCellVerticalAlignment.middle,
                          children: <TableRow>[
                            TableRow(children: <Widget>[
                              ListTile(
                                contentPadding: EdgeInsets.all(0.0),
                                title: const Text('Buy'),
                                leading: Obx(() => Radio(
                                      activeColor: appTheme.primaryColor,
                                      value: ConvertType.buy,
                                      groupValue: currencyCalculateController
                                          .convertType.value,
                                      onChanged: (value) {
                                        currencyCalculateController
                                            .chooseConverterMode(value);
                                      },
                                    )),
                              ),
                              ListTile(
                                contentPadding: EdgeInsets.all(0.0),
                                title: const Text('Sell'),
                                leading: Obx(() => Radio(
                                      activeColor: appTheme.primaryColor,
                                      value: ConvertType.sell,
                                      groupValue: currencyCalculateController
                                          .convertType.value,
                                      onChanged: (value) {
                                        currencyCalculateController
                                            .chooseConverterMode(value);
                                      },
                                    )),
                              ),
                            ]),
                            TableRow(children: <Widget>[
                              Text(
                                'From',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    color: appTheme.primaryColor),
                              ),
                              Obx(() => LimitedBox(
                                    maxWidth: 90.0,
                                    child: dropDownList(
                                      hint: 'Select',
                                      dropdownValue:
                                          currencyCalculateController
                                              .fromSelected.value,
                                      noUnderline: true,
                                      removeTopSpace: true,
                                      items: currencyCalculateController
                                          .currencyList.value,
                                      onChange: (String newValue) {
                                        print('this is from');
                                        currencyCalculateController
                                            .chooseFromCurrency(newValue);
                                      },
                                    ),
                                  )),
                            ]),
                            TableRow(children: <Widget>[
                              Text(
                                'To',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    color: appTheme.primaryColor),
                              ),
                              Obx(() => LimitedBox(
                                    maxWidth: 90.0,
                                    child: dropDownList(
                                      hint: 'Select',
                                      dropdownValue: currencyCalculateController
                                          .toSelected.value,
                                      noUnderline: true,
                                      removeTopSpace: true,
                                      items: currencyCalculateController.currencyList.value,
                                      onChange: (String newValue) {
                                        print('This is to ');
                                        currencyCalculateController
                                            .chooseToCurrency(newValue);
                                      },
                                    ),
                                  )),
                            ]),
                            TableRow(children: <Widget>[
                              Text(
                                'Amount',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    color: appTheme.primaryColor),
                              ),
                              InputField(
                                  placeholder: 'Enter amount',
                                  onChange: (text) {
                                    currencyCalculateController.amount.value =
                                        text;
                                  }),
                            ]),
                            TableRow(children: <Widget>[
                              Text(
                                'Converted',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    color: appTheme.primaryColor),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15.0, horizontal: 10.0),
                                margin: EdgeInsets.only(top: 10.0),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey)),
                                child: Text(
                                  currencyCalculateController
                                          .convertedValue.value ??
                                      'Rate...',
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      color: Colors.grey.shade700),
                                ),
                              ),
                            ]),
                          ],
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        FlatButton(
                          padding: EdgeInsets.symmetric(
                              horizontal: 35.0, vertical: 15.0),
                          color: appTheme.primaryColor,
                          onPressed: () {
                            currencyCalculateController.convertCurrency();
                          },
                          child: Text(
                            'Convert',
                            style:
                                TextStyle(color: Colors.white, fontSize: 18.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
