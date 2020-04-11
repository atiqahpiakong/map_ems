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

  Widget _email() {
      return new Container (
                width: MediaQuery.of(context).size.width * 0.88,
                margin: EdgeInsets.all(22),
                child: new Container(
                  
                  child: new Center(
                    child: new Column(
                     children : [
                       new Padding(padding: EdgeInsets.only(top: 247.0)),
                       
                       new Padding(padding: EdgeInsets.only(top: 10.0)),
                       new TextFormField(
                         
                      decoration: new InputDecoration(
                        //labelText: " Enter Email",
                        hintText: "\t\tsitinabilah0123@gmail.com",
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

  Widget _address() {
      return new Container (
                width: MediaQuery.of(context).size.width * 0.88,
                
                margin: EdgeInsets.all(22),
                child: new Container(
                  
                  child: new Center(
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children : [
                       new Padding(padding: EdgeInsets.only(top: 314.0)),
                       
                       new Padding(padding: EdgeInsets.only(top: 10.0)),
                       new TextFormField(
                         
                      decoration: new InputDecoration(
                        //labelText: " Enter Email",
                        hintText: "\t\tNo.20 Taman Sri Pinang, Parit Mesjid Pontian Johor",
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

                     SizedBox(
                        height: 15,
                    ),

                    new RaisedButton(
                    onPressed: () {
                           final snackBar = SnackBar(
                              content: Text('Profile has been updated'),
                              duration: Duration(seconds: 2));
                          globalKey.currentState.showSnackBar(snackBar);

          },
                    textColor: Colors.white,
                    color: Colors.green,
                    padding: const EdgeInsets.all(8.0),
                    child: new Text(
                      "UPDATE",
                    ),
                  ),
                 
            
                     ]
                    )
                    
                    
                
                 ),
            )
            );
  }

 
}