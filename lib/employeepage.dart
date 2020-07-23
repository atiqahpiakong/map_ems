import 'package:emsproject/services/user_data_service.dart';
import 'package:flutter/material.dart';
//import 'model/employee.dart';
import 'list_emp_details.dart';
import 'addempform.dart';
import 'model/user_model.dart';

class EmpList extends StatefulWidget {
  // EmpList(this._employee);

  // final List _employee;
  // final String title;

  @override
  _EmpListState createState() => _EmpListState();
}

class _EmpListState extends State<EmpList> {
  List<User> _user;
  final dataService = UserDataService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<User>>(
        future: dataService.getAllUser(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            _user = snapshot.data;
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
          "LIST OF EMPLOYEE",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add_circle_outline, color: Colors.white, size: 30),
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute<Null>(builder: (BuildContext context) {
                return AddEmployee();
              }));
            },
          ),
        ],
        centerTitle: true,
      ),
      body: Container(
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: _user.length,
          itemBuilder: (BuildContext context, int index) {
            User user = snapshot.data[index];
            return Card(
              elevation: 6.0,
              margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
              child: Container(
                decoration: BoxDecoration(color: Color(0xffECECEC)),
                child: ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 13.0, vertical: 7.0),
                  leading: Container(
                    padding: EdgeInsets.only(left: 30.0, right: 0.0),
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
                    onPressed: () {
                      
                    },
                  ),
                  title: Text(
                    '${user.name}',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 15.0,
                        width: 300.0,
                        child: Container(
                          child: Text(
                            '${user.department}',
                            style:
                                TextStyle(color: Colors.black, fontSize: 12.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EmployeeProfile(user: user)));
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
