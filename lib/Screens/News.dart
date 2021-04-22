// import 'package:flutter/material.dart';
// import 'package:pakistancurrency/Common/Theme.dart';
//
// import 'package:flutter_swiper/flutter_swiper.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
//
// import 'package:pakistancurrency/Components/AppDrawer.dart';
// import 'package:pakistancurrency/Components/AppBar.dart';
// import 'package:pakistancurrency/Components/News/CurrencyList.dart';
// import 'package:pakistancurrency/Components/News/BannerNews.dart';
// import 'package:pakistancurrency/Components/Heading.dart';
//
// class News extends StatefulWidget {
//   @override
//   _NewsState createState() => _NewsState();
// }
//
// final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
//
// class _NewsState extends State<News> {
//   final List<String> currencyList = ['1', '2', '3', '4', '5'];
//   final List<String> bannerList = [
//     'Lorem 1',
//     'Lorem 2',
//     'Lorem 3',
//     'Lorem 4',
//     'Lorem 5'
//   ];
//
//   final complainList = ['Name 1', 'Name 2', 'Name 3', 'Name 4', 'Name 5'];
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Scaffold(
//         key: _scaffoldKey,
//         body: SafeArea(
//           bottom: false,
//           child: NestedScrollView(
//             headerSliverBuilder:
//                 (BuildContext context, bool innerBoxIsScrolled) {
//               return <Widget>[
//                 appBar(
//                   flatButton: false,
//                   menu: false,
//                   tabs: false,
//                 )
//               ];
//             },
//             body: ListView(
//               children: <Widget>[
//                 Theme(
//                   data: ThemeData(
//                     primaryColor: Colors.grey.shade500,
//                   ),
//                   child: LimitedBox(
//                     maxHeight: 200.0,
//                     child: Swiper(
//                       itemBuilder: (BuildContext context, int index) {
//                         return Image.network(
//                           "http://via.placeholder.com/350x150",
//                           fit: BoxFit.fill,
//                         );
//                       },
//                       itemCount: 3,
//                       pagination: SwiperPagination(),
//                       control: SwiperControl(),
//                     ),
//                   ),
//                 ),
// //                CurrencyList(currencyList: currencyList),
//                 SizedBox(height: 20.0),
//                 BannerNews(bannerList: bannerList),
//                 SizedBox(height: 20.0),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                       Heading(
//                         text: 'Feedback/Complaint',
//                         size: 24.0,
//                       ),
//                       SizedBox(
//                         height: 10.0,
//                       ),
//                       LimitedBox(
//                         maxHeight: MediaQuery.of(context).size.height / 2,
//                         child: ListView.builder(
//                           itemCount: complainList.length,
//                           itemBuilder: (context, index) {
//                             return LimitedBox(
//                               maxHeight: 100.0,
//                               child: RawMaterialButton(
//                                 onPressed: () {},
//                                 child: Row(
//                                   crossAxisAlignment: CrossAxisAlignment.center,
//                                   children: <Widget>[
//                                     CircleAvatar(
//                                       radius: 30.0,
//                                       backgroundImage: AssetImage(
//                                           'Assets/images/portrait.jpg'),
//                                     ),
//                                     SizedBox(
//                                       width: 20.0,
//                                     ),
//                                     Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: <Widget>[
//                                         SizedBox(
//                                           height: 20.0,
//                                         ),
//                                         Text(
//                                           'Jason Moosa',
//                                           style: TextStyle(
//                                               fontSize: 14.0,
//                                               fontWeight: FontWeight.bold),
//                                         ),
//                                         SizedBox(
//                                           height: 5.0,
//                                         ),
//                                         Text(
//                                           'jsonm@gmail.com',
//                                           style: TextStyle(
//                                               color: Colors.grey.shade600),
//                                         ),
//                                         RatingBar(
//                                           ignoreGestures: true,
//                                           unratedColor: Colors.grey.shade400,
//                                           initialRating: 3.5,
//                                           itemSize: 18.0,
//                                           minRating: 1,
//                                           direction: Axis.horizontal,
//                                           allowHalfRating: true,
//                                           itemCount: 5,
//                                           itemBuilder: (context, _) => Icon(
//                                             Icons.star,
//                                             color: Colors.amber,
//                                           ),
//                                           onRatingUpdate: (rating) {
//                                             print(rating);
//                                           },
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             );
//                           },
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
