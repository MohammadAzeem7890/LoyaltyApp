import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:get/get.dart';
import 'package:pakistancurrency/Common/Constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class HomePageController extends GetxController{

  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  var selectedIndex = 0.obs;
  var isLoading = false.obs;
  var name = ''.obs;
  var identityNo = ''.obs;
  var pointsValue = ''.obs;
  var isGuest = false.obs;

  void getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String identityNoSaved = prefs.getString('identityNo');
    if(identityNoSaved == null){
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
          name.value = responseData['FullName'];
          identityNo.value = responseData['IdentityNo'];
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

  void onItemTapped(int index) {
      selectedIndex.value = index;
  }


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

  }
}