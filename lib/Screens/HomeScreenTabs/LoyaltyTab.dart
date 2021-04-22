import 'package:flutter/material.dart';
import 'package:pakistancurrency/Common/Constants.dart';
import 'package:pakistancurrency/Common/Theme.dart';

import 'package:http/http.dart' as http;
import 'package:pakistancurrency/Controller/LoyaltyController.dart';
import 'dart:convert' as convert;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

import 'package:pakistancurrency/Components/dropDownList.dart';
import 'package:pakistancurrency/Components/GuestUserWarning.dart';

class LoyaltyTab extends StatelessWidget {
  final loyaltyController = Get.put(LoyaltyController());
  @override
  Widget build(BuildContext context) {
    return GetX<LoyaltyController>(
          builder: (snapshot) {
            return ListView(
              padding: EdgeInsets.only(bottom: 20.0),
              children: <Widget>[
                SizedBox(height: 20.0),
                Align(
                  child: Container(
                    width: 250.0,
                    margin: EdgeInsets.symmetric(horizontal: 20.0),
                    padding:
                    EdgeInsets.symmetric(horizontal: 0.0, vertical: 10.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 15.0,
                          offset: Offset(0, 10), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        CircleAvatar(
                          radius: 20.0,
                          backgroundColor: Colors.yellow.shade700,
                          child: Icon(
                            Icons.star,
                            size: 30.0,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          loyaltyController.points.value ?? '',
                          style: TextStyle(
                              color: appTheme.accentColor,
                              fontSize: 32.0,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          'Points',
                          style: TextStyle(color: Colors.grey, fontSize: 28.0),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                RawMaterialButton(
                  onPressed: (){
                    Navigator.pushNamed(context, '/pointsScreen');
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 50.0),
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    decoration: BoxDecoration(
                      // color: Color(0xFF000000).withOpacity(0.6),
                      color:    const Color(0xFF04a358).withOpacity(0.8),
                      // color: Colors.green,
                      borderRadius: BorderRadius.circular(15.0),
                      // gradient: LinearGradient(
                      //   begin: Alignment.centerLeft,
                      //   end: Alignment.centerRight,
                      //   // colors: [
                      //   //   const Color(0xFF000000),
                      //   //   const Color(0xFF000000).withOpacity(0.7)
                      //   // ], // whitish to gray
                      //   // tileMode: TileMode.clamp,
                      // ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircleAvatar(
                            radius: 30.0,
                            backgroundColor: Colors.yellow.shade700,
                            child: Text(
                              'VIP',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22.0),
                            )),
                        SizedBox(
                          width: 30.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Become a',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.w300),
                            ),
                            Text(
                              'Gold Member',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: <Widget>[
                                Text(
                                  'Now',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.w300),
                                ),
                                SizedBox(width: 10.0),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                  size: 14.0,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Rewards',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18.0),
                          ),
                          Text(
                            'Food',
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ],
                      ),
                      LimitedBox(
                        maxWidth: 90.0,
                        child: dropDownList(
                          hint: 'filter',
                          dropdownValue: snapshot.filterSelected.value ?? '',
                          noUnderline: true,
                          removeTopSpace: true,
                          items: snapshot.filterList,
                          onChange: (String newValue) {
                            snapshot.filterSelected.value = newValue;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                LimitedBox(
                  maxHeight: 210.0,
                  child: ListView.builder(
                      padding: EdgeInsets.only(bottom: 15.0),
                      itemCount: 3,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          width: 200,
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                          child: RawMaterialButton(
                            onPressed: () {},
                            elevation: 1,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            fillColor: Colors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Image.asset(
                                    'Assets/images/burger_product.jpeg',
                                    height: 100.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15.0, vertical: 10.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Free Burger at Oh My Grill',
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Row(
                                        children: <Widget>[
                                          CircleAvatar(
                                            radius: 10.0,
                                            backgroundColor:
                                            Colors.yellow.shade700,
                                            child: Icon(
                                              Icons.star,
                                              size: 15.0,
                                              color: Colors.white,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5.0,
                                          ),
                                          Text(
                                            '500 Points',
                                            style: TextStyle(
                                                color: appTheme.accentColor,
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
                SizedBox(height: 20.0),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30.0),
                  padding: EdgeInsets.symmetric(vertical: 15.0),
                  decoration: BoxDecoration(
                    color:    const Color(0xFF04a358).withOpacity(0.8),
                    borderRadius: BorderRadius.circular(15.0),
                    // gradient: LinearGradient(
                    //   begin: Alignment.centerLeft,
                    //   end: Alignment.centerRight,
                    //   // colors: [
                    //   //   const Color(0xFF04a358),
                    //   //   const Color(0xFF1485ac)
                    //   // ], // whitish to gray
                    //   // tileMode: TileMode.clamp,
                    // ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            'PCE ',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 22.0),
                          ),
                          Text(
                            'Loyalty',
                            style: TextStyle(color: Colors.white, fontSize: 22.0),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 30.0,
                      ),
                      OutlineButton(
                        // color: Colors.white,
                        onPressed: () {},
                        child: Text(
                          'Join Now',
                          style: TextStyle(color: Colors.white),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0)),
                        borderSide: BorderSide(color: Colors.white54),
                        highlightedBorderColor: Colors.white,
                      )
                    ],
                  ),
                ),
              ],
            );
          }
      );
  }
}
