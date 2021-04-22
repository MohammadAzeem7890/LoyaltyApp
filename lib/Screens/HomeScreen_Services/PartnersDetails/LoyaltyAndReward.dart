import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pakistancurrency/Screens/HomeScreenTabs/LoyaltyTab.dart';

class LoyaltyAndReward extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
      ),
      body: LoyaltyTab(),
    );
  }
}
