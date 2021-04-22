import 'package:flutter/material.dart';
import 'package:pakistancurrency/Common/Theme.dart';
import 'package:pakistancurrency/Common/Constants.dart';

import 'package:http/http.dart' as http;
import 'package:pakistancurrency/Controller/InfoTabWesternUnionController.dart';
import 'dart:convert' as convert;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:pakistancurrency/Components/AppBar.dart';
import 'package:pakistancurrency/Components/Heading.dart';
import 'package:pakistancurrency/Components/HomeScreen/BannerList.dart';
import 'package:get/get.dart';

class WesternUnion extends StatelessWidget {
  final unionController = Get.put(InfoTabWesternUnionController());
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        key: unionController.scaffoldKey,
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
                  points: unionController.isGuest.value ? false : true,
                  pointsValue: unionController.pointsValue.value,
                ))
              ];
            },
            body: ListView(
              padding: EdgeInsets.only(bottom: 20.0),
              children: <Widget>[
                Container(
                  child: Image.asset(
                    'Assets/images/western_union.jpg',
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
                        text: 'Western Union',
                        size: 24.0,
                        color: appTheme.accentColor,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        "Western Union's aim is to become a global leader in cross-currency movement across local and regional borders, continuously easing currency transfers among businesses and individuals anytime, every time. Our vision is being supported by a multi-channel network that compasses over 200 countries in a row and embarking on building a trustworthy relation with Agents, partners, and global compliance competencies. \n\nWe intend to ascend the number of ways users and businesses can move funds around the world, enabling money transfer and payment sending services easier and convenient. We move money for better, enabling individuals, families, and friends, and loved ones to reliably and seamlessly transfer money in ways that are easy for them; find any Pakistan Currency Exchange’s store located nearby and send or receive as per your convenience. We have done collaboration in order to increase the number of our loyal users. We have an increasing number of social media platforms for consumers to be facilitated, especially in finding the nearest PCE point from their own location. Western Union is known for its ability to send or receive cash across the world in minutes, so you don’t need to wait for days and hours to get your money transferred anywhere in the world. WesternUnion is a hassle-free process where you will not have to wait in a queue to have your turn. We aim to offer a relaxing way to proceed with your transaction/s. \n\nWestern Union has won the trust of millions of global routers by serving them safe access to send and receive money, hence allowing us to contribute to increasing the International Remittance business in the country. As Western Unions’ main and biggest agent in Pakistan, you can trust us as safe custodians of your money, ensuring that it reaches your loved ones exactly as you send. Whenever you're transferring money to anyone, make sure you are choosing the most reliable channel, and there’s no better than Western Union, which is playing the significant role in transferring money while maintaining its reputation as it is one of the most trusted money transfer companies in the money- movement industry. Also, it accords the surety to keep their users away from any kind of fraudulent activity. There are some obligations to warn our customers of such deception. It's important to check around with multiple providers and platforms, comparing rates, and fees to get the right option to meet your needs. Coming to the most sensitive issues which exist and that makes almost every other person uncomfortable, or dealing with, is the secure money transfer mode. With so many fishes in the pond right now, few are counted as trusted ones. Well, Western Union is one such service that assures you for a secure, stable and shielded remittance in Pakistan. No matter if you are availing cash pickup or a bank transfer service or availing any other transfer service, everything is just a few clicks and minutes away. Western Union is called the protected and easy access process of transferring money abroad or receiving it from anywhere in the world. We keep the transparency between the consumer and the system when it comes to the trusting phase. Our technology protects your money and guarantees that it will arrive safely on time every time and to the right recipient, thanks to its secured infrastructure and the highest possible standards. Ergo, affiliation with Western Union is here to convey everything that you envision with any best money transfer service. \n\nWestern Union has grown to become one of the largest and most prominent names when it comes to money transfers. It has been operating for over 150 years. Pakistan Currency Exchange is proud to acknowledge that we are Western Unions’ main and biggest agent in Pakistan along with our 133 above branches located nationwide. \n\nWestern Union has won the trust of millions of people by enabling them safe access to send and receive money, hence allowing us to contribute to increasing the International Remittance business in the country. As Western Unions’ main and biggest agent in Pakistan, you can trust us as safecustodians of your money, ensuring that it reaches your loved ones in a quick manner \n\nWhenever you're transferring money to anyone only Western Union plays the significant roles when it comes to reliability, it actually maintains its reputation as it is one of the most trusted money transfer companies in the Industry. Also it accords the surety to keep their users away from any kind of fraudulent activities , There are some obligations to warn our customers for such sort of deception. Its important to check around with multiple providers and platforms, comparing rates, and fees to get the right option to meet your needs. \n\nComing to the most sensitive issues which exudes and that makes almost every other person confront, or deal with, that is the secure transfer mode. With so many resources in the industry right now, few can be counted as trusted ones Well, Money Gram is one such service that assures you for a secure, stabled and shielded remittance in Country. No matter you are availing cash pickup or a bank transfer service or availing any other valuable service everything is just a few clicks and minutes away. \n\nWestern Union is being called the protected and easy access process of transferring money to abroad or receiving it from any where in the world. We keep the transparency between the consumer and the system when it comes to the trusting phase, Our technology protects your money and guarantees it arrives safely on time every time and fulfils the need of the time. So It only produce the highest possible standards all time .Ergo, Affiliation with Money Gram is here to convey everything that you envision with any best money transfer service",
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

