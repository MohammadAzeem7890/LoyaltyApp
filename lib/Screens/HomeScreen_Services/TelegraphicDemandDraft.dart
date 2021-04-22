import 'package:flutter/material.dart';
import 'package:pakistancurrency/Common/Theme.dart';
import 'package:pakistancurrency/Common/Constants.dart';
import 'package:get/get.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:http/http.dart' as http;
import 'package:pakistancurrency/Controller/TelegraphicDemandDraftController.dart';
import 'dart:convert' as convert;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:pakistancurrency/Components/AppBar.dart';
import 'package:pakistancurrency/Components/Heading.dart';

class TelegraphicDemandDraft extends StatelessWidget {
  final telegraphicController = Get.put(TelegraphicDemandDraftController());
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        key: telegraphicController.scaffoldKey,
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
                 points: telegraphicController.isGuest.value ? false : true,
                 pointsValue: telegraphicController.pointsValue.value,
               ))
              ];
            },
            body: ListView(
              padding: EdgeInsets.only(bottom: 20.0),
              children: <Widget>[
                Theme(
                  data: ThemeData(
                    primaryColor: Colors.grey.shade500,
                  ),
                  child: LimitedBox(
                    maxHeight: 200.0,
                    child: Swiper(
                      itemBuilder: (BuildContext context, int index) {
                        return Image.asset(
                          'Assets/images/Main BG.png',
                          fit: BoxFit.fill,
                        );
                      },
                      itemCount: 3,
                      pagination: SwiperPagination(),
                      control: SwiperControl(),
                    ),
                  ),
                ),
                SizedBox(height: 20.0,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Heading(
                        text: 'Telegraphic Transfer',
                        size: 24.0,
                        color: appTheme.accentColor,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        'Our telegraphic service will allow you to transfer funds up to 49,999USD - this has been approved by the State Bank of Pakistan. We PCE has made the fund transfer process simpler while curating a way towards ease and convenience for all our beloved customers; all our processes are backed up by secure methods. It means you can trust us and depend on us for transferring your amount to the beneficiary’s account. The security and safety of our services can be cross-checked from our abundance of branches located across Pakistan that are assisting the global movement of the most sensitive and valuable asset of Pakistanis and foreigners. Our extensive network is always there to facilitate you with the best, every time you want to transfer money worldwide.',
                        style: TextStyle(color: Colors.grey.shade700),
                      ),
                      SizedBox(
                        height: 50.0,
                      ),
                      Heading(
                        text: 'Demand Draft',
                        size: 24.0,
                        color: appTheme.accentColor,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        'Pakistan currency exchange is the easiest way, why? Because we ensure that all your educational requirements are met in any currency you want and to almost any country. To get the job done, the bank issues a demand draft to a client, directing another bank to pay a certain sum to the beneficiary’s account... sounds confusing? Leave this confusion on us, we are here to take care of your bright future. \nBringing you the fastest way to accomplish your money transfers and fees payments, PCE knows how to send money or submit fees globally without any unwanted delays. Our Demand Draft Services offer a significant method to send money abroad and provide a quality solution to the difficulty faced by students when it comes to paying the foreign university fees. It is known to be the most secure and safe medium, offering a convenient process through which your child won’t face any obstacle in achieving his/her goals.',
                        style: TextStyle(color: Colors.grey.shade700),
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

