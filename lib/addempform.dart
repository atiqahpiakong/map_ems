import 'package:flutter/material.dart';
import 'model/employee.dart';

class AddEmployee extends StatefulWidget {
  @override
  _AddEmployeePageState createState() => _AddEmployeePageState();
}

class _AddEmployeePageState extends State<AddEmployee> {
  Widget _greenColors() {
    return Positioned(
      top: 0,
      child: Container(
        color: Color(0xff022264),
        //height: 205,
        width: MediaQuery.of(context).size.width,

        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: ExactAssetImage('assets/img/profile.png'),
                  backgroundColor: Color(0xff3DBC93),
                  radius: 55,
                )
              ],
            ),
            SizedBox(
              height: 35,
            ),
          ],
        ),
      ),
    );
  }

  Widget _name() {
    return new Container(
        width: MediaQuery.of(context).size.width * 0.88,
        margin: EdgeInsets.all(22),
        child: new Container(
          child: new Center(
              child: new Column(children: [
            new Padding(padding: EdgeInsets.only(top: 113.0)),
            new Padding(padding: EdgeInsets.only(top: 10.0)),
            new TextFormField(
              decoration: new InputDecoration(
                //labelText: " Enter Email",
                hintText: "\t\tName",
                fillColor: Color(0xffECECEC),
                filled: true,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(35.0),
                    borderSide: BorderSide(color: Color(0xffECECEC))),
              ),
              style: new TextStyle(
                fontFamily: "Poppins",
              ),
            ),
          ])),
        ));
  }

  Widget _contact() {
    return new Container(
        width: MediaQuery.of(context).size.width * 0.88,
        margin: EdgeInsets.all(22),
        child: new Container(
          child: new Center(
              child: new Column(children: [
            new Padding(padding: EdgeInsets.only(top: 180.0)),
            new Padding(padding: EdgeInsets.only(top: 10.0)),
            new TextFormField(
              decoration: new InputDecoration(
                //labelText: " Enter Email",
                hintText: "\t\tContact Number",
                fillColor: Color(0xffECECEC),
                filled: true,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(35.0),
                    borderSide: BorderSide(color: Color(0xffECECEC))),
              ),
              keyboardType: TextInputType.emailAddress,
              style: new TextStyle(
                fontFamily: "Poppins",
              ),
            ),
          ])),
        ));
  }

  Widget _email() {
    return new Container(
        width: MediaQuery.of(context).size.width * 0.88,
        margin: EdgeInsets.all(22),
        child: new Container(
          child: new Center(
              child: new Column(children: [
            new Padding(padding: EdgeInsets.only(top: 247.0)),
            new Padding(padding: EdgeInsets.only(top: 10.0)),
            new TextFormField(
              decoration: new InputDecoration(
                //labelText: " Enter Email",
                hintText: "\t\tEmail",
                fillColor: Color(0xffECECEC),
                filled: true,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(35.0),
                    borderSide: BorderSide(color: Color(0xffECECEC))),
              ),
              keyboardType: TextInputType.emailAddress,
              style: new TextStyle(
                fontFamily: "Poppins",
              ),

              //  validator: (String value) {
              //   if (value.isEmpty) {
              //     return 'Enter contact number';
              //   }
              //   return null;

              //  },

              //   onSaved: (String value) {
              //     emp.email = value;
              // },
            ),
          ])),
        ));
  }

  Widget _address() {
    return new Container(
        width: MediaQuery.of(context).size.width * 0.88,
        margin: EdgeInsets.all(22),
        child: new Container(
          child: new Center(
              child: new Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                new Padding(padding: EdgeInsets.only(top: 314.0)),
                new Padding(padding: EdgeInsets.only(top: 10.0)),
                new TextFormField(
                  decoration: new InputDecoration(
                    hintText: "\t\tAddress",
                    fillColor: Color(0xffECECEC),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(35.0),
                        borderSide: BorderSide(color: Color(0xffECECEC))),
                  ),

                  style: new TextStyle(
                    fontFamily: "Poppins",
                  ),

                  //   validator: (String value) {
                  //   if (value.isEmpty) {
                  //     return 'Enter contact number';
                  //   }
                  //   return null;
                  //   },

                  //   onSaved: (String value) {
                  //     emp.address = value;
                  // },
                ),
                SizedBox(
                  height: 15,
                ),

                new RaisedButton(
                  color: Colors.green,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'ADD',
                    style: TextStyle(color: Colors.white), 
                    
                  ),
                
                ),
                
              ])),
        ));
  }

  final globalKey = GlobalKey<ScaffoldState>();
 // Employee emp = Employee();

  // final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xff022264),

        title: Text(
          "ADD EMPLOYEE",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),

        centerTitle: true,

        //actions: <Widget>[IconButton(icon: Icon(Icons.edit, color: Colors.white),onPressed: (){},),],
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
            _greenColors(),
            _name(),
            _contact(),
            _email(),
            _address(),
          ],
        ),
      ),
    );
  }
}
