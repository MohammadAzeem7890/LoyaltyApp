import 'package:flutter/material.dart';

import 'package:pakistancurrency/Components/Heading.dart';

class Partners extends StatelessWidget {
  const Partners({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Heading(
          text: 'Partners',
          size: 18.0,
        ),
        SizedBox(
          height: 10.0,
        ),
        Row(
          children: <Widget>[
            Expanded(
                flex: 3,
                child: RawMaterialButton(
                  onPressed: () {
//                    Navigator.pushNamed(context, '/westernUnion');
                  },
                  child: Image.asset('Assets/images/Western_Union_Logo.png'),
                )),
            SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: RawMaterialButton(
                  onPressed: () {
//                    Navigator.pushNamed(context, '/ria');
                  },
                  child: Image.asset('Assets/images/Ria_Logo.png')),
            ),
            SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: RawMaterialButton(
                  onPressed: () {
//                    Navigator.pushNamed(context, '/moneyGram');
                  },
                  child: Image.asset('Assets/images/Group 32.png')),
            ),
          ],
        ),
      ],
    );
  }
}
