import 'package:flutter/material.dart';
import 'package:pakistancurrency/Common/Constants.dart';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:pakistancurrency/Components/AppBar.dart';
import 'package:pakistancurrency/Components/Profile/LabelBox.dart';
import 'package:pakistancurrency/Components/Heading.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String name;
  String fatherName;
  String identityNo;
  String contactNo;
  String address;
  String occupation;
  String memberType;
  bool isLoading = false;
  bool isGuest;
  String pointsValue;

  @override
  void initState() {
    super.initState();
    name = '';
    fatherName = '';
    identityNo = '';
    contactNo = '';
    address = '';
    occupation = '';
    memberType = '';
    pointsValue = '';
    isGuest = false;
    getUserData();
  }

  void getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String identityNoSaved = prefs.getString('identityNo');
    var url = '$BASE_URL/GetCustomerDetail?IdentityNo=$identityNoSaved';
    var response;

    try {
      response = await http.get(
        url,
        headers: {"AppToken": "D094BBF4-FAC5-4416-AD34-E2B2338D502B"},
      );
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      final snackBar = SnackBar(content: Text('Network Error'));

      _scaffoldKey.currentState.showSnackBar(snackBar);
    }

    if (response.statusCode == 200) {
      setState(() {
        isLoading = false;
      });
      if (convert.jsonDecode(response.body)['IsCustomerFound']) {
        var responseData = convert.jsonDecode(response.body)['CustomerDetail'];
        setState(() {
          name = responseData['FullName'];
          fatherName = responseData['FatherName'];
          identityNo = responseData['IdentityNo'];
          contactNo = responseData['ContactNo'];
          address = responseData['PermanentAddress'];
          occupation = responseData['Occupation'];
          memberType = responseData['MemberTypeName'];
          pointsValue = responseData['PointsBalance'].toString();
        });
      } else {
        final snackBar =
            SnackBar(content: Text('Identity No or OTP incorrect'));

        _scaffoldKey.currentState.showSnackBar(snackBar);
      }
    } else {
      setState(() {
        isLoading = false;
      });
      final snackBar = SnackBar(content: Text('Fatal Error'));

      _scaffoldKey.currentState.showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        key: _scaffoldKey,
        body: SafeArea(
          bottom: false,
          child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                appBar(
                  flatButton: false,
                  menu: false,
                  tabs: false,
                  logo: true,
                  points: isGuest ? false : true,
                  pointsValue: pointsValue,
                )
              ];
            },
            body: ListView(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              children: <Widget>[
                Heading(text: 'Profile'),
                SizedBox(
                  height: 20.0,
                ),
                name.length > 0
                    ? LabelBox(
                        label: 'Name',
                        value: name,
                      )
                    : SizedBox(),
                fatherName.length > 0
                    ? LabelBox(
                        label: 'Fathers Name',
                        value: fatherName,
                      )
                    : SizedBox(),
                identityNo.length > 0
                    ? LabelBox(
                        label: 'Identity No',
                        value: identityNo,
                      )
                    : SizedBox(),
                contactNo.length > 0
                    ? LabelBox(
                        label: 'Contact No',
                        value: contactNo,
                      )
                    : SizedBox(),
                address.length > 0
                    ? LabelBox(
                        label: 'Address',
                        value: address,
                      )
                    : SizedBox(),
                occupation.length > 0
                    ? LabelBox(
                        label: 'Occupation',
                        value: occupation,
                      )
                    : SizedBox(),
                memberType.length > 0
                    ? LabelBox(
                        label: 'Member Type',
                        value: memberType,
                      )
                    : SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
