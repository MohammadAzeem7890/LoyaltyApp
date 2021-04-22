import 'package:flutter/material.dart';
import 'package:pakistancurrency/Common/Theme.dart';

class GuestUserWarning extends StatelessWidget {
  const GuestUserWarning({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.error_outline,
            size: 52.0,
            color: Colors.blueAccent,
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            'Please Sign In to view this section',
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(
            height: 50.0,
          ),
          FlatButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/login');
            },
            color: Colors.grey.withOpacity(0.2),
            child: Text(
              'Sign In',
              style: TextStyle(
                color: appTheme.primaryColor,
                fontSize: 18.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}