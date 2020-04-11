import 'package:flutter/material.dart';


class Notification1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
 backgroundColor: Color(0xffECECEC),
        appBar: AppBar(),

        //body for notification
 body: ListView(
          children: <Widget>[
            ListTile(
              title: Text(
                'Leave Application Status',
              ),
              subtitle: Text('Leave ID: #123 | Status: Approved'),
              onTap: () {
                Text('Another data');
              },
            ),
            new Divider(
              height: 1.0,
              indent: 1.0,
            ),
          ListTile(
              title: Text('You have one new task'),
              subtitle: Text('Task: Employee Report, assigned by Ahmad'),
              onTap: () {
                Text('Another data');
              },
              onLongPress: () {
                Text('Data');
              },
            ),
            new Divider(
              height: 1.0,
              indent: 1.0,
            ),
          ],
        ),

    );}}
