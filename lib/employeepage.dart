import 'package:flutter/material.dart';
import 'model/employee.dart';
import 'list_emp_details.dart';
import 'addempform.dart';

class EmpList extends StatefulWidget {
  EmpList(this._employee);

  final List _employee;
  // final String title;

  @override
  _EmpListState createState() => _EmpListState();
}

class _EmpListState extends State<EmpList> {
  List<Employee> data;

  @override
  Widget build(BuildContext context) {
    
    data = widget._employee.where(
                     (emp) => (emp.available.contains("yes"))).toList();

    
    ListTile makeListTile(Employee emp) => ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 13.0, vertical: 7.0),

          leading: Container(
            padding: EdgeInsets.only(left: 30.0, right: 0.0),
            child: CircleAvatar(
              backgroundImage: ExactAssetImage('assets/img/profile.png'),
              backgroundColor: Color(0xff3DBC93),
              radius: 30,
            ),
          ),
           trailing: IconButton(
            icon: Icon(Icons.delete, color: Colors.redAccent,), 
            onPressed: (){
              setState(() => emp.available = "no");
            }
            
            )
          ,

          title: Text(
            emp.name,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
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
                    emp.dept,
                    style: TextStyle(color: Colors.black, fontSize: 12.0),
                  ),
                ),
              ),
            ],
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => EmployeeProfile(emp: emp)));
          },
        );

    Card makeCard(Employee emp) => Card(
          elevation: 6.0,
          margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          child: Container(
            decoration: BoxDecoration(color: Color(0xffECECEC)),
            child: makeListTile(emp),
          ),
        );

    final makeBody = Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          return makeCard(data[index]);
        },
      ),
    );

    final topAppBar = AppBar(
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
            Navigator.of(context)
                .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
              return AddEmployee();
            }));
          },
        ),
      ],
      centerTitle: true,
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: topAppBar,
      body: makeBody,
    );
  }
}