import 'package:flutter/material.dart';

class BannerList extends StatelessWidget {
  const BannerList({
    Key key,
    @required this.banners,
  }) : super(key: key);

  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    return LimitedBox(
      maxHeight: 120.0,
      child: ListView.builder(
          padding: EdgeInsets.only(left: 20.0),
          scrollDirection: Axis.horizontal,
          itemCount: banners.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              width: 220.0,
              margin: EdgeInsets.only(right: 20.0),
              decoration: BoxDecoration(
                color: Colors.grey.shade400,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: FlatButton(
                padding: EdgeInsets.zero,
                onPressed: () {},
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.asset(
                    'Assets/images/${banners[index]}',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            );
          }),
    );
  }
}
