import 'package:flutter/material.dart';
import 'package:pakistancurrency/Common/Theme.dart';

class CurrencyTable extends StatelessWidget {
  const CurrencyTable({
    Key key,
    @required this.currencyData,
  }) : super(key: key);

  final List currencyData;

  @override
  Widget build(BuildContext context) {
    // print(currencyData);
    return DataTable(
        columns: [
          DataColumn(
              label: Text(
                'Currency',
                style: TextStyle(
                    color: appTheme.primaryColor,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              )),
          DataColumn(
              label: Text(
                'Buying',
                style: TextStyle(
                    color: appTheme.primaryColor,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              )),
          DataColumn(
              label: Text(
                'Selling',
                style: TextStyle(
                    color: appTheme.primaryColor,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              )),
        ],
        rows: currencyData
            .map((e) => DataRow(cells: <DataCell>[
          DataCell(
        Row(
              children: <Widget>[
                Image.network(
                  'https://www.pakistancurrency.com/public/web/assets/images/${e['flag']}',
                  width: 40.0,
                  // height: 70,
                ),
                SizedBox(
                  width: 5.0,
                ),
                Text(e['symbol']),
              ],
            ),
          ),
          DataCell(Text(e['buying_rate'])),
          DataCell(Text(e['selling_rate'])),
        ]))
            .toList());
  }
}