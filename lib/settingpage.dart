import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


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
              children: <Widget>[
                Card(
                    elevation: 8.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    //margin: const EdgeInsets.all(32.0),
                    color: Colors.blue[800],

                child: ListTile(
                      onTap: () {
                        //open edit profile
                      },
                      title: Text(
                        "John Doe",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      leading: CircleAvatar(
                        backgroundColor: Colors.orange.shade800,
                        child: Text('AH'),
                  )

                      ),
                      //trailing: Icon(Icons.edit, color: Colors.white,),
                    
        
            ),

                const SizedBox(height: 10.0),
                Card(
                  elevation: 6.0,
                  margin: const EdgeInsets.fromLTRB(32.0, 8.0, 32.0, 16.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                    child: Column(children: <Widget>[
                    ListTile(
                        leading: Icon(
                          Icons.lock_outline,
                          color: Colors.blue[800],
                        ),
                        title: Text("Change Password"),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: () {
                          //change password
                        }),

                        _buildDivider(),
                        ListTile(
                        leading: Icon(
                          FontAwesomeIcons.language,
                          color: Colors.blue[800],
                        ),
                        title: Text("Change Language"),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: () {
                          //open change language
                        }),
                        _buildDivider(),
                    
                   
                  ]),
                ),


              ],
          ),
          )
        ],
      ),
    
    );

  

}
Container _buildDivider() {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      width: double.infinity,
      height: 1.0,
      color: Colors.grey.shade600,
    );
  }

}