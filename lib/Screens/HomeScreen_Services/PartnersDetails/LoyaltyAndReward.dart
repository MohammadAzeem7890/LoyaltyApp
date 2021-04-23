import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pakistancurrency/Screens/HomeScreenTabs/LoyaltyTab.dart';

import '../../../Components/AppBar.dart';
import '../../../Controller/LoyaltyController.dart';
import '../../../Controller/LoyaltyController.dart';
import '../../../Controller/LoyaltyController.dart';
import '../../HomeScreenTabs/LoyaltyTab.dart';

class LoyaltyAndReward extends StatelessWidget {
  final loyaltyController = Get.put(LoyaltyController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          Align(
            child: Container(
              width: 160.0,
              height: 50,
              // margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  bottomLeft: Radius.circular(50),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 15.0,
                    offset: Offset(0, 10), // changes position of shadow
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CircleAvatar(
                    radius: 20.0,
                    backgroundColor: Colors.yellow.shade700,
                    child: Icon(
                      Icons.star,
                      size: 20.0,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    loyaltyController.points.value == '' ? 'Points Balance' : loyaltyController.points.value,
                    style: TextStyle(
                        color: Theme.of(context).accentColor,
                        // fontSize: 15.0,
                        fontWeight: FontWeight.w500), overflow: TextOverflow.ellipsis, maxLines: 2,
                  ),
                //   Text(
                //     'Point Balance',
                //     style: TextStyle(color: Colors.grey, fontSize: 12.0), overflow: TextOverflow.ellipsis, maxLines: 2,
                //   ),
                ],
              ),
            ),
          )
        ],
        backgroundColor: Colors.transparent,
        title: Image.asset(
          'Assets/images/Homepage Logo.png',
          height: 30.0,
        ),
        // centerTitle: true,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: LoyaltyTab(),
    );
  }
}
