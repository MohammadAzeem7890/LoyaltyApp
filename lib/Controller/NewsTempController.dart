import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pakistancurrency/Common/Constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NewsTempController extends GetxController{

  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  var newsData = List<dynamic>().obs;
  var currencyData = List().obs;
  var isLoading = false.obs;
  var pointsValue = ''.obs;
  var isGuest = false.obs;

  void getUserData() async {
    print('this is get user data');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String identityNoSaved = prefs.getString('identityNo');
    if (identityNoSaved == null) {
        isGuest.value = true;
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
        isLoading.value = false;
      final snackBar = SnackBar(content: Text('Network Error'));
      scaffoldKey.currentState.showSnackBar(snackBar);
    }

    if (response.statusCode == 200) {
        isLoading.value = false;
      if (convert.jsonDecode(response.body)['IsCustomerFound']) {
        var responseData = convert.jsonDecode(response.body)['CustomerDetail'];
          pointsValue.value = responseData['PointsBalance'].toString();
      } else {
        final snackBar =
        SnackBar(content: Text('Identity No or OTP incorrect'));

        scaffoldKey.currentState.showSnackBar(snackBar);
      }
    } else {
        isLoading.value = false;
      final snackBar = SnackBar(content: Text('Fatal Error'));
      scaffoldKey.currentState.showSnackBar(snackBar);
    }
  }

//   void getCurrencyData() async {
//     var url = 'http://pak.hashlob.com/api/getCurrencies';
//     var response;
//
//     try {
//       response = await http.get(
//         url,
//       );
//     } catch (e) {
//       setState(() {
//         isLoading = false;
//       });
//       final snackBar = SnackBar(content: Text('Network Error'));
//
//       _scaffoldKey.currentState.showSnackBar(snackBar);
//     }
//
//     if (response.statusCode == 200) {
//       setState(() {
//         isLoading = false;
//       });
//       if (convert.jsonDecode(response.body)['success']) {
//         List responseData = convert.jsonDecode(response.body)['data'];
// //        print(responseData);
//         setState(() {
//           currencyData = responseData;
//         });
//       } else {
//         final snackBar = SnackBar(content: Text('Currency Fetching Failed'));
//
//         _scaffoldKey.currentState.showSnackBar(snackBar);
//       }
//     } else {
//       setState(() {
//         isLoading = false;
//       });
//       final snackBar = SnackBar(content: Text('Fatal Error'));
//
//       _scaffoldKey.currentState.showSnackBar(snackBar);
//     }
//     return null;
//   }
   getNewsData() async {
    print('this is get news data');
    var url = 'https://pakistancurrency.com/blog/wp-json/wp/v2/posts';
    var response;
    try {
      response = await http.get(
        url,
      );
    } catch (e) {
        isLoading.value = false;
      final snackBar = SnackBar(content: Text('Network Error'));
      scaffoldKey.currentState.showSnackBar(snackBar);
    }

    if (response.statusCode == 200) {
        isLoading.value = false;
      var responseData = convert.jsonDecode(response.body);
     print(responseData);
     print('My name ');
//       return responseData;
      newsData.value = responseData;
      print(newsData.value);
    } else {
        isLoading.value = false;
      final snackBar = SnackBar(content: Text('Fatal Error'));
      scaffoldKey.currentState.showSnackBar(snackBar);
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getNewsData();
    getUserData();
  }
}