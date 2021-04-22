import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:pakistancurrency/Components/HomeScreen/ServicesSection.dart';
import 'package:pakistancurrency/Components/HomeScreen/BannerList.dart';
import 'package:pakistancurrency/Components/HomeScreen/Partners.dart';
import 'package:pakistancurrency/Components/News/CurrencyList.dart';
import 'package:get/get.dart';
import 'package:pakistancurrency/Controller/HomeTabController.dart';

class HomeTab extends StatelessWidget {
  Function onTap;
  HomeTab({this.onTap});

  @override
  final homeTabController = Get.put(HomeTabController());
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Theme(
          data: ThemeData(
            primaryColor: Colors.grey.shade500,
          ),
          child: LimitedBox(
            maxHeight: 250.0,
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
        Obx(() =>
            CurrencyList(currencyList: homeTabController.currencyData.value)),
        SizedBox(
          height: 20.0,
        ),
        ServicesSection(
          onTap: () {
            onTap();
          },
        ),
        SizedBox(
          height: 20.0,
        ),
        BannerList(banners: homeTabController.banners),
        SizedBox(
          height: 20.0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Partners(),
        ),
        SizedBox(
          height: 20.0,
        ),
      ],
    );
  }
}
