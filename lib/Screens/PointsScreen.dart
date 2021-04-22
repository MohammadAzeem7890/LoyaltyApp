import 'package:flutter/material.dart';

import 'package:pakistancurrency/Components/AppBar.dart';

class PointsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
              body: Center(
                child: Text('Points Screen'),
              )),
        ),
      ),
    );
  }
}

