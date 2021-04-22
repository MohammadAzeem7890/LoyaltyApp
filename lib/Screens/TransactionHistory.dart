import 'package:flutter/material.dart';
import 'package:pakistancurrency/Common/Constants.dart';
import 'package:pakistancurrency/Common/Theme.dart';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:pakistancurrency/Components/Heading.dart';
import 'package:pakistancurrency/Components/AppBar.dart';
import 'package:pakistancurrency/Components/GuestUserWarning.dart';

class TransactionHistory extends StatefulWidget {
  const TransactionHistory({Key key}) : super(key: key);

  @override
  _TransactionHistoryState createState() => _TransactionHistoryState();
}

class _TransactionHistoryState extends State<TransactionHistory> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool isLoading = false;
  Future<List> userData;
  String pointsValue;
  bool isGuest;

  @override
  void initState() {
    super.initState();
    isGuest = false;
    pointsValue = '';
    isGuest = false;
    getUserPoints();
    userData = getUserData();
  }

  void getUserPoints() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String identityNoSaved = prefs.getString('identityNo');
    if (identityNoSaved == null) {
      setState(() {
        isGuest = true;
      });
      return;
    }
    var url = '$BASE_URL/GetCustomerDetail?IdentityNo=$identityNoSaved';
    var response;

    try {
      response = await http.get(
        url,
        headers: {"AppToken": "D094BBF4-FAC5-4416-AD34-E2B2338D502B"},
      );
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      final snackBar = SnackBar(content: Text('Network Error'));

      _scaffoldKey.currentState.showSnackBar(snackBar);
    }

    if (response.statusCode == 200) {
      setState(() {
        isLoading = false;
      });
      if (convert.jsonDecode(response.body)['IsCustomerFound']) {
        var responseData = convert.jsonDecode(response.body)['CustomerDetail'];
        setState(() {
          pointsValue = responseData['PointsBalance'].toString();
        });
      } else {
        final snackBar =
        SnackBar(content: Text('Identity No or OTP incorrect'));

        _scaffoldKey.currentState.showSnackBar(snackBar);
      }
    } else {
      setState(() {
        isLoading = false;
      });
      final snackBar = SnackBar(content: Text('Fatal Error'));

      _scaffoldKey.currentState.showSnackBar(snackBar);
    }
  }

  Future<List> getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String identityNoSaved = prefs.getString('identityNo');
    if (identityNoSaved == null) {
      setState(() {
        isGuest = true;
      });
    }
    var url =
        '$BASE_URL/GetCustomerTransactionsDetail?IdentityNo=$identityNoSaved';
    var response;

    try {
      response = await http.get(
        url,
        headers: {"AppToken": "D094BBF4-FAC5-4416-AD34-E2B2338D502B"},
      );
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      final snackBar = SnackBar(content: Text('Network Error'));

      _scaffoldKey.currentState.showSnackBar(snackBar);
    }

    if (response.statusCode == 200) {
      setState(() {
        isLoading = false;
      });
      if (convert.jsonDecode(response.body)['IsRecordFound']) {
        var responseData = convert.jsonDecode(response.body)['Detail'];
//        print(responseData);
        return responseData;
        print(userData);
      } else {
        final snackBar =
            SnackBar(content: Text('Transaction History Fetching Failed'));

        _scaffoldKey.currentState.showSnackBar(snackBar);
      }
    } else {
      setState(() {
        isLoading = false;
      });
      final snackBar = SnackBar(content: Text('Fatal Error'));

      _scaffoldKey.currentState.showSnackBar(snackBar);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        resizeToAvoidBottomPadding: true,
        body: SafeArea(
          bottom: false,
          child: isGuest
              ? GuestUserWarning()
              : NestedScrollView(
                  headerSliverBuilder:
                      (BuildContext context, bool innerBoxIsScrolled) {
                    return <Widget>[
                      appBar(
                          flatButton: false,
                          menu: false,
                          tabs: false,
                        logo: true,
                        points: isGuest ? false : true,
                        pointsValue: pointsValue,)
                    ];
                  },
                  body: FutureBuilder<List>(
                    future: userData,
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
