import 'package:flutter/material.dart';
import 'package:emsproject/details_PendingTask.dart';
import 'package:emsproject/details_CompletedTask.dart';

import 'package:emsproject/model/task_model.dart';
import './services/task_data_service.dart';

class MyTaskPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<MyTaskPage> {
  List<Task> _tasks;
  final dataService = TaskDataService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Task>>(
        future: dataService.getMyTask(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            _tasks = snapshot.data;
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
          "MY TASK",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: _tasks.length,
          itemBuilder: (BuildContext context, int index) {
            
            return Card(
              elevation: 8.0,
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
                   
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Due : ${task.due}",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 4,
                      ),
                      Text("Subject : ${task.title}",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 15.0,
                        width: 80.0,
                        child: Container(
                          color: task.status == "Completed"
                              ? Color(0xffB0EFCB)
                              : Color(0xffEFB0C3),
                          child: Center(
                            child: Text(
                              '${task.status}',
                              style: TextStyle(
                                  color: Colors.black, fontSize: 12.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    if (task.status == "Completed") {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  DetailCompletedTaskPage(task: task)));
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  DetailPendingTaskPage(task: task)));
                    }
                  },
                ),
              ),
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


}
