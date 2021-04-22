import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:pakistancurrency/Common/Constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum ConvertType { buy, sell }

class CurrencyCalculatorController extends GetxController{

  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  var isLoading = false.obs;
  var currencyList = List<String>().obs;
  var idList = List<int>().obs;
  var fromSelected = ''.obs;
  var fromSelectedIndex = 0.obs;
  var toSelected = ''.obs;
  var toSelectedIndex = 0.obs;
  Rx<ConvertType> convertType = ConvertType.buy.obs;
  var currencyData = List<dynamic>().obs;
  var gotData = List().obs;
  var amount = ''.obs;
  var convertedValue = ''.obs;
  var isGuest = false.obs;
  var pointsValue = ''.obs;

  chooseConverterMode(value){
    convertType.value = value;
    print('This is convertType ${convertType.value}');
    update();
  }

  chooseFromCurrency(String newValue){
    print('this is good');
    fromSelected.value = newValue;
    fromSelectedIndex.value = currencyList
        .indexOf(newValue);
    print('This is from selected value ${fromSelected.value}');
    update();
  }

  chooseToCurrency(String newValue){
    print('this is good');
    toSelected.value = newValue;
    toSelectedIndex.value = currencyList
        .indexOf(newValue);
    print('This is to selected value ${toSelected.value}');
    update();
  }

  setOnFocus(context){
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
    update();
  }

  // void getUserData() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String identityNoSaved = prefs.getString('identityNo');
  //   if (identityNoSaved == null) {
  //       isGuest.value = true;
  //     return;
  //   }
  //   var url = '$BASE_URL/GetCustomerDetail?IdentityNo=$identityNoSaved';
  //   var response;
  //
  //   try {
  //     response = await http.get(
  //       url,
  //       headers: {"AppToken": "D094BBF4-FAC5-4416-AD34-E2B2338D502B"},
  //     );
  //   } catch (e) {
  //       isLoading.value = false;
  //     final snackBar = SnackBar(content: Text('Network Error'));
  //     scaffoldKey.currentState.showSnackBar(snackBar);
  //   }
  //
  //   if (response.statusCode == 200) {
  //       isLoading.value = false;
  //     if (convert.jsonDecode(response.body)['IsCustomerFound']) {
  //       var responseData = convert.jsonDecode(response.body)['CustomerDetail'];
  //         pointsValue.value = responseData['PointsBalance'].toString();
  //     } else {
  //       final snackBar =
  //       SnackBar(content: Text('Identity No or OTP incorrect'));
  //       scaffoldKey.currentState.showSnackBar(snackBar);
  //     }
  //   } else {
  //       isLoading.value = false;
  //     final snackBar = SnackBar(content: Text('Fatal Error'));
  //     scaffoldKey.currentState.showSnackBar(snackBar);
  //   }
  // }

  // Future<bool> getCurrencyData() async {
  //   var url = 'http://pak.hashlob.com/api/getCurrencies';
  //   var response;
  //
  //   try {
  //     response = await http.get(
  //       url,
  //     );
  //   } catch (e) {
  //     setState(() {
  //       isLoading = false;
  //     });
  //     final snackBar = SnackBar(content: Text('Network Error'));
  //
  //     _scaffoldKey.currentState.showSnackBar(snackBar);
  //   }
  //
  //   if (response.statusCode == 200) {
  //     setState(() {
  //       isLoading = false;
  //     });
  //     if (convert.jsonDecode(response.body)['success']) {
  //       List responseData = convert.jsonDecode(response.body)['data'];
  //       setState(() {
  //         for (var i = 0; i < responseData.length; i++) {
  //           currencyData = responseData;
  //           currencyList.add(responseData[i]['name']);
  //           idList.add(responseData[i]['id']);
  //         }
  //       });
  //       return true;
  //     } else {
  //       final snackBar = SnackBar(content: Text('Currency Fetching Failed'));
  //
  //       _scaffoldKey.currentState.showSnackBar(snackBar);
  //     }
  //   } else {
  //     setState(() {
  //       isLoading = false;
  //     });
  //     final snackBar = SnackBar(content: Text('Fatal Error'));
  //
  //     _scaffoldKey.currentState.showSnackBar(snackBar);
  //   }
  //   return null;
  // }

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
      scaffoldKey.currentState.showSnackBar(snackBar);
      return;
    }

    try {
      response = await http.post(url, body: {
        'type': convertType == ConvertType.buy ? 'buy' : 'sell',
        'amount': amount.toString(),
        'currency_from': idList.elementAt(fromSelectedIndex.value).toString(),
        'currency_to': idList.elementAt(toSelectedIndex.value).toString()
      }, headers: {
        'Content-Type': 'application/x-www-form-urlencoded'
      });
    } catch (e) {
        isLoading.value = false;
      final snackBar = SnackBar(content: Text('Network Error'));
      scaffoldKey.currentState.showSnackBar(snackBar);
    }

    if (response.statusCode == 200) {
        isLoading.value = false;
      if (convert.jsonDecode(response.body)['success']) {
          // print(convert.jsonDecode(response.body)['data']);
          // print(amount);
          // print(fromSelectedIndex);
          // print(fromSelected);
          // print(toSelectedIndex);
          // print(toSelected);
          //
          // print('xyz');


          convertedValue = convert.jsonDecode(response.body)['data'];
          // gotData = convertedValue.value;
          print(gotData.value);
      } else {
        final snackBar = SnackBar(content: Text('Currency Fetching Failed'));
        scaffoldKey.currentState.showSnackBar(snackBar);
      }
    } else {
        isLoading.value = false;
      final snackBar = SnackBar(content: Text('Fatal Error'));
      scaffoldKey.currentState.showSnackBar(snackBar);
    }
    return null;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    convertCurrency();
  }

}