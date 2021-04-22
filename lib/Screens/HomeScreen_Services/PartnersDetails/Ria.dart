import 'package:flutter/material.dart';
import 'package:pakistancurrency/Common/Theme.dart';
import 'package:pakistancurrency/Common/Constants.dart';

import 'package:http/http.dart' as http;
import 'package:pakistancurrency/Controller/InfoTabRiaController.dart';
import 'dart:convert' as convert;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:pakistancurrency/Components/AppBar.dart';
import 'package:pakistancurrency/Components/Heading.dart';
import 'package:pakistancurrency/Components/HomeScreen/BannerList.dart';
import 'package:get/get.dart';

class Ria extends StatelessWidget {
  final riaController = Get.put(InfoTabRiaController());
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        key: riaController.scaffoldKey,
        body: SafeArea(
          child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                Obx(() => appBar(
                  flatButton: false,
                  menu: false,
                  tabs: false,
                  logo: true,
                  points: riaController.isGuest.value ? false : true,
                  pointsValue: riaController.pointsValue.value,
                ))
              ];
            },
            body: ListView(
              padding: EdgeInsets.only(bottom: 20.0),
              children: <Widget>[
                Container(
                  child: Image.asset(
                    'Assets/images/Ria.jpg',
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
                        text: 'Ria',
                        size: 24.0,
                        color: appTheme.accentColor,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        "Ria enables the easiest money transfer, receiving through its reputed name across the globe because it knows money transfers are as meaningful as your relations with your dearest ones. It provides a one- stop digital payment solution to global individuals, featuring safe fund transferring with just a few taps in less time or at the sender/receivers’ earliest. Ria cares about your sensitive situation and occasions irrespective of religion, culture and/or traditions, Ria knows all occasions and ceremonies close to your heart - who else would understand your money-transferring needs better than RIA? Visit any Pakistan Currency’s branch nearby and transfer money for all your needs no matter where you are in the world; you will love the effortless solution and process provided by RIA. \n\nRia knows how strongly you share a love bond with your family and loved ones and how important they are for you to stay there at any time of the need. So we’ve made sure to make the process of sending money as easy and less complicated as possible. The Ria Money Transfer brings a secured service whom you can trust to help you get the most out of your money transfer experience, whether you’re new to sending money or have been relying on the service for years, Ria is there to serve. \n\nThe service is available 24 hours a day and 7 days a week. All transactions are done in real-time which means that the receiver can see the amount credited into their bank accounts within seconds without any hustle, all credit goes to increasing technology; no more queues outside currency exchange or waiting for a confirmation message or call from the ender. Our service isn’t just fast, it’s 100% reliable and safe too. Ria is a global leader in fund remittances and part of a Remittance industry for years that moves more than \$575 billion annually. Ria is thankful to nearly 250 million individuals who are international migrants in terms of searching and getting more in the future. Money receiving and sending via well-known Ria is one of the fastest and most popular ways for beneficiaries to collect remittances from their loved ones who live abroad. Presently, the majority of remittances are paid using cash, and Ria has expanded its global network in almost every part of the world to provide hundreds of thousands of payout points which means you will surely find Ria nearby, no matter in which part of the world you are physically located. To collect money, it is very simple - visit any of your nearby Ria branches, provide your PIN and show your valid ID issued by your country. \n\nRia Money Transfer is a global leader in the money transfer industry, furnishing its services at 385,000 locations across 160 countries. The company was founded in 1987in New York City and extended from a single stationed to one of the largest global money transfer companies. Ria is owned by Euronet Worldwide, Inc in the year 2007, a leader in processing secure, electronic financial transactions. The company has multiple hubs and regional offices around the world, with its Global Headquarters located in California, USA. Ria's network embraces banks, retailers, and SMEs, as well as some digital channels. With Ria we provide an authentic, safe, reliable and affordable way to send money home to their loved ones via cash pick up, which serves as the substitute to traditional banking services which requires a lot of physical and mental efforts to send and/or receive some bucks. On the other hand, Ria offers convenient ways to make it your money transfers simple and quick. \n\nMoney receiving and sending via well-known RIA is one of the fastest and most popular ways for beneficiaries to collect remittances from their loved ones who lives abroad. Presently, the majority of remittances are paid using cash, and Ria has expanded its global network in almost every part of the world to provide hundreds of thousands of payout points which means you can find nearest branch anywhere. To collect money, it is very simple to visit any of your nearby RIA Branch then provide your PIN and valid ID issued by Country. \n\nRia Money Transfer is a global leader in the money transfer industry, Furnishes their services at 385,000 locations across 160 countries. The company has been Founded in 1987in New York City and extended from a single be one of the largest money transfer companies globally. , Ria was owned by Euronet Worldwide, Inc in the year 2007.a leader in processing secure, electronic financial transactions. The company has multiple hubs and regional offices around the world, with its Global Headquarters located in California, USA. Ria's network embraces banks, retailers, and SMEs, as well as some of digital channels. \n\nWith RIA we provide an authentic, safe, reliable and affordable way for them to send money home to their loved ones via cash pick up, which serves as the substitute to traditional banking services which requires a lot of physical and mental effort Instead of this we want you to opt for the convenient ways to make it simple and quick.",
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

