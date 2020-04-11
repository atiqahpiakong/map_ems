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
          ]
            ),
        ),
      ),
      )
    );
}
}