import 'package:flutter/material.dart';
import 'package:pakistancurrency/Common/Theme.dart';
import 'package:pakistancurrency/Common/Constants.dart';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:pakistancurrency/Controller/HomeTabController.dart';
import 'package:pakistancurrency/Controller/NewsTempController.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:pakistancurrency/Components/AppBar.dart';
import 'package:pakistancurrency/Components/News/CurrencyList.dart';
import 'package:pakistancurrency/Components/Heading.dart';
import 'package:get/get.dart';

class NewsTemp extends StatelessWidget {
  final newsTempController = Get.put(NewsTempController());
  final homeTabController = Get.find<
      HomeTabController>(); // home tab controller to get currency values form there
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: SafeArea(
          bottom: false,
          child: GetX<NewsTempController>(builder: (snapshot) {
            return NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  appBar(
                    flatButton: false,
                    menu: false,
                    tabs: false,
                    logo: true,
                    points: snapshot.isGuest.value ? false : true,
                    pointsValue: snapshot.pointsValue.value ?? '',
                  )
                ];
              },
              body: Column(
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
                  CurrencyList(
                    currencyList: homeTabController.currencyData.value,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.newsData.value.length,
                      itemBuilder: (context, index) {
                        var news = snapshot.newsData[index];
                        return RawMaterialButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/newsOpen',
                                arguments: <String, String>{
                                  'title': news['title']['rendered'] ??
                                      ''.replaceAll('&#038;', ''),
                                  'text': news['content']['rendered'] ??
                                      ''
                                          .replaceAll('<p>', '')
                                          .replaceAll('</p>', '')
                                          .replaceAll('[&hellip;]', '')
                                          .replaceAll('</li>', '')
                                          .replaceAll('<li>', '')
                                          .replaceAll('<ul>', '')
                                          .replaceAll('</ul>', '')
                                          .replaceAll('&#8211', '')
                                          .replaceAll('&#8217', ''),
                                });
                          },
                          child: Container(
                            margin: EdgeInsets.only(
                                bottom: 10.0, right: 20.0, left: 20.0),
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 10.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15.0),
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  news['title']['rendered']
                                          .replaceAll('&#038;', '') ??
                                      '',
                                  style: TextStyle(color: appTheme.accentColor),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(news['excerpt']['rendered']
                                        .replaceAll('<p>', '')
                                        .replaceAll('</p>', '')
                                        .replaceAll('[&hellip;]', '')
                                        .replaceAll('&#8211', '')
                                        .replaceAll('&#8217', '') ??
                                    ''),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  // SizedBox(height: 15,),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
