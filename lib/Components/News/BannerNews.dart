import 'package:flutter/material.dart';

class BannerNews extends StatelessWidget {
  const BannerNews({
    Key key,
    @required this.bannerList,
  }) : super(key: key);

  final List<String> bannerList;

  @override
  Widget build(BuildContext context) {
    return LimitedBox(
      maxHeight: 240.0,
      maxWidth: double.maxFinite,
      child: Container(
        child: ListView.builder(
          padding: EdgeInsets.only(left: 20.0),
          scrollDirection: Axis.horizontal,
          itemCount: bannerList.length,
          itemBuilder: (context, index) {
            return Container(
              width: 250.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 15.0,
                    offset:
                    Offset(0, 10), // changes position of shadow
                  ),
                ],
              ),
              margin: EdgeInsets.only(right: 15.0, bottom: 25.0),
              child: RawMaterialButton(
                onPressed: (){},
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(
                      height: 120.0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)),
                        child: Image.network(
                          "http://via.placeholder.com/350x150",
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, bottom: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            bannerList[index],
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0),
                          ),
                          Text(
                            'Lorem epsum',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            '2 hours ago',
                            style:
                            TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}