import 'package:flutter/material.dart';
import 'model/employee.dart';

class EmployeeProfile extends StatefulWidget {
  final Employee emp;

  EmployeeProfile({Key key, this.emp}) : super(key: key);

  @override
  _EmployeeProfileState createState() => _EmployeeProfileState();
}

class _EmployeeProfileState extends State<EmployeeProfile> {
  var currentSelectedValue;

  @override
  Widget build(BuildContext context) {

    final pics = Container(

        padding: EdgeInsets.only(top: 20.0),
        child: CircleAvatar(
          backgroundImage: ExactAssetImage('assets/img/profile.png'),
          backgroundColor: Color(0xff3DBC93),
          radius: 50,
        ));
    
    final name = Container(
      width: MediaQuery.of(context).size.width * 10.0,
      margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 30),
      child: new Container(
        width: 60,
        padding: EdgeInsets.all(20.0),
        decoration: new BoxDecoration(
          color: Color(0xffECECEC),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: new RichText(
          
          text: TextSpan(
            //style: DefaultTextStyle.of(context).style,
            children: <TextSpan>[
              TextSpan(
                text: "Employee Name: ",
                style: TextStyle(color: Color(0xFF000000), height: 1.4, fontWeight: FontWeight.bold),

              ),

              TextSpan(
                text: widget.emp.name,
                style: TextStyle(color: Color(0xFF000000), height: 1.4)

              )

            ],


          
      ),
    )
    )
    );

    final dept = Container(
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
         child: new RichText(
          
          text: TextSpan(
            //style: DefaultTextStyle.of(context).style,
            children: <TextSpan>[
              TextSpan(
                text: "Department: ",
                style: TextStyle(color: Color(0xFF000000), height: 1.4, fontWeight: FontWeight.bold),

              ),

              TextSpan(
                text: widget.emp.dept,
                style: TextStyle(color: Color(0xFF000000), height: 1.4)

              )

            ],


          
      ),
    )
      ),
    );

    final email = Container(
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
         child: new RichText(
          
          text: TextSpan(
            //style: DefaultTextStyle.of(context).style,
            children: <TextSpan>[
              TextSpan(
                text: "Email: ",
                style: TextStyle(color: Color(0xFF000000), height: 1.4, fontWeight: FontWeight.bold),

              ),

              TextSpan(
                text: widget.emp.email,
                style: TextStyle(color: Color(0xFF000000), height: 1.4)

              )

            ],


          
      ),
    )
      ),
    );

    final contact = Container(
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
        child: new RichText(
          
          text: TextSpan(
            //style: DefaultTextStyle.of(context).style,
            children: <TextSpan>[
              TextSpan(
                text: "Contact Number: ",
                style: TextStyle(color: Color(0xFF000000), height: 1.4, fontWeight: FontWeight.bold),

              ),

              TextSpan(
                text: widget.emp.contact,
                style: TextStyle(color: Color(0xFF000000), height: 1.4)

              )

            ],


          
      ),
    )
      ),
    );

    final address = Container(
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
        child: new RichText(
          
          text: TextSpan(
            //style: DefaultTextStyle.of(context).style,
            children: <TextSpan>[
              TextSpan(
                text: "Address: ",
                style: TextStyle(color: Color(0xFF000000), height: 1.4, fontWeight: FontWeight.bold),

              ),

              TextSpan(
                text: widget.emp.address,
                style: TextStyle(color: Color(0xFF000000), height: 1.4)

              )

            ],


          
      ),
    )
      ),
    );

    final topAppBar = AppBar(
      elevation: 0,
      brightness: Brightness.light,
      iconTheme: IconThemeData(color: Colors.white),
      backgroundColor: Color(0xff022264),
      title: Text(
        "Employee Details",
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
    );

     return Scaffold(
        resizeToAvoidBottomPadding: true,
        backgroundColor: Colors.white,
        appBar: topAppBar,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[pics, name, dept, email, contact, address],
          ),
        ));
  }
}
