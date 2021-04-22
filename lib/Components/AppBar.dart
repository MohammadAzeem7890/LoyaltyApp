import 'package:flutter/material.dart';
import 'package:pakistancurrency/Common/Theme.dart';

SliverAppBar appBar(
    {@required bool flatButton,
    String flatButtonText,
    Function flatButtonAction,
    @required bool menu,
    Function menuPressed,
    @required bool tabs,
    TabBar tabData,
    bool points = false,
    String pointsValue,
    bool logo = false,
    String title = ''}) {
  return SliverAppBar(
    floating: true,
    brightness: Brightness.light,
//    centerTitle: title.length > 0 ? true : false,
    centerTitle: points ? false : true,
    title: logo
        ? Image.asset(
            'Assets/images/Homepage Logo.png',
            height: 30.0,
          )
        : title.length > 0
            ? Text(
                title,
                style: TextStyle(color: Colors.black),
              )
            : null,
    backgroundColor: Colors.transparent,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.black),
    actions: <Widget>[
      points
          ? Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50.0),
                    bottomLeft: Radius.circular(50.0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 5.0,
                    offset: Offset(-2, 5), // changes position of shadow
                  ),
                ],
              ),
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Image.asset(
                    'Assets/images/Point Balance Bg.png',
                    height: 45.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Points Balance',
                          style: TextStyle(fontSize: 11.0, color: Colors.black),
                        ),
                        Text(
                          pointsValue,
                          style: TextStyle(
                              color: appTheme.accentColor,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          : SizedBox(),
      flatButton
          ? FlatButton(
              splashColor: Colors.transparent,
              onPressed: flatButtonAction,
              child: Text(
                flatButtonText ?? 'CLICK',
              ),
            )
          : SizedBox(),
    ],
    bottom: tabs ? tabData : null,
  );
}

//icon: AnimatedIcon(
//icon: AnimatedIcons.menu_close,
//progress: menuAnimate,
//color: Colors.black,
//semanticLabel: 'Show menu',
//),
