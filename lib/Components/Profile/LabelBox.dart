import 'package:flutter/material.dart';
import 'package:pakistancurrency/Common/Theme.dart';

class LabelBox extends StatelessWidget {
  const LabelBox({
    Key key,
    @required this.value,
    @required this.label
  }) : super(key: key);

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.0),
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 15.0,
            offset: Offset(0, 10), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '$label:',
            style: TextStyle(
                fontSize: 14.0, color: appTheme.accentColor),
          ),
          SizedBox(width: 5.0,),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                  fontSize: 14.0),
            ),
          ),
        ],
      ),
    );
  }
}