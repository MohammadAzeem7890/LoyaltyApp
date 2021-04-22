import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pakistancurrency/Controller/HomeTabController.dart';

class CurrencyList extends StatelessWidget {
  const CurrencyList({
    Key key,
    @required this.currencyList,
  }) : super(key: key);

  final List<dynamic> currencyList;

  @override
  Widget build(BuildContext context) {
    return LimitedBox(
      maxHeight: 70.0,
      maxWidth: double.maxFinite,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.green[500],
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
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: currencyList.length,
          itemBuilder: (context, index) {
            var currency = currencyList[index];
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    currency['symbol'] ?? '',
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    '${currency['buying_rate'] ?? ''} - ${currency['selling_rate'] ?? ''}',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'PKR - Buy - Sell',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
