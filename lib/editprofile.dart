import 'package:flutter/material.dart';


class EditProfile extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<EditProfile> {

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
    return new Container (
                width: MediaQuery.of(context).size.width * 0.88,
                margin: EdgeInsets.all(22),
                child: new Container(
                  
                  child: new Center(
                    child: new Column(
                     children : [
                       new Padding(padding: EdgeInsets.only(top: 113.0)),
                       
                       new Padding(padding: EdgeInsets.only(top: 10.0)),
                       new TextFormField(
                         
                      decoration: new InputDecoration(
                        //labelText: " Enter Email",
                        hintText: "\t\tSiti Nabilah ",
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
                     ]
                    )
                 ),
            )
            );
  }

   Widget _contact() {
    return new Container (
                width: MediaQuery.of(context).size.width * 0.88,
                margin: EdgeInsets.all(22),
                child: new Container(
                  
                  child: new Center(
                    child: new Column(
                     children : [
                       new Padding(padding: EdgeInsets.only(top: 180.0)),
                       
                       new Padding(padding: EdgeInsets.only(top: 10.0)),
                       new TextFormField(
                         
                      decoration: new InputDecoration(
                        //labelText: " Enter Email",
                        hintText: "\t\t012-3456789",
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
                     ]
                    )
                 ),
            )
            );
  }
}