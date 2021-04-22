import 'package:flutter/material.dart';

class PartnerTile extends StatelessWidget {
  const PartnerTile({
    Key key,
    @required this.title,
    @required this.icon,
    @required this.bgImage,
    @required this.description,
    @required this.onPress
  }) : super(key: key);

  final String bgImage;
  final String icon;
  final String title;
  final String description;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 265.0,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('Assets/images/$bgImage'),
            fit: BoxFit.cover),
      ),
      child: RawMaterialButton(
        onPressed: onPress,
        child: Container(
          padding:
          EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
          decoration: BoxDecoration(
            // gradient: LinearGradient(
            //   begin: Alignment.bottomLeft,
            //   end: Alignment(3.0,
            //       0.0), // 10% of the width, so there are ten blinds.
            //   // colors: [
            //   //   const Color(0xFF000000).withOpacity(0.5),
            //   //   const Color(0xFFffffff).withOpacity(0.0)
            //   // ], // whitish to gray
            //   // repeats the gradient over the canvas
            // ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.asset(
                'Assets/images/$icon',
                height: 50.0,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                title,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 32.0),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                description,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
