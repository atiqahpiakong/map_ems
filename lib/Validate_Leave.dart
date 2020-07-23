//import 'package:emsproject/model/myLeave.dart';
import 'package:emsproject/model/leave_model.dart';
import 'package:flutter/material.dart';
import './services/leave_data_service.dart';
class LeavePage extends StatefulWidget {


  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<LeavePage> {
  List<Leave> _leaves;
  final dataService = LeaveDataService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Leave>>(
        future: dataService.getAllLeave(),
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
          "LEAVE LIST",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: _leaves.length,
          itemBuilder: (BuildContext context, int index) {
            Leave leave = _leaves[index];
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

                    title: Center(
                      child: Text(
                        '${leave.name}' +"\n" +
                        '${leave.leavefrom} to ${leave.leaveto}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
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
                                '${leave.status}',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 12.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    // onTap: () => alertDialog(context, leave),
                    onTap: () {
                      if (leave.status == "Pending") {
                        alertDialog(context, leave);
                      }
                    },
                  )),
            );
          },
        ),
      ),
    );
  }

  alertDialog(BuildContext context, Leave leave) {
    AlertDialog alert = AlertDialog(
      content: Container(
         height: 180,
        // //width: 50,
         padding: EdgeInsets.only(left:10, right:10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          
          children: <Widget>[
          
            CircleAvatar(
              backgroundImage: ExactAssetImage('assets/img/profile.png'),
              backgroundColor: Color(0xff3DBC93),
              radius: 30,
            ),
            SizedBox(
              width: 12,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('${leave.name}',
                    style: TextStyle(
                        height: 1.8,
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
                Text(
                    '${leave.leavefrom}\n' +
                        " - " +
                        '${leave.leaveto}' +
                        "\nType: " +
                        '${leave.type}' +
                        "\nReason: " +
                        '${leave.reason}',
                    style: TextStyle(
                        height: 1.4,
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
                Row(
                  children: <Widget>[
                    RaisedButton(
                      child: new Text("Approve"),
                      color: Color(0xffB0EFCB),
                      onPressed: () async{

                         Leave updatedLeave = await dataService.updateLeave(id: leave.id, status: "Approved");
                        setState(() => leave.status  = updatedLeave.status);
                        
                        Navigator.of(context).pop();
                      },

                    ),
                    SizedBox(width: 4),
                    RaisedButton(
                      child: new Text("Reject"),
                      color: Color(0xffEFB0C3),
                    
                      onPressed: ()async {

                        // Leave updatedLeave = await dataService.updateLeave(id: leave.id, status: "Rejected");
                        // setState(() => leave.status  = updatedLeave.status);
                        // Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
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
}