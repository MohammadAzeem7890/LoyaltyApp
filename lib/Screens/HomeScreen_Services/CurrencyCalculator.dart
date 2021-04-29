import 'package:flutter/material.dart';
import 'package:pakistancurrency/Common/Theme.dart';
import 'package:pakistancurrency/Common/Constants.dart';

import 'package:http/http.dart' as http;
import 'package:pakistancurrency/CurrecyConverterModel.dart';
import 'dart:convert' as convert;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:pakistancurrency/Components/AppBar.dart';
import 'package:pakistancurrency/Components/Heading.dart';
import 'package:pakistancurrency/Components/dropDownList.dart';
import 'package:pakistancurrency/Components/InputField.dart';

class CurrencyCalculator extends StatefulWidget {
  @override
  _CurrencyCalculatorState createState() => _CurrencyCalculatorState();
}

enum ConvertType { buy, sell }

class _CurrencyCalculatorState extends State<CurrencyCalculator> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool isLoading = false;
  List<String> currencyList;
  List<int> idList;
  String fromSelected;
  int fromSelectedIndex;
  String toSelected;
  int toSelectedIndex;
  ConvertType _convertType = ConvertType.buy;
  List<dynamic> currencyData;
  Future<bool> gotData;
  String amount;
  String convertedValue;
  bool isGuest;
  String pointsValue;
  List currencyNameList = [];
  CurrencyModel currencyModel;

  @override
  void initState() {
    super.initState();
    currencyList = [];
    idList = [];
    isGuest = false;
    pointsValue = '';
    getUserData();
    gotData = getCurrencyData();
    // getCurrecyDatabyGoogle();
  }

  void getUserData() async {
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

  // Future getCurrecyDatabyGoogle() async {
  //   var response;
  //   try {
  //     response =
  //         await http.get('https://api.exchangerate-api.com/v4/latest/USD');
  //   } catch (e) {
  //     setState(() {
  //       isLoading = false;
  //     });
  //     final snackBar = SnackBar(content: Text('Network Error'));
  //     _scaffoldKey.currentState.showSnackBar(snackBar);
  //   }
  //   if (response.statusCode == 200) {
  //     setState(() {
  //       isLoading = false;
  //     });
  //     // print('This is api response by google');
  //     // print(response.body);
  //     currencyModel = CurrencyModel.fromJson(convert.jsonDecode(response.body));
  //     // print(currencyModel.rates);
  //     // print(currencyModel.rates.values);
  //     // CurrencyExchangeRate currencyExchangeRate = CurrencyExchangeRate();
  //     // for(int i = 0; i < currencyModel.rates.keys.length; i++){
  //     //   print(currencyModel.rates.values);
  //     //   // currencyExchangeRate.rateList.add(Rate());
  //     // }
  //     // print()
  //     // for(int i = 0; i < currencyModel.rates.length; i++){
  //     //   print(currencyModel.rates[i]);
  //     // }
  //   } else {
  //     final snackBar = SnackBar(content: Text('Currency Fetching Failed'));
  //     _scaffoldKey.currentState.showSnackBar(snackBar);
  //   }
  // }

  // updateCurrencyValues() {
  //   currencyData.forEach((element) {
  //     print('inside for each loop');
  //     print(element);
  //     // print(element['buying_rate']);
  //     print(currencyModel.rates['USD']);
  //     print(currencyModel.rates['AUD']);
  //     print(currencyModel.rates['AED']);
  //     print(currencyModel.rates['GBP']);
  //     if (element['symbol'] == 'USD') {
  //       print('inside usd');
  //       element['buying_rate'] = currencyModel.rates['USD'];
  //       element['selling_rate'] = currencyModel.rates['USD'] + 0.50;
  //     }
  //     if (element['symbol'] == 'AUD') {
  //       element['buying_rate'] = currencyModel.rates['AUD'];
  //       element['selling_rate'] = currencyModel.rates['AUD'] + 0.50;
  //     }
  //     if (element['symbol'] == 'AED') {
  //       element['buying_rate'] = currencyModel.rates['AED'];
  //       element['selling_rate'] = currencyModel.rates['AED'] + 0.50;
  //     }
  //     if (element['symbol'] == 'GBP') {
  //       element['buying_rate'] = currencyModel.rates['GBP'];
  //       element['selling_rate'] = currencyModel.rates['GBP'] + 0.50;
  //     }
  //     if (element['symbol'] == 'SAR') {
  //       element['buying_rate'] = currencyModel.rates['SAR'];
  //       element['selling_rate'] = currencyModel.rates['SAR'] + 0.50;
  //     }
  //     if (element['symbol'] == 'EUR') {
  //       element['buying_rate'] = currencyModel.rates['EUR'];
  //       element['selling_rate'] = currencyModel.rates['EUR'] + 0.50;
  //     }
  //     if (element['symbol'] == 'CAD') {
  //       element['buying_rate'] = currencyModel.rates['CAD'];
  //       element['selling_rate'] = currencyModel.rates['CAD'] + 0.50;
  //     }
  //     if (element['symbol'] == 'SGD') {
  //       element['buying_rate'] = currencyModel.rates['SGD'];
  //       element['selling_rate'] = currencyModel.rates['SGD'] + 0.50;
  //     }
  //     if (element['symbol'] == 'ZAR') {
  //       element['buying_rate'] = currencyModel.rates['ZAR'];
  //       element['selling_rate'] = currencyModel.rates['ZAR'] + 0.50;
  //     }
  //   });
  // }

  Future<bool> getCurrencyData() async {
    var url = 'http://pak.hashlob.com/api/getCurrencies';
    var response;
    try {
      response = await http.get(
        url,
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
      if (convert.jsonDecode(response.body)['success']) {
        List responseData = convert.jsonDecode(response.body)['data'];
        // updateCurrencyValues();
        setState(() {
          for (var i = 0; i < responseData.length; i++) {
            currencyData = responseData;
            currencyList.add(responseData[i]['name']);
            idList.add(responseData[i]['id']);
            // print('klasdjfl');
            // print(currencyData);
            // currencyData.forEach((element) {
            //     print(element['buying_rate']);print(element['selling_rate']);
            // });
            // print(idList);
            // print(responseData[i]['id']);
            // updateCurrencyValues();
            // print(currencyData);
          }
          // updateCurrencyValues();
          // print('*******************UPDATED VALUES*************************');
        });
        return true;
      } else {
        final snackBar = SnackBar(content: Text('Currency Fetching Failed'));
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

  void convertCurrency() async {
    var url = 'http://pak.hashlob.com/api/convert';
    var response;
    if (amount == '' ||
        amount == null ||
        fromSelected == '' ||
        fromSelected == null ||
        toSelected == '' ||
        toSelected == null) {
      final snackBar = SnackBar(content: Text('Complete the Form'));
      _scaffoldKey.currentState.showSnackBar(snackBar);
      return;
    }

    try {
      response = await http.post(url, body: {
        'type': _convertType == ConvertType.buy ? 'buy' : 'sell',
        'amount': amount.toString(),
        'currency_from': idList.elementAt(fromSelectedIndex).toString(),
        'currency_to': idList.elementAt(toSelectedIndex).toString()
      }, headers: {
        'Content-Type': 'application/x-www-form-urlencoded'
      });
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
      if (convert.jsonDecode(response.body)['success']) {
        setState(() {
          convertedValue = convert.jsonDecode(response.body)['data'];
        });
      } else {
        final snackBar = SnackBar(content: Text('Currency Fetching Failed'));

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
      child: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Scaffold(
          key: _scaffoldKey,
          body: SafeArea(
            child: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  appBar(
                      flatButton: false,
                      menu: false,
                      tabs: false,
                      logo: true,
                      points: isGuest ? false : true,
                      pointsValue: pointsValue)
                ];
              },
              body: FutureBuilder(
                  future: gotData,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      return ListView(
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
                                  offset: Offset(
                                      0, 10), // changes position of shadow
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
                                        leading: Radio(
                                          activeColor: appTheme.primaryColor,
                                          value: ConvertType.buy,
                                          groupValue: _convertType,
                                          onChanged: (ConvertType value) {
                                            setState(() {
                                              _convertType = value;
                                            });
                                          },
                                        ),
                                      ),
                                      ListTile(
                                        contentPadding: EdgeInsets.all(0.0),
                                        title: const Text('Sell'),
                                        leading: Radio(
                                          activeColor: appTheme.primaryColor,
                                          value: ConvertType.sell,
                                          groupValue: _convertType,
                                          onChanged: (ConvertType value) {
                                            setState(() {
                                              _convertType = value;
                                            });
                                          },
                                        ),
                                      ),
                                    ]),
                                    TableRow(children: <Widget>[
                                      Text(
                                        'From',
                                        style: TextStyle(
                                            fontSize: 18.0,
                                            color: appTheme.primaryColor),
                                      ),
                                      LimitedBox(
                                        maxWidth: 90.0,
                                        child: dropDownList(
                                          hint: 'Select',
                                          dropdownValue: fromSelected,
                                          noUnderline: true,
                                          removeTopSpace: true,
                                          items: currencyList,
                                          onChange: (String newValue) {
                                            setState(() {
                                              fromSelected = newValue;
                                              fromSelectedIndex = currencyList
                                                  .indexOf(newValue);
                                            });
                                          },
                                        ),
                                      ),
                                    ]),
                                    TableRow(children: <Widget>[
                                      Text(
                                        'To',
                                        style: TextStyle(
                                            fontSize: 18.0,
                                            color: appTheme.primaryColor),
                                      ),
                                      LimitedBox(
                                        maxWidth: 90.0,
                                        child: dropDownList(
                                          hint: 'Select',
                                          dropdownValue: toSelected,
                                          noUnderline: true,
                                          removeTopSpace: true,
                                          items: currencyList,
                                          onChange: (String newValue) {
                                            setState(() {
                                              toSelected = newValue;
                                              toSelectedIndex = currencyList
                                                  .indexOf(newValue);
                                            });
                                          },
                                        ),
                                      ),
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
                                            setState(() {
                                              amount = text;
                                            });
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
                                            border:
                                                Border.all(color: Colors.grey)),
                                        child: Text(
                                          convertedValue ?? 'Rate...',
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
                                    convertCurrency();
                                  },
                                  child: Text(
                                    'Convert',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18.0),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    }
                    return Center(child: CircularProgressIndicator());
                  }),
            ),
          ),
        ),
      ),
    );
  }
}
