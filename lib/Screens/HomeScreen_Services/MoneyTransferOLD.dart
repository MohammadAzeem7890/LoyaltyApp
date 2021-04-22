// import 'package:flutter/material.dart';
// import 'package:pakistancurrency/Common/Theme.dart';
// import 'package:pakistancurrency/Common/Constants.dart';
//
// import 'package:http/http.dart' as http;
// import 'dart:convert' as convert;
// import 'package:shared_preferences/shared_preferences.dart';
//
// import 'package:pakistancurrency/Components/AppBar.dart';
// import 'package:pakistancurrency/Components/Heading.dart';
// import 'package:pakistancurrency/Components/HomeScreen/Partners.dart';
// import 'package:pakistancurrency/Components/PartnerTile.dart';
//
// class MoneyTransfer extends StatefulWidget {
//   @override
//   _MoneyTransferState createState() => _MoneyTransferState();
// }
//
// class _MoneyTransferState extends State<MoneyTransfer> {
//   final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
//   String pointsValue;
//   bool isGuest;
//   bool isLoading = false;
//
//   @override
//   void initState() {
//     super.initState();
//     pointsValue = '';
//     isGuest = false;
//     getUserData();
//   }
//
//   void getUserData() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String identityNoSaved = prefs.getString('identityNo');
//     if (identityNoSaved == null) {
//       setState(() {
//         isGuest = true;
//       });
//       return;
//     }
//     var url = '$BASE_URL/GetCustomerDetail?IdentityNo=$identityNoSaved';
//     var response;
//
//     try {
//       response = await http.get(
//         url,
//         headers: {"AppToken": "D094BBF4-FAC5-4416-AD34-E2B2338D502B"},
//       );
//     } catch (e) {
//       setState(() {
//         isLoading = false;
//       });
//       final snackBar = SnackBar(content: Text('Network Error'));
//
//       _scaffoldKey.currentState.showSnackBar(snackBar);
//     }
//
//     if (response.statusCode == 200) {
//       setState(() {
//         isLoading = false;
//       });
//       if (convert.jsonDecode(response.body)['IsCustomerFound']) {
//         var responseData = convert.jsonDecode(response.body)['CustomerDetail'];
//         setState(() {
//           pointsValue = responseData['PointsBalance'].toString();
//         });
//       } else {
//         final snackBar =
//             SnackBar(content: Text('Identity No or OTP incorrect'));
//
//         _scaffoldKey.currentState.showSnackBar(snackBar);
//       }
//     } else {
//       setState(() {
//         isLoading = false;
//       });
//       final snackBar = SnackBar(content: Text('Fatal Error'));
//
//       _scaffoldKey.currentState.showSnackBar(snackBar);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Scaffold(
//         resizeToAvoidBottomPadding: true,
//         key: _scaffoldKey,
//         body: SafeArea(
//           child: NestedScrollView(
//             headerSliverBuilder:
//                 (BuildContext context, bool innerBoxIsScrolled) {
//               return <Widget>[
//                 appBar(
//                   flatButton: false,
//                   menu: false,
//                   tabs: false,
//                   logo: true,
//                   points: isGuest ? false : true,
//                   pointsValue: pointsValue,
//                 )
//               ];
//             },
//             body: ListView(
//               padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
//               children: <Widget>[
//                 Heading(
//                   text: 'Money Transfer',
//                   size: 24.0,
//                   color: appTheme.accentColor,
//                 ),
//                 SizedBox(
//                   height: 20.0,
//                 ),
//                 Text(
//                   'We are here to connect you wherever you want through our fastest services using our electronic means of transferring funds overseas, this trustworthy money Exchange Company has amalgamated with a mission to serve better and make fund transfers either for immigrations fee, personal expense, university fee, or traveling expenses more convenient with our experience and capabilities in any currency you want and in the most secure manner.',
//                   style: TextStyle(color: Colors.grey.shade700),
//                 ),
//                 SizedBox(
//                   height: 20.0,
//                 ),
//                 PartnerTile(
//                   onPress: () {
//                     Navigator.pushNamed(context, '/westernUnion');
//                   },
//                   bgImage: 'westUnion.jpg',
//                   icon: 'westUicon.png',
//                   title: 'Western Union',
//                   description:
//                       'An easy way to Receive and send money to your loved ones online with the most reliable transfer company at your ease.',
//                 ),
//                 SizedBox(
//                   height: 10.0,
//                 ),
//                 PartnerTile(
//                   onPress: () {
//                     Navigator.pushNamed(context, '/moneyGram');
//                   },
//                   bgImage: 'moneyGram.jpg',
//                   icon: 'moneyGicon.png',
//                   title: 'Money Gram',
//                   description:
//                       'Save time by sending Money globally with well-known transfer company which is known for its reliability and instant fund transfers that understands your bond with your loved ones. ',
//                 ),
//                 SizedBox(
//                   height: 10.0,
//                 ),
//                 PartnerTile(
//                   onPress: () {
//                     Navigator.pushNamed(context, '/ria');
//                   },
//                   bgImage: 'riabg.jpg',
//                   icon: 'riaIcon.png',
//                   title: 'Ria',
//                   description:
//                       'Transfers money conveniently than you think, at any hour of need. RIA aims to provide the quick Fund receiving solution anywhere from the world round the clock!',
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
