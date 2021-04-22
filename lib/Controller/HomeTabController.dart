import 'package:get/get.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class HomeTabController extends GetxController{

  final List<String> banners = <String>[
    'BigBang Bg.png',
    'PCE Banner.png',
    'BigBang Bg.png'
  ];

  var currencyData = List<dynamic>().obs;
  var isLoading = false.obs;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // currencyData = [];
    getCurrencyData();
  }

  void getCurrencyData() async {
    var url = 'http://pak.hashlob.com/api/getCurrencies';
    var response;
    try {
      response = await http.get(
        url,
      );
    } catch (e) {
        isLoading.value = false;
    }
    if (response.statusCode == 200) {
        isLoading.value = false;
      if (convert.jsonDecode(response.body)['success']) {
        List responseData = convert.jsonDecode(response.body)['data'];
//        print(responseData);
          currencyData.value = responseData;
          // print(currencyData.value);
      } else {}
    } else {
        isLoading.value = false;
    }
    return null;
  }
}