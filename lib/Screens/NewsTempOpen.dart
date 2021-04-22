import 'package:flutter/material.dart';
import 'package:pakistancurrency/Common/Theme.dart';

import 'package:pakistancurrency/Components/AppBar.dart';

class NewsTempOpen extends StatelessWidget {
  Widget build(BuildContext context) {
    final Map args = ModalRoute.of(context).settings.arguments as Map;
    return Container(
      child: Scaffold(
        body: SafeArea(
          child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                appBar(
                  flatButton: false,
                  menu: false,
                  tabs: false,
                )
              ];
            },
            body: ListView(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              children: <Widget>[
                Text(
                  args['title']
                      .replaceAll('<p>', '')
                      .replaceAll('</p>', '')
                      .replaceAll('[&hellip;]', '')
                      .replaceAll('&#8211', '')
                      .replaceAll('&#8217', ''),
                  style: TextStyle(color: appTheme.accentColor, fontSize: 22.0),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(args['text']
                    .replaceAll('<p>', '')
                    .replaceAll('</p>', '')
                    .replaceAll('[&hellip;]', '')
                    .replaceAll('&#8211', '')
                    .replaceAll('&#8217', '')
                    .replaceAll('<ul>', '')
                    .replaceAll('<li>', '')
                    .replaceAll('</li>', '')
                    .replaceAll('</ul>', '')
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
