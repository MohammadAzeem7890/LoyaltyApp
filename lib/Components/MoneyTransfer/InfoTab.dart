import 'package:flutter/material.dart';

import 'package:pakistancurrency/Components/PartnerTile.dart';

class InfoTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'We are here to connect you wherever you want through our fastest services using our electronic means of transferring funds overseas, this trustworthy money Exchange Company has amalgamated with a mission to serve better and make fund transfers either for immigrations fee, personal expense, university fee, or traveling expenses more convenient with our experience and capabilities in any currency you want and in the most secure manner.',
            style: TextStyle(fontSize: 14.0),
          ),
          SizedBox(
            height: 20.0,
          ),
          PartnerTile(
            onPress: () {
              Navigator.pushNamed(context, '/westernUnion');
            },
            bgImage: 'westUnion.jpg',
            icon: 'westUicon.png',
            title: 'Western Union',
            description:
                'An easy way to Receive and send money to your loved ones online with the most reliable transfer company at your ease.',
          ),
          SizedBox(
            height: 10.0,
          ),
          PartnerTile(
            onPress: () {
              Navigator.pushNamed(context, '/moneyGram');
            },
            bgImage: 'moneyGram.jpg',
            icon: 'moneyGicon.png',
            title: 'Money Gram',
            description:
                'Save time by sending Money globally with well-known transfer company which is known for its reliability and instant fund transfers that understands your bond with your loved ones. ',
          ),
          SizedBox(
            height: 10.0,
          ),
          PartnerTile(
            onPress: () {
              Navigator.pushNamed(context, '/ria');
            },
            bgImage: 'riabg.jpg',
            icon: 'riaIcon.png',
            title: 'Ria',
            description:
                'Transfers money conveniently than you think, at any hour of need. RIA aims to provide the quick Fund receiving solution anywhere from the world round the clock!',
          ),
        ],
      ),
    );
  }
}
