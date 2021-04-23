import 'package:flutter/material.dart';
import 'package:pakistancurrency/Common/Constants.dart';
import 'package:pakistancurrency/Common/Theme.dart';

import 'package:http/http.dart' as http;
import 'package:pakistancurrency/Controller/TransactionHistoryController.dart';
import 'dart:convert' as convert;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:pakistancurrency/Components/Heading.dart';
import 'package:pakistancurrency/Components/AppBar.dart';
import 'package:pakistancurrency/Components/GuestUserWarning.dart';
import 'package:get/get.dart';

class TransactionHistory extends StatelessWidget {
  final transactionController = Get.put(TransactionHistoryController());
  @override
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        resizeToAvoidBottomPadding: true,
        body: SafeArea(
          bottom: false,
          child: transactionController.isGuest.value
              ? GuestUserWarning()
              : NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
              Obx(() =>   appBar(
                flatButton: false,
                menu: false,
                tabs: false,
                logo: true,
                points: transactionController.isGuest.value ? false : true,
                pointsValue: transactionController.pointsValue.value,))
              ];
            },
            body: FutureBuilder<List>(
              future: transactionController.userData,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return ListView(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    children: <Widget>[
                      SizedBox(
                        height:
                        MediaQuery.of(context).size.height / 1.17,
                        child: ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.only(
                                  bottom: 10.0, right: 20.0, left: 20.0),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 10.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    blurRadius: 15.0,
                                    offset: Offset(0,
                                        10), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Table(
                                children: <TableRow>[
                                  TableRow(children: <Widget>[
                                    Text(
                                      'Date / Time:',
                                      style: TextStyle(
                                          color: appTheme.primaryColor),
                                    ),
                                    Text(
                                      DateTime.parse(snapshot.data[index]
                                      ['CreatedOn'])
                                          .toString(),
                                    ),
                                  ]),
                                  TableRow(children: <Widget>[
                                    Text(
                                      'Transaction Type:',
                                      style: TextStyle(
                                          color: appTheme.primaryColor),
                                    ),
                                    Text(
                                      snapshot.data[index]
                                      ['TransactionType'],
                                    ),
                                  ]),
                                  TableRow(children: <Widget>[
                                    Text(
                                      'Voucher Type:',
                                      style: TextStyle(
                                          color: appTheme.primaryColor),
                                    ),
                                    Text(
                                      snapshot.data[index]['VoucherType'],
                                    ),
                                  ]),
                                  TableRow(children: <Widget>[
                                    Text(
                                      'Location:',
                                      style: TextStyle(
                                          color: appTheme.primaryColor),
                                    ),
                                    Text(
                                      snapshot.data[index]
                                      ['LocationsName'],
                                    ),
                                  ]),
                                  TableRow(children: <Widget>[
                                    Text(
                                      'Amount:',
                                      style: TextStyle(
                                          color: appTheme.primaryColor),
                                    ),
                                    Text(
                                      snapshot.data[index]
                                      ['TotalAmountInPKR']
                                          .toString(),
                                    ),
                                  ]),
                                  TableRow(children: <Widget>[
                                    Text(
                                      'Points:',
                                      style: TextStyle(
                                          color: appTheme.primaryColor),
                                    ),
                                    Text(
                                      snapshot.data[index]
                                      ['PointsAwarded']
                                          .toString(),
                                    ),
                                  ]),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                }
                return Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ),
      ),
    );
  }
}

