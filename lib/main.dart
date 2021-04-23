import 'package:flutter/material.dart';
import 'package:pakistancurrency/Common/Theme.dart';
import 'package:pakistancurrency/Screens/HomeScreen_Services/TelegraphicDemandDraft.dart';
import 'package:pakistancurrency/Screens/Login_screen.dart';
import 'package:pakistancurrency/Screens/Home_screen.dart';
import 'package:pakistancurrency/Screens/Profile_screen.dart';
import 'package:pakistancurrency/Screens/TransactionHistory.dart';
import 'package:pakistancurrency/Screens/NewsTemp.dart';
import 'package:pakistancurrency/Screens/NewsTempOpen.dart';
import 'package:pakistancurrency/Screens/HomeScreen_Services/PartnersDetails/WesternUnion.dart';
import 'package:pakistancurrency/Screens/HomeScreen_Services/PartnersDetails/Ria.dart';
import 'package:pakistancurrency/Screens/HomeScreen_Services/PartnersDetails/MoneyGram.dart';
import 'package:pakistancurrency/Screens/HomeScreen_Services/CurrencyExchange.dart';
import 'package:pakistancurrency/Screens/HomeScreen_Services/CurrencyCalculator.dart';
import 'package:pakistancurrency/Screens/HomeScreen_Services/MoneyTransfer.dart';
import 'package:pakistancurrency/Screens/PointsScreen.dart';
import 'package:get/get.dart';

import 'Screens/HomeScreen_Services/PartnersDetails/LoyaltyAndReward.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pakistan Currency',
      theme: appTheme,
      initialRoute: '/homeScreen',
      routes: {
        '/login': (context) => Login(),
        '/homeScreen': (context) => HomeScreen(),
        '/news': (context) => NewsTemp(),
        '/newsOpen': (context) => NewsTempOpen(),
        '/profile': (context) => Profile(),
        '/transactionHistory': (context) => TransactionHistory(),
        '/telegraphic': (context) => TelegraphicDemandDraft(),
        '/moneyTransfer': (context) => MoneyTransfer(),
        '/westernUnion': (context) => WesternUnion(),
        '/ria': (context) => Ria(),
        '/moneyGram': (context) => MoneyGram(),
        '/currencyExchange': (context) => CurrencyExchange(),
        '/currencyCalculator': (context) => CurrencyCalculator(),
        '/pointsScreen': (context) => PointsScreen(),
        '/loyaltyScreen': (context) => LoyaltyAndReward(),
      },
    );
  }
}
