import 'package:emsproject/model/myLeave.dart';
import 'package:flutter/material.dart';
import 'package:emsproject/details_myLeave.dart';



class MyLeavePage extends StatefulWidget {
 MyLeavePage(this._leave);

  final List _leave;

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<MyLeavePage> {
 List<Leave> filter;

 

  @override
  Widget build(BuildContext context) {

    filter = widget._leave.where(
                     (leave) => (leave.name.contains("Nurul Atiqah"))).toList();
    
    ListTile makeListTile(Leave leave) => ListTile(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 9.0, vertical: 7.0),
          leading: Container(
            padding: EdgeInsets.only(left: 20.0, right:0.0),
            
            child: CircleAvatar(
                   backgroundImage: ExactAssetImage('assets/img/profile.png'),
                   backgroundColor: Color(0xff3DBC93), 
                    radius: 30,
              ),
          ),

          title: Center(
            child: Text(
            leave.dateFrom + " - "+leave.dateTo,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          ),
         
          subtitle: Column (
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
        
            SizedBox(
              height:10,
            ),

            SizedBox(
              height: 15.0,
              width: 80.0,  

              child: Container(
                color: leave.status == "Approved" ? Color(0xffB0EFCB) : leave.status == "Rejected" ? Color(0xffEFB0C3) : Color(0xff87CEEB), 
                child: Center(
                  child:Text(
                    leave.status,
                    style: TextStyle(color: Colors.black, fontSize: 12.0),
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
                    builder: (context) => DetailMyLeave(leave: leave)));
          },
    );

    Card makeCard(Leave leave) => Card(
          elevation: 6.0,
          margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          child: Container(
            decoration: BoxDecoration(color: Color(0xffECECEC)),
            child: makeListTile(leave),
          ),
    );

    final makeBody = SingleChildScrollView(
      
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: filter.length,
        itemBuilder: (BuildContext context, int index) {
          return makeCard(filter[index]);
        },
      ),
    );

    final topAppBar = AppBar(
      elevation: 0,
      brightness: Brightness.light,
      iconTheme: IconThemeData(color: Colors.white),
      backgroundColor: Color(0xff022264),
          
      title: Text(
          "MY LEAVE",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      actions: <Widget>[
          IconButton(icon: Icon(Icons.add_circle_outline ,color: Colors.white, size:30),onPressed: (){
          Navigator.of(context)
                .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
              return null;
            }));

        },),],
      centerTitle: true,
    );

    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: topAppBar,
      body:makeBody,
    );
  }
}

