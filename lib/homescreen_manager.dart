import 'package:flutter/material.dart';
import 'menu_manager.dart';
import 'home.dart';
import 'profile_page.dart';
import 'package:emsproject/model/empmockdata.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';


class ManagerNavBar extends StatefulWidget {
   const ManagerNavBar({Key key, @required this.user}) : super(key: key);
  final FirebaseUser user;
  @override
  _ManagerNavBar createState() => _ManagerNavBar();
}

class _ManagerNavBar extends State<ManagerNavBar> {
  int i = 0;
  var pages = [
    new HomeScreen(),
    new ManagerMenu(),
    new ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: pages[i],
      bottomNavigationBar: new CurvedNavigationBar(
        height: 50.0,
        items: <Widget>[
          Icon(
            Icons.home,
            size: 30,
          ),
          Icon(Icons.menu, size: 30),
          Icon(Icons.perm_identity, size: 30),
        ],
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        backgroundColor: Colors.blue[100],
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            i = index;
          });
        },
      ),
    );
  }
}
