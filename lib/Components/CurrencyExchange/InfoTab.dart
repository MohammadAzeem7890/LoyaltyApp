import 'package:flutter/material.dart';
import 'package:pakistancurrency/Common/Theme.dart';

import 'package:pakistancurrency/Components/Heading.dart';


class InfoTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Heading(
            text: 'Currency Exchange',
            size: 24.0,
            color: appTheme.accentColor,
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            "Pakistan Currency Exchange (Pvt) dates back to 1992, but the idea of having a physical platform was rooted on June 20, 2003, following the company’s ordinance 1984, just after the Exchange Companies Reforms passed. All the services we offer under the name of PCE are well-worded with the State Bank of Pakistan. \n\nBe it safety and security or reliability of all sorts of money transfers including remittance, PCE leaves no- stone unturned in providing utmost satisfaction across all the phases of customer engagement. \n\nWe totally understand that sending and receiving money is more of an emotional exchange between loved ones than just transferring bucks; that is why we call your convenience, our asset. Here at PCE, you don't need to wait for hours in queues with tension on your face, rather you will feel relaxed and satisfied; you can thanks to our minimalistic requirements later. \n\nPCE expansionary strategy has reached 130 locations, improving our brand visibility, exceeding consumer feasibilities, and helping us to build a successful brand image.",
            style: TextStyle(color: Colors.grey.shade700),
          ),
          SizedBox(
            height: 30.0,
          ),
          Heading(
            text: 'Mission & Vision',
            size: 24.0,
            color: appTheme.primaryColor,
            weight: FontWeight.w300,
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            "We pledge to provide effortless procedures and authentic services with the touch of accuracy, security, reliability, loyalty, and most importantly, convenience to our customers. \n\nWe also aim to follow all the industry standards and expected thresholds of money exchange and transfers while offering services at your earliest and leveraging our financial expertise as speedy as possible. \n\nPCE wows to remit money in a manner that is reliable, secure, and convenient. Our team will continue hitting the highest scores in transparency and dedication while converging with known remittance providers.",
            style: TextStyle(color: Colors.grey.shade600),
          ),
          SizedBox(
            height: 20.0,
          ),
        ],
      ),
    );
  }
}
