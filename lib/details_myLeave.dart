//import 'package:emsproject/model/myLeave.dart';
import 'package:flutter/material.dart';
import 'package:emsproject/model/leave_model.dart';

class DetailMyLeave extends StatefulWidget {
  final Leave leave;

  DetailMyLeave({this.leave});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailMyLeave> {
  var currentSelectedValue;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        resizeToAvoidBottomPadding: true,
        backgroundColor: Colors.blue[100],
        appBar: AppBar(
          elevation: 0,
          brightness: Brightness.light,
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Color(0xff022264),
          title: Text(
            "LEAVE DETAILS",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                  width: MediaQuery.of(context).size.width * 10.0,
                  margin:
                      const EdgeInsets.only(left: 40.0, right: 40.0, top: 70),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Container(
                          width: 360,
                          padding: EdgeInsets.all(20.0),
                          decoration: new BoxDecoration(
                            color: Color(0xffECECEC),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: new Text(
                              "Leave From: " + widget.leave.leavefrom,
                              style:
                                  TextStyle(color: Colors.black, height: 1.4)),
                        ),
                        new SizedBox(
                          height: 10,
                        ),
                        new Container(
                          width: 360,
                          padding: EdgeInsets.all(20.0),
                          decoration: new BoxDecoration(
                            color: Color(0xffECECEC),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: new Text("Leave To: " + widget.leave.leaveto,
                              style:
                                  TextStyle(color: Colors.black, height: 1.4)),
                        ),
                      ])),
              Container(
                width: MediaQuery.of(context).size.width * 10.0,
                margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 10),
                child: new Container(
                  width: 60,
                  padding: EdgeInsets.all(20.0),
                  decoration: new BoxDecoration(
                    color: Color(0xffECECEC),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: new Text("Type of Application: " + widget.leave.type,
                      style: TextStyle(color: Colors.black, height: 1.4)),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 90.0,
                margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 1),
                padding: EdgeInsets.only(left: 20.0, right: 20, top: 10),
                child: new Container(
                  width: 60,
                  padding: EdgeInsets.all(20.0),
                  decoration: new BoxDecoration(
                    color: Color(0xffECECEC),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: new Text("Reason: " + widget.leave.reason,
                      style: TextStyle(color: Colors.black, height: 1.4)),
                ),
              ),

             Container(
                width: MediaQuery.of(context).size.width * 90.0,
                margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 1),
                padding: EdgeInsets.only(left: 20.0, right: 20, top: 10),
                child: new Container(
                  width: 60,
                  padding: EdgeInsets.all(20.0),
                  decoration: new BoxDecoration(
                    color: Color(0xffECECEC),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: new Text("Status: " + widget.leave.status,
                      style: TextStyle(color: Colors.black, height: 1.4)),
                ),
              )
            ],
          ),
        ));
  }
}
