import 'package:emsproject/homescreen_admin.dart';
import 'package:flutter/material.dart';
import 'package:emsproject/services/user_data_service.dart';
import 'package:emsproject/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddEmployee extends StatefulWidget {
  @override
  _AddEmployeePageState createState() => _AddEmployeePageState();
}

class _AddEmployeePageState extends State<AddEmployee> {
  String name;
  String address;
  String department;
  String email;
  String phone;
  String id;

  final db = Firestore.instance;

  final _formKey = GlobalKey<FormState>();

  UserDataService dataService = UserDataService();

  Widget _greenColors() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Container(
          width: 2000,
          margin: const EdgeInsets.all(0),
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: ExactAssetImage('assets/img/profile.png'),
                    backgroundColor: Color(0xff3DBC93),
                    radius: 85,
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _name() {
    return Padding(
      padding: const EdgeInsets.only(top: 0, bottom: 10),
      child: new Container(
        width: 250,
        height: 50,
        decoration: new BoxDecoration(
          color: Color(0xffECECEC),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: new TextFormField(
          validator: (String value) {
            if (value.isEmpty) {
              return 'Enter employee name';
            }
            return null;
          },
          onChanged: (value) {
            setState(() => name = value);
          },
          decoration: new InputDecoration(
            hintText: "\t\tName",
            fillColor: Color(0xffECECEC),
            filled: true,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: BorderSide(color: Color(0xffECECEC))),
          ),
        ),
      ),
    );
  }

  Widget _contact() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Container(
        width: 250,
        height: 50,
        decoration: new BoxDecoration(
          color: Color(0xffECECEC),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: new TextFormField(
          validator: (String value) {
            if (value.isEmpty) {
              return 'Enter employee contact number';
            }
            return null;
          },
          onChanged: (value) {
            setState(() => phone = value);
          },
          decoration: new InputDecoration(
            hintText: " Contact Number ",
            fillColor: Color(0xffECECEC),
            filled: true,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: BorderSide(color: Color(0xffECECEC))),
          ),
        ),
      ),
    );
  }

  Widget _email() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Container(
        width: 250,
        height: 50,
        decoration: new BoxDecoration(
          color: Color(0xffECECEC),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: new TextFormField(
          validator: (String value) {
            if (value.isEmpty) {
              return 'Enter employee email';
            }
            return null;
          },
          onChanged: (value) {
            setState(() => email = value);
          },
          decoration: new InputDecoration(
            hintText: " Email ",
            fillColor: Color(0xffECECEC),
            filled: true,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: BorderSide(color: Color(0xffECECEC))),
          ),
        ),
      ),
    );
  }

  Widget _department() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Container(
        width: 250,
        height: 50,
        decoration: new BoxDecoration(
          color: Color(0xffECECEC),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: new TextFormField(
          validator: (String value) {
            if (value.isEmpty) {
              return 'Enter employee department';
            }
            return null;
          },
          onChanged: (value) {
            setState(() => department = value);
          },
          decoration: new InputDecoration(
            hintText: " Department ",
            fillColor: Color(0xffECECEC),
            filled: true,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: BorderSide(color: Color(0xffECECEC))),
          ),
        ),
      ),
    );
  }

  Widget _address() {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 20),
      child: new Container(
        width: 250,
        height: 50,
        decoration: new BoxDecoration(
          color: Color(0xffECECEC),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: new TextFormField(
          validator: (String value) {
            if (value.isEmpty) {
              return 'Enter employee address';
            }
            return null;
          },
          onChanged: (value) {
            setState(() => address = value);
          },
          decoration: new InputDecoration(
            hintText: " Address ",
            fillColor: Color(0xffECECEC),
            filled: true,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: BorderSide(color: Color(0xffECECEC))),
          ),
        ),
      ),
    );
  }

  void addEmp() async {
    return setState(() {
      User user = new User(
          name: name,
          phone: phone,
          email: email,
          department: department,
          address: address);

      dataService.createUser(user: user);
    });
  }

  Widget _buildSubmitButton() {
    return FloatingActionButton.extended(
      onPressed: () {
        addEmp();
        dialog(context);
      },
      splashColor: Colors.yellowAccent,
      backgroundColor: Colors.lightGreen,
      label: Text('Submit'),
      icon: Icon(Icons.check_circle),
    );
  }

  // final globalKey = GlobalKey<ScaffoldState>();
  // Employee emp = Employee();

  // final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("ADD EMPLOYEE"),
        backgroundColor: Color(0xff022264),

        //actions: <Widget>[IconButton(icon: Icon(Icons.edit, color: Colors.white),onPressed: (){},),],
      ),
      backgroundColor: Colors.blue[100],
      body: SingleChildScrollView(
        child: new Form(
          key: _formKey,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _greenColors(),
                _name(),
                _contact(),
                _email(),
                _department(),
                _address(),
                _buildSubmitButton(),
              ]),
        ),
      ),
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
        "Employee has been added!",
        style: TextStyle(color: Colors.white),
      ),
      actions: <Widget>[
        FlatButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return new AdminNavBar(user: null);
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
