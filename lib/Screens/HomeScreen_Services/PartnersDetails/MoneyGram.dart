import 'package:flutter/material.dart';
import 'package:pakistancurrency/Common/Theme.dart';
import 'package:pakistancurrency/Common/Constants.dart';

import 'package:http/http.dart' as http;
import 'package:pakistancurrency/Controller/InfoTabMoneyGramController.dart';
import 'dart:convert' as convert;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:pakistancurrency/Components/AppBar.dart';
import 'package:pakistancurrency/Components/Heading.dart';
import 'package:pakistancurrency/Components/HomeScreen/BannerList.dart';
import 'package:get/get.dart';

class MoneyGram extends StatelessWidget {
  final moneyGramController = Get.put(InfoTabMoneyGramController());
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        key: moneyGramController.scaffoldKey,
        body: SafeArea(
          child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
               Obx(() =>  appBar(
                 flatButton: false,
                 menu: false,
                 tabs: false,
                 logo: true,
                 points: moneyGramController.isGuest.value ? false : true,
                 pointsValue: moneyGramController.pointsValue.value,
               ))
              ];
            },
            body: ListView(
              padding: EdgeInsets.only(bottom: 20.0),
              children: <Widget>[
                Container(
                  child: Image.asset(
                    'Assets/images/money_gram.jpg',
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Heading(
                        text: 'Money Gram',
                        size: 24.0,
                        color: appTheme.accentColor,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        "MoneyGram is a global provider of ingenious fund transfer and convenient payment services. Money gram always looks forward to providing the best services to connect friends and family anywhere in the world to fulfill the regular money-transferring needs. Our services have the aptitude to positively impact millions of lives which needs to send money worldwide or nationwide; loyal customers are the reason we are constantly innovating and focusing on how we can best meet their needs and serve them better. \n\nMoneyGram is devoted towards providing an industry-leading customer experience at every interaction which is built upon a foundation of trust, reliability, innovation, and ease. Tens of millions of consumers around the globe depend on MoneyGram to get money transferred quickly and in the most secure manner. Millions of dollars were invested by MoneyGram to be on top of making security and compliance at their first priority. It helps you with saving your loved ones time by sending Money globally with most trusted transfer company which exist for your ease, to meet your money sending needs in the most efficient manner. \n\nWe ensure to keep our customers satisfied with our trusted services, MoneyGram is well-known among retailers and businesses and they are behind its immense worldwide popularity. We are pledged to have and provide solutions to the fund transferring problems in a secured way using MoneyGram services. Its aim has always been to reduce the complexity and difficulty that people face now regarding money transfer whilst still maintaining the convenient, instant, quick, and reliable customer service. MoneyGram embraces a culture of compliance in our commitment to protect our customers or users who avail of our products and services. We want to ensure our services are not being used to process illegal transactions related to money laundering, fraud, scams, terrorist financing, OFAC and other watch lists, sanctions violations or any degree of illicit behavior.",
                        style: TextStyle(color: Colors.grey.shade700),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

