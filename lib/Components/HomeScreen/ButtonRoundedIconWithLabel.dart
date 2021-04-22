import 'package:flutter/material.dart';

class ButtonRoundedIconWithLabel extends StatelessWidget {
  const ButtonRoundedIconWithLabel({
    Key key,
    @required this.image,
    @required this.text,
    @required this.onTap
  }) : super(key: key);

  final String image;
  final String text;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FlatButton(
          padding: EdgeInsets.all(10.0),
          onPressed: onTap,
          child: Column(
            children: <Widget>[
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 15.0,
                        offset: Offset(0, 10), // changes position of shadow
                      ),
                    ],
                    borderRadius: BorderRadius.circular(50.0)),
                child: Center(child: Image.asset('Assets/images/$image')),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12.0),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
