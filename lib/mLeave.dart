//import 'package:emsproject/model/myLeave.dart';
import 'package:flutter/material.dart';
import 'package:emsproject/details_myLeave.dart';
import 'leaveform.dart';

import 'package:emsproject/model/leave_model.dart';
import './services/leave_data_service.dart';

class MyLeavePage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<MyLeavePage> {
  List<Leave> _leaves;
  final dataService = LeaveDataService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Leave>>(
        future: dataService.getMyLeave(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            _leaves = snapshot.data;
            return _buildMainScreen(snapshot);
          }
          return _buildFetchingDataScreen();
        });
  }

  Scaffold _buildMainScreen(snapshot) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xff022264),
        title: Text(
          "MY LEAVE",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add_circle_outline, color: Colors.white, size: 30),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LeaveFormPage()));
            },
          ),
        ],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: _leaves.length,
          itemBuilder: (BuildContext context, int index) {
           Leave leave = snapshot.data[index];
            return Card(
              elevation: 6.0,
              margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
              child: Container(
                  decoration: BoxDecoration(color: Color(0xffECECEC)),
                  child: ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 9.0, vertical: 7.0),
                    leading: Container(
                      padding: EdgeInsets.only(left: 20.0, right: 0.0),
                      child: CircleAvatar(
                        backgroundImage:
                            ExactAssetImage('assets/img/profile.png'),
                        backgroundColor: Color(0xff3DBC93),
                        radius: 30,
                      ),
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: Colors.redAccent,
                      ),
                      onPressed: () => navigateOnPress(snapshot, index, leave),
                    ),
                    title: Center(
                      child: Text(
                          "(" + leave.leavefrom + ") - (" + leave.leaveto + ")",
                          // leave.leavefrom + " -> " + leave.leaveto ,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14.0)),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 15.0,
                          width: 80.0,
                          child: Container(
                            color: leave.status == "Approved"
                                ? Color(0xffB0EFCB)
                                : leave.status == "Rejected"
                                    ? Color(0xffEFB0C3)
                                    : Color(0xff87CEEB),
                            child: Center(
                              child: Text(
                                leave.status,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 12.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  DetailMyLeave(leave: leave)));
                    },
                  )),
            );
          },
        ),
      ),
    );
  }

  Scaffold _buildFetchingDataScreen() {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(),
            SizedBox(height: 50),
            Text('Fetching data... Please wait'),
          ],
        ),
      ),
    );
  }

  void navigateOnPress(snapshot, int index, Leave _leaves) {
    return setState(() {
      snapshot.data.removeAt(index);
      dataService.deleteLeave(id: _leaves.id);
    });
  }
}
