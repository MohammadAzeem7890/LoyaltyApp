import 'package:flutter/material.dart';
import 'package:pakistancurrency/Common/Theme.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:pakistancurrency/Components/Heading.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key key, @required this.onClose, this.identityNo, this.name})
      : super(key: key);
  final Function onClose;
  final String name;
  final String identityNo;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Scaffold(
        backgroundColor: appTheme.primaryColor,
        appBar: AppBar(
          brightness: Brightness.light,
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.clear,
                  color: Colors.black,
                ),
                onPressed: onClose)
          ],
        ),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              LimitedBox(
                maxHeight: 120.0,
                child: DrawerHeader(
                  child: RawMaterialButton(
                    padding: EdgeInsets.only(left: 20.0),
                    onPressed: () {
                      if (name != '' && identityNo != '') {
                        Navigator.of(context).pop();
                        Navigator.pushNamed(context, '/profile');
                      }else{
                        Navigator.pushNamed(context, '/login');
                      }
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 35.0,
                          child: Icon(
                            Icons.perm_identity,
                            size: 38.0,
                            color: appTheme.accentColor,
                          ),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              height: 20.0,
                            ),
                            Text(
                              name != '' ? name : 'Sign In',
                              style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              identityNo != '' ? identityNo : 'To view profile',
                              style: TextStyle(color: Colors.grey.shade50),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              LimitedBox(
                maxHeight: MediaQuery.of(context).size.height / 2.3,
                child: ListView(
                  padding: EdgeInsets.only(left: 20.0),
                  children: [
                    ListTile(
                      title: Heading(
                          text: 'News', size: 26.0, color: Colors.white),
                      onTap: () {
                        Navigator.of(context).pop();
                        Navigator.pushNamed(context, '/news');
                      },
                    ),
                    name != '' && identityNo != '' ?
                    ListTile(
                      title: Heading(
                          text: 'Transaction History',
                          size: 26.0,
                          color: Colors.white),
                      onTap: () {
                        Navigator.of(context).pop();
                        Navigator.pushNamed(context, '/transactionHistory');
                      },
                    ) : SizedBox(),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, bottom: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
//                      ListTile(
//                        title: Text(
//                          'Settings',
//                          style: TextStyle(fontSize: 18.0, color: Colors.white),
//                        ),
//                        onTap: () {
//                          Navigator.of(context).pop();
//                        },
//                      ),
                      name != '' && identityNo != '' ? ListTile(
                        title: Text(
                          'Logout',
                          style: TextStyle(fontSize: 18.0, color: Colors.white),
                        ),
                        onTap: () async {
                          SharedPreferences prefs = await SharedPreferences.getInstance();
                          await prefs.remove('identityNo');
                          Navigator.of(context).pop();
                          Navigator.pushReplacementNamed(context, '/homeScreen');
                        },
                      ) : SizedBox(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
