import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LeaveFormPage extends StatefulWidget {
  @override
  _LeaveFormPage createState() => _LeaveFormPage();
}

class _LeaveFormPage extends State<LeaveFormPage> {
  DateTime _dateTime;
  DateTime _dateTime2;

  var myFormat = DateFormat('yyyy-MM-dd');

  final _formKey = GlobalKey<FormState>();

  String _valFriends;
  var _leaveType = ['Medical Leave', 'Annual Leave', 'Others'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _formKey,
        appBar: new AppBar(
          centerTitle: true,
          title: Text("APPLY LEAVE"),
          backgroundColor: Color(0xff022264),
        ),
        backgroundColor: Colors.blue[100],
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(children: <Widget>[
                        new Container(
                          width: 170,
                          height: 50,
                          padding: EdgeInsets.all(10.0),
                          decoration: new BoxDecoration(
                            color: Color(0xffECECEC),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Center(
                            child: Text(
                              _dateTime == null
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
                          child: Text('Choose Date'),
                          color: Colors.blue,
                          splashColor: Color.fromRGBO(10, 20, 10, 10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          onPressed: () {
                            showDatePicker(
                                    context: context,
                                    initialDate: _dateTime == null
                                        ? DateTime.now()
                                        : _dateTime,
                                    firstDate: DateTime(2001),
                                    lastDate: DateTime(2222))
                                .then((date) {
                              setState(() {
                                _dateTime = date;
                                // leave.leaveFrom = date.toString();
                              });
                            });
                          },
                        )
                      ])),
                  Column(
                    children: <Widget>[
                      new Container(
                        width: 170,
                        height: 50,
                        padding: EdgeInsets.all(10.0),
                        decoration: new BoxDecoration(
                          color: Color(0xffECECEC),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Center(
                          child: Text(
                            _dateTime2 == null
                                ? ' Leave To'
                                : myFormat.format(_dateTime2),
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      new RaisedButton(
                        child: Text('Choose Date'),
                        color: Colors.blue,
                        splashColor: Color.fromRGBO(10, 20, 10, 10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        onPressed: () {
                          showDatePicker(
                                  context: context,
                                  initialDate: _dateTime2 == null
                                      ? DateTime.now()
                                      : _dateTime2,
                                  firstDate: DateTime(2001),
                                  lastDate: DateTime(2222))
                              .then((date) {
                            setState(() {
                              _dateTime2 = date;
                              // leave.leaveTo = date.toString();
                            });
                          });
                        },
                      )
                    ],
                  ),
                ],
              ),
              Container(
                  width: MediaQuery.of(context).size.width * 10.0,
                  margin:
                      const EdgeInsets.only(left: 20.0, right: 20.0, top: 5),
                  child: new Container(
                      padding: EdgeInsets.all(20.0),
                      decoration: new BoxDecoration(
                        color: Color(0xffECECEC),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                            hint: Text('  Type of Application'),
                            value: _valFriends,
                            items: _leaveType.map((value) {
                              return DropdownMenuItem(
                                child: Text(value),
                                value: value,
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                _valFriends = value;
                                // leave.leaveType = value;
                              });
                            }),
                      ))),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: new Container(
                  width: 360,
                  padding: EdgeInsets.all(15.0),
                  decoration: new BoxDecoration(
                    color: Color(0xffECECEC),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: new TextFormField(
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Enter your reason';
                      }
                      return null;
                    },
                    // onSaved: (String value) {
                    //   leave.reason = value;
                    // },
                    decoration: new InputDecoration(
                      hintText: " Reason ",
                      fillColor: Color(0xffECECEC),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: BorderSide(color: Color(0xffECECEC))),
                    ),
                  ),
                ),
              ),

              FloatingActionButton.extended(
                onPressed: () {
                  Navigator.pop(context);
                },
                splashColor: Colors.yellowAccent,
                backgroundColor: Colors.lightGreen,
                label: Text('Submit'),
                icon: Icon(Icons.check_circle),
              )
            ]));
  }
}
