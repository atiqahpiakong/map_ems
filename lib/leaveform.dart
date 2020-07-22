import 'package:emsproject/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:ui';
import 'notification_dialog.dart';
import 'package:emsproject/mLeave.dart';
import './services/leave_data_service.dart';
import 'package:emsproject/model/leave_model.dart';

class LeaveFormPage extends StatefulWidget {
  @override
  _LeaveFormPage createState() => _LeaveFormPage();
}

class _LeaveFormPage extends State<LeaveFormPage> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  Future<String> getCurrentUID() async {
    return (await _firebaseAuth.currentUser()).uid;
  }

  DateTime leavefrom;
  DateTime leaveto;
  String type;
  String reason;
  String name;

  String id;
  final db = Firestore.instance;

  DateTime _dateTime;
  DateTime _dateTime2;
  var myFormat = DateFormat('yyyy-MM-dd');

  final _formKey = GlobalKey<FormState>();

  String _valcategory;
  var _leaveType = ['Medical Leave', 'Annual Leave', 'Others'];

  DateTime selectedDate = DateTime.now();
  LeaveDataService dataService = LeaveDataService();

  final DateFormat dateFormat = DateFormat('dd-MM-yyyy');

  static var dt = DateTime.now();
  static var newDt = DateFormat.yMMMEd().format(dt);

  Widget _buildLeaveDates() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(children: <Widget>[
              new Container(
                width: 170,
                height: 65,
                padding: EdgeInsets.all(10.0),
                decoration: new BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Center(
                  child: Text(
                    _dateTime == leavefrom
                        ? ' Leave From '
                        : myFormat.format(_dateTime),
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              new RaisedButton(
                child: Text('Choose Date & Time'),
                color: Colors.blue,
                splashColor: Color.fromRGBO(10, 20, 10, 10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                onPressed: () {
                  showDateTimeDialog(context, initialDate: selectedDate,
                      onSelectedDate: (selectedDate) {
                    setState(() {
                      this._dateTime = selectedDate;
                    });
                  });
                },
              )
            ])),
        Column(
          children: <Widget>[
            new Container(
              width: 170,
              height: 65,
              padding: EdgeInsets.all(10.0),
              decoration: new BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Center(
                child: Text(
                  _dateTime2 == leaveto
                      ? ' Leave To'
                      : _dateTime2.toLocal().toString(),
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            new RaisedButton(
              child: Text('Choose Date & Time'),
              color: Colors.blue,
              splashColor: Color.fromRGBO(10, 20, 10, 10),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              onPressed: () {
                showDateTimeDialog(context, initialDate: selectedDate,
                    onSelectedDate: (selectedDate) {
                  setState(() {
                    this._dateTime2 = selectedDate;
                    // leave.leaveTo = date.toString();
                  });
                });
              },
            )
          ],
        ),
      ],
    );
  }

  Widget _buildLeaveType() {
    return Padding(
      padding: const EdgeInsets.only(
          left: 25.0, right: 25.0, top: 10.0, bottom: 10.0),
      child: Container(
        height: 50.0,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 15,
                ),
                Container(
                  child: Icon(
                    Icons.category,
                    color: Colors.deepOrange,
                  ),
                ),
                new Expanded(
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      hint: Text('   Type of Application'),
                      isExpanded: true,
                      value: _valcategory,
                      items: _leaveType.map((value) {
                        return DropdownMenuItem(
                          child: Text(value),
                          value: value,
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _valcategory = value;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLeaveReason() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Container(
        width: 360,
        padding: EdgeInsets.all(15.0),
        decoration: new BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: new TextFormField(
          validator: (String value) {
            if (value.isEmpty) {
              return 'Enter your reason';
            }
            return null;
          },
          // onSaved: (value) => reason = value,
          onChanged: (value) {
            setState(() => reason = value);
          },
          decoration: new InputDecoration(
            hintText: " Reason ",
            fillColor: Colors.white,
            filled: true,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: BorderSide(color: Colors.white)),
          ),
        ),
      ),
    );
  }

  Widget _buildName() {
    return Padding(
      padding: const EdgeInsets.only(
          left: 25.0, right: 25.0, top: 20.0, bottom: 10.0),
      child: new Container(
        width: 360,
        padding: EdgeInsets.all(15.0),
        decoration: new BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: new TextFormField(
          validator: (String value) {
            if (value.isEmpty) {
              return 'Enter your name';
            }
            return null;
          },
          onChanged: (value) {
            setState(() => name = value);
          },
          decoration: new InputDecoration(
            hintText: " Name ",
            fillColor: Colors.white,
            filled: true,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: BorderSide(color: Colors.white)),
          ),
        ),
      ),
    );
  }

  Widget _buildSubmitButton() {
    return FloatingActionButton.extended(
      onPressed: () {
        addLeave();
        dialog(context);
      },
      splashColor: Colors.yellowAccent,
      backgroundColor: Colors.lightGreen,
      label: Text('Submit'),
      icon: Icon(Icons.check_circle),
    );
  }

  void addLeave() async {
    final uid = await getCurrentUID();
    return setState(() {
      Leave leave = new Leave(
          leavefrom: '$_dateTime',
          leaveto: '$_dateTime2',
          name: name,
          reason: reason,
          type: _valcategory,
          status: "Pending",
          userid: uid);
      dataService.createLeave(leave: leave);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          centerTitle: true,
          title: Text("APPLY LEAVE"),
          backgroundColor: Color(0xff022264),
        ),
        backgroundColor: Colors.blue[100],
        body: SingleChildScrollView(
          child: new Form(
            key: _formKey,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 30,
                  ),
                  _buildName(),
                  _buildLeaveDates(),
                  _buildLeaveType(),
                  _buildLeaveReason(),
                  SizedBox(
                    height: 30,
                  ),
                  _buildSubmitButton(),
                  SizedBox(
                    height: 40,
                  ),
                ]),
          ),
        ));
  }

  void dialog(BuildContext context) {
    var alertDialog = AlertDialog(
      backgroundColor: Color.fromRGBO(40, 20, 40, 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      title: Text(
        "Success",
        style: TextStyle(color: Colors.white),
      ),
      content: Text(
        "Your Leave Application Have been Submitted",
        style: TextStyle(color: Colors.white),
      ),
      actions: <Widget>[
        FlatButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return new BottomNavBar(user: null);
              }));
            },
            child: Text("OK"))
      ],
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }
}
