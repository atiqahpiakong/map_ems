import 'dart:ui';
import 'package:flutter/material.dart';


class SettingsOnePage extends StatelessWidget {
  //static final String path = lib\main.dart;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text('Settings', style: TextStyle(color: Colors.black),),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          SingleChildScrollView(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

        
            ),

          ),
        ], 
      ),
    );

  

}
