import 'package:emsproject/employeepage.dart';
import 'package:emsproject/model/empmockdata.dart';
import 'package:flutter/material.dart';
import 'notification.dart';
import 'package:emsproject/model/Leave.dart';
import 'package:emsproject/Validate_Leave.dart';
import 'employeepage.dart';

class AdminMenu extends StatefulWidget {
  @override
  _AdminMenu createState() => _AdminMenu();
}

class _AdminMenu extends State<AdminMenu> {
  int counter = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[100],
        appBar: AppBar(
          brightness: Brightness.light,
          title: Text(
            "MENU",
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
                new IconButton(
                    icon: Icon(Icons.notifications),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Notification1()),
                      );
                      setState(() {
                        counter = 0;
                      });
                    }),
                counter != 0
                    ? new Positioned(
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
                      )
                    : new Container()
              ],
            ),
          ],
        ),
        // floatingActionButton: FloatingActionButton(onPressed: () {
        //   print("Increment Counter");
        //   setState(() {
        //     counter++;
        //   });
        // }, child: Icon(Icons.add),),

        body: Container(
            padding: EdgeInsets.all(30.0),
            child: GridView.count(crossAxisCount: 2, children: <Widget>[
              Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  margin: EdgeInsets.all(8.0),
                  child: InkWell(
                      onTap: () {
                        Navigator.push(context,MaterialPageRoute(
                            builder: (context) => LeavePage()));
                      },
                      splashColor: Colors.blue[100],
                      child: Center(
                          child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Image.asset('assets/img/leave.png',
                              height: 60, width: 200),
                          Text("Leave", style: new TextStyle(fontSize: 17.0))
                        ],
                      )))),
              Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  margin: EdgeInsets.all(8.0),
                  child: InkWell(
                      onTap: () {},
                      splashColor: Colors.blue[100],
                      child: Center(
                          child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Image.asset('assets/img/task.png',
                              height: 60, width: 200),
                          Text("Task", style: new TextStyle(fontSize: 17.0))
                        ],
                      )))),
              Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  margin: EdgeInsets.all(8.0),
                  child: InkWell(
                      onTap: () {},
                      splashColor: Colors.blue[100],
                      child: Center(
                          child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Image.asset('assets/img/performance.png',
                              height: 60, width: 200),
                          Text("Performance",
                              style: new TextStyle(fontSize: 17.0))
                        ],
                      )))),
              Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  margin: EdgeInsets.all(8.0),
                  child: InkWell(
                      onTap: () {
                          Navigator.push(context,MaterialPageRoute(
                            builder: (context) => EmpList()));
                      },
                      splashColor: Colors.blue[100],
                      child: Center(
                          child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Image.asset('assets/img/staff.png',
                              height: 85, width: 200),
                          Text(
                            "Employees",
                            style: new TextStyle(fontSize: 17.0),
                          ),
                        ],
                      ))))
            ])));
  }
}
