import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pakistancurrency/Components/HomeScreen/ButtonRoundedIconWithLabel.dart';
import 'package:pakistancurrency/Components/Heading.dart';
import 'package:pakistancurrency/Screens/HomeScreenTabs/LoyaltyTab.dart';
import 'package:pakistancurrency/Screens/HomeScreen_Services/PartnersDetails/LoyaltyAndReward.dart';

class ServicesSection extends StatefulWidget {
  const ServicesSection({Key key, this.onTap}) : super(key: key);

  final Function onTap;

  @override
  _ServicesSectionState createState() => _ServicesSectionState();
}

class _ServicesSectionState extends State<ServicesSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Heading(
            text: 'Services',
            size: 18.0,
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: ButtonRoundedIconWithLabel(
                  onTap: () {
                    Navigator.pushNamed(context, '/moneyTransfer');
                  },
                  image: 'Money_Transfer_Icon.png',
                  text: 'Money Transfer',
                ),
              ),
              Expanded(
                child: ButtonRoundedIconWithLabel(
                  onTap: () {
                    Navigator.pushNamed(context, '/currencyCalculator');
                  },
                  image: 'Currency_Calculator_Icon.png',
                  text: 'Currency Calculator',
                ),
              ),
              Expanded(
                child: ButtonRoundedIconWithLabel(
                  onTap: () {
                    Navigator.pushNamed(context, '/telegraphic');
                  },
                  image: 'Currency_Exchange_Icon.png',
                  text: 'Telegraphic Transfer/Demand Draft',
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: ButtonRoundedIconWithLabel(
                  onTap: () {
                    Navigator.pushNamed(context, '/currencyExchange');
                  },
                  image: 'Currency_Exchange_Icon.png',
                  text: 'Currency Exchange',
                ),
              ),
              Expanded(
                child: ButtonRoundedIconWithLabel(
                  onTap: () {
                    widget.onTap(1);
                  },
                  image: 'Branch_Network.png',
                  text: 'Branch Network',
                ),
              ),
              Expanded(
                child: ButtonRoundedIconWithLabel(
                  onTap: () {
                    print('this is clicked');
                    Get.to(LoyaltyAndReward());
                  },
                  image: 'Loyalty_&_Reward_Icon.png',
                  text: 'Loyalty & Reward',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
