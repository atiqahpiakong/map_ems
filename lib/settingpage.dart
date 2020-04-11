import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingsOnePage extends StatefulWidget {
  //static final String path = *lib\main.dart*;

  @override
  _SettingsOnePageState createState() => _SettingsOnePageState();
}

class _SettingsOnePageState extends State<SettingsOnePage> {
  final globalKey = GlobalKey<ScaffoldState>();

  bool switch1 = false;
  bool switch2 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text(
          'Settings',
          style: TextStyle(color: Colors.black),
        ),
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
                        "Atiqah Piakong",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      leading: CircleAvatar(
                        backgroundColor: Colors.orange.shade800,
                        child: Text('AP'),
                      )),
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
                    ListTile(
                        leading: Icon(
                          Icons.help,
                          color: Colors.blue[800],
                        ),
                        title: Text("Help"),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: () {
                          //open help
                        })
                  ]),
                ),
                const SizedBox(height: 30.0),
                Text('NOTIFICATION SETTING',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo,
                    )),
                SwitchListTile(
                    //dense: true,
                    activeColor: Colors.blue[800],
                    contentPadding: const EdgeInsets.all(0),
                    value: false,
                    title: Text(
                      "Receive Notification",
                    ),
                    onChanged: (val1) {
                      setState(() {
                        switch1 = val1;
                        if (val1 == true) {
                          print(switch1);
                          final snackBar = SnackBar(
                              content: Text('Receive Notifications Enabled'),
                               duration: Duration(seconds: 2));
                          globalKey.currentState.showSnackBar(snackBar);
                        } else {
                          final snackBar = SnackBar(
                              content: Text('Receive Notifications Disabled'),
                              duration: Duration(seconds: 2));
                          globalKey.currentState.showSnackBar(snackBar);

                        }
                        //print(bal);
                      });
                      //action
                    }),
                SwitchListTile(
                    //dense: true,
                    activeColor: Colors.blue[800],
                    contentPadding: const EdgeInsets.all(0),
                    value: false,
                    title: Text("Receive Email Notifications"),
                    onChanged: (val2) {
                      //action
                    }),
                SwitchListTile(
                    //dense: true,
                    activeColor: Colors.blue[800],
                    contentPadding: const EdgeInsets.all(0),
                    value: true,
                    title: Text("Received App Updates"),
                    onChanged: null),
                const SizedBox(height: 60.0),
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
