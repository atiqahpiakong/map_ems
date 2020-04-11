import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class FormScreen extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<StatefulWidget> createState(){
    return FormScreenState();
  }

}
class FormScreenState extends State<FormScreen> {

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();







Widget build(BuildContext context){
    
    return Form(
      key: _formKey,
      child: Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap:() => FocusScope.of(context).unfocus(),
                  child: Stack(
          children: <Widget>[
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF7986CB),
                    Color(0xFF3F51B5),
                    Color(0xFF303F9F),
                    Color(0xFF1A237E),

                  ],
                  stops: [0.1, 0.4, 0.7, 0.9],
                ), 
              ),
            ),

Container(
              height: double.infinity,
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(
                  horizontal: 40.0,
                  vertical: 120.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Sign In',
                    style: TextStyle
                    (color: Colors.white, 
                    fontFamily: 'OpenSans', 
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    ),
                    ),
              SizedBox(height: 30.0),
              Column(
          crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Email',
                      style: TextStyle(
                        color: Colors.white, 
                        fontFamily: 'OpenSans',
                      )
                    
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration( color: Colors.transparent),
                      height: 60.0,
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsetsDirectional.only(top: 14.0),
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.white,
                          ),
                          hintText: 'Enter your Email',
                          hintStyle: TextStyle(color: Colors.white)
                        ),
                      ),
                    ),
                  ],
                  ),
              ],
              ),
              ),
          ),
          ]
            ),
        ),),
      ) 
      );
}

}