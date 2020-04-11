import 'package:flutter/material.dart';
//import 'package:map/notification.dart';

class HomeScreen2 extends StatefulWidget {
  
  @override
  _HomeScreenState createState() => _HomeScreenState();

  
}


class _HomeScreenState extends State<HomeScreen2> {
   int counter = 2;

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffECECEC),
        appBar: AppBar(
        brightness: Brightness.light,
        title: Text(
          "EMS",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Color(0xff022264),
        centerTitle: true,

          actions: <Widget>[
          // Using Stack to show Notification Badge
          new Stack(
            children: <Widget>[
              new IconButton(icon: Icon(Icons.notifications
              ), onPressed: () {
                Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Notification1()),);
                setState(() {
                  counter = 0;
                });
                
              }),
             counter != 0 ? new Positioned(
                right: 11,
                top: 11,
                child: new Container(
                  padding: EdgeInsets.all(2),
                  decoration: new BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  constraints: BoxConstraints(
                    minWidth: 14,
                    minHeight: 14,
                  ),
                  child: Text(
                    '$counter',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 8,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ) : new Container()
            ],
          ),
        ],
        
        
      ),

    );
  }
}