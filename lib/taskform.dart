import 'package:flutter/material.dart';
import 'menu_admin.dart';
import 'package:intl/intl.dart';

//import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class TaskFormPage extends StatefulWidget {
  @override
  _TaskFormPage createState() => _TaskFormPage();
}

class _TaskFormPage extends State<TaskFormPage> {

  DateTime _submitDate;

  var myFormat = DateFormat('yyyy-MM-dd');

  String _valFriends;

  var _employeeNames = [
    "  Clara",
    "  John",
    "  Rizal",
    "  Steve",
    "  Laurel",
    "  Bernard",
    "  Miechel"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("ASSIGN TASK"),
        backgroundColor: Color(0xff022264),
      ),
      backgroundColor: Colors.blue[100],
      body: Container(
        // padding: EdgeInsets.only(top: 0),
        // child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: new Container(
                width: 360,
                padding: EdgeInsets.all(10.0),
                decoration: new BoxDecoration(
                  color: Color(0xffECECEC),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: new TextFormField(
                  // validator: SubjectValidator.validate,
                  decoration: new InputDecoration(
                    hintText: " Subject ",
                    fillColor: Color(0xffECECEC),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(color: Color(0xffECECEC))),
                  ),
                ),
              ),
            ),
            Container(
                width: MediaQuery.of(context).size.width * 40.0,
                margin: const EdgeInsets.only(
                    left: 20.0, right: 20.0, top: 10, bottom: 10),
                child: new Container(
                    padding: EdgeInsets.all(10.0),
                    decoration: new BoxDecoration(
                      color: Color(0xffECECEC),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                          hint: Text('   Assign To'),
                          value: _valFriends,
                          items: _employeeNames.map((value) {
                            return DropdownMenuItem(
                              child: Text(value),
                              value: value,
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _valFriends = value;
                            });
                          }),
                    ))),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: new Container(
                width: 360,
                padding: EdgeInsets.all(10.0),
                decoration: new BoxDecoration(
                  color: Color(0xffECECEC),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: new TextFormField(
                  // validator: DescriptionValidator.validate,
                  decoration: new InputDecoration(
                    hintText: " Description ",
                    fillColor: Color(0xffECECEC),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(color: Color(0xffECECEC))),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: new Container(
                width: 360,
                padding: EdgeInsets.all(10.0),
                decoration: new BoxDecoration(
                  color: Color(0xffECECEC),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Center(
                  child: Text(
                    _submitDate == null
                        ? ' Due On'
                        : myFormat.format(_submitDate),
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 2.0, bottom: 20.0),
              child: RaisedButton(
                child: Text('Choose Date'),
                color: Colors.blue,
                splashColor: Color.fromRGBO(10, 20, 10, 10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                onPressed: () {
                  showDatePicker(
                          context: context,
                          initialDate: _submitDate == null
                              ? DateTime.now()
                              : _submitDate,
                          firstDate: DateTime(2001),
                          lastDate: DateTime(2222))
                      .then((date) {
                    setState(() {
                      _submitDate = date;
                    });
                  });
                },
              ),
            ),

             FloatingActionButton.extended(
              onPressed: () {
              },
              backgroundColor: Colors.lightGreen,
              label: Text('Submit'),
              icon: Icon(Icons.check_circle),
            )

          ],
        ),
      ),
    );
  }
}
