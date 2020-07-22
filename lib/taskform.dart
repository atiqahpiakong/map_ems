import 'package:emsproject/homescreen_manager.dart';
import 'package:emsproject/services/task_data_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'notification_dialog.dart';
import 'package:emsproject/model/task_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TaskFormPage extends StatefulWidget {
  @override
  _TaskFormPage createState() => _TaskFormPage();
}

TaskDataService dataService = TaskDataService();

class _TaskFormPage extends State<TaskFormPage> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  Future<String> getCurrentUID() async {
    return (await _firebaseAuth.currentUser()).uid;
  }

  String id;
  DateTime _submitDate;
  String title;
  String description;
  String assign;
  DateTime due;

  final _formKey = GlobalKey<FormState>();

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

  DateTime selectedDate = DateTime.now();
  final DateFormat dateFormat = DateFormat('dd-MM-yyyy HH:mm');

  static var dt = DateTime.now();
  static var newDt = DateFormat.yMMMEd().format(dt);

  Widget _buildSubjectBox() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: new Container(
        width: 360,
        padding: EdgeInsets.all(10.0),
        decoration: new BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: new TextFormField(
          validator: (String value) {
            if (value.isEmpty) {
              return 'Enter your subject';
            }
            return null;
          },
          onChanged: (value) {
            setState(() => title = value);
          },
          decoration: new InputDecoration(
            hintText: " Subject ",
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

  Widget _buildAssignTo() {
    return Padding(
        padding: const EdgeInsets.only(
            left: 25.0, right: 25.0, top: 10.0, bottom: 10.0),
        child: new Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0), color: Colors.white),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          width: 10,
                          height: 15,
                        ),
                        Container(
                          child: Icon(
                            Icons.category,
                            color: Colors.deepOrange,
                          ),
                        ),
                        new Expanded(
                            child: DropdownButtonHideUnderline(
                                child: ButtonTheme(
                          alignedDropdown: true,
                          child: DropdownButton(
                              hint: Text('Assign To'),
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
                        )))
                      ])
                ])));
  }

  Widget _buildDescription() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: new Container(
        width: 360,
        padding: EdgeInsets.all(10.0),
        decoration: new BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: new TextFormField(
          validator: (String value) {
            if (value.isEmpty) {
              return 'Enter your description';
            }
            return null;
          },
          onChanged: (value) {
            setState(() => description = value);
          },
          decoration: new InputDecoration(
            hintText: " Description ",
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

  Widget _buildDueOnBox() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(children: <Widget>[
            new Container(
                width: 360,
                height: 70,
                padding: EdgeInsets.all(10.0),
                decoration: new BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Center(
                  child: Text(
                    _submitDate == null
                        ? ' Due On'
                        : _submitDate.toLocal().toString(),
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                )),
            new RaisedButton(
                child: Text('Choose Date & Time'),
                color: Colors.blue,
                splashColor: Color.fromRGBO(10, 20, 10, 10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                onPressed: () async {
                  showDateTimeDialog(context, initialDate: selectedDate,
                      onSelectedDate: (selectedDate) {
                    setState(() {
                      this._submitDate = selectedDate;
                    });
                  });
                })
          ]))
    ]);
  }

  Widget _buildSubmitButton() {
    return FloatingActionButton.extended(
      onPressed: () {
        addTask();
        dialog(context);
      },
      splashColor: Colors.yellowAccent,
      backgroundColor: Colors.lightGreen,
      label: Text('Submit'),
      icon: Icon(Icons.check_circle),
    );
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
        "Task Has Been Submitted",
        style: TextStyle(color: Colors.white),
      ),
      actions: <Widget>[
        FlatButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return new ManagerNavBar(user: null);
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

  void addTask() async {
    final uid = await getCurrentUID();
    return setState(() {
      Task task = new Task(
          title: title,
          description: description,
          assign: _valFriends,
          due: '$_submitDate',
          status: "Pending",
          userid: uid);
      dataService.createTask(task: task);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("ASSIGN TASK"),
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
                _buildSubjectBox(),
                _buildAssignTo(),
                _buildDescription(),
                _buildDueOnBox(),
                SizedBox(
                  height: 30,
                ),
                _buildSubmitButton(),
                SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ));
  }
}
