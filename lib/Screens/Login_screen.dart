import 'package:flutter/material.dart';
import 'package:pakistancurrency/Common/Constants.dart';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:pakistancurrency/Components/Heading.dart';
import 'package:pakistancurrency/Components/InputField.dart';
import 'package:pakistancurrency/Components/ButtonRaisedPrimary.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String identityNo;
  String otp;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    checkUserSaved();
  }

  void checkUserSaved() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String identityNoSaved = prefs.getString('identityNo');
    if (identityNoSaved != null) {
      Navigator.pushReplacementNamed(context, '/homeScreen');
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }

  void verifyUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var url = '$BASE_URL/VerifyIdentity?IdentityNo=$identityNo&OneTimePin=$otp';
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
      if (convert.jsonDecode(response.body)['IsVerifiedCustomer']) {
        await prefs.setString('identityNo', identityNo);
        Navigator.pushReplacementNamed(context, '/homeScreen');
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
      child: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Scaffold(
          key: _scaffoldKey,
          body: isLoading
              ? Center(child: CircularProgressIndicator())
              : SafeArea(
                  top: false,
                  bottom: false,
                  child: NestedScrollView(
                    headerSliverBuilder:
                        (BuildContext context, bool innerBoxIsScrolled) {
                      return <Widget>[];
                    },
                    body: Container(
//            padding: EdgeInsets.all(20.0),
                      child: Container(
                        decoration: BoxDecoration(
                          // gradient: LinearGradient(
                          //   begin: Alignment.topLeft,
                          //   end: Alignment.bottomRight,
                          //   // colors: [
                          //   //   const Color(0xFF04a358),
                          //   //   const Color(0xFF1485ac)
                          //   // ], // whitish to gray
                          //   // tileMode: TileMode
                          //   //     .clamp, // repeats the gradient over the canvas
                          // ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Heading(
                                text: 'Sign in',
                                color: Colors.white,
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              InputField(
                                icon: Icon(
                                  Icons.perm_identity,
                                  color: Colors.white,
                                ),
                                placeholder: 'Identity No.',
                                white: true,
                                limit: 13,
                                onChange: (text) {
                                  setState(() {
                                    identityNo = text;
                                  });
                                },
                              ),
                              SizedBox(
                                height: 7.0,
                              ),
                              InputField(
                                icon: Icon(
                                  Icons.lock_outline,
                                  color: Colors.white,
                                ),
                                placeholder: 'OTP',
                                white: true,
                                limit: 4,
                                onChange: (text) {
                                  setState(() {
                                    otp = text;
                                  });
                                },
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              ButtonRaisedPrimary(
                                isLoading: isLoading,
                                onPress: () {
                                  setState(() {
                                    isLoading = true;
                                    verifyUser();
                                  });
                                },
                                text: 'Login',
                              ),
                              SizedBox(
                                height: 70.0,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      width:
                                          MediaQuery.of(context).size.width / 4,
                                      height: 1.0,
                                      color: Colors.white,
                                    ),
                                    SizedBox(width: 20.0),
                                    Text(
                                      'OR',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(width: 20.0),
                                    Container(
                                      width:
                                          MediaQuery.of(context).size.width / 4,
                                      height: 1.0,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                              Center(
                                child: FlatButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/homeScreen');
                                  },
                                  color: Colors.white.withOpacity(0.2),
                                  child: Text(
                                    'Open as Guest',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
