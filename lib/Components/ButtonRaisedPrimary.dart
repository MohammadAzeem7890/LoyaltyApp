import 'package:flutter/material.dart';
import 'package:pakistancurrency/Common/Theme.dart';

class ButtonRaisedPrimary extends StatelessWidget {
  const ButtonRaisedPrimary(
      {Key key,
      @required this.text,
      @required this.onPress,
      this.isLoading = false})
      : super(key: key);

  final String text;
  final Function onPress;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(25.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 15.0,
              offset: Offset(0, 10), // changes position of shadow
            ),
          ],
        ),
        child: RaisedButton(
          onPressed: onPress,
          elevation: 0.0,
          splashColor: Colors.grey.shade400,
          highlightColor: Colors.grey.shade400,
          highlightElevation: 0.0,
//          color: appTheme.primaryColor,
          color: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 20.0),
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(25.0),
          ),
          child: isLoading
              ? CircularProgressIndicator()
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      text,
                      style: TextStyle(
                          fontSize: 16.0, color: appTheme.accentColor),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Icon(
                      Icons.exit_to_app,
                      size: 18.0,
                      color: appTheme.accentColor,
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
