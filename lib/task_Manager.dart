import 'package:emsproject/model/myTask.dart';
import 'package:flutter/material.dart';
import 'package:emsproject/details_PendingTask.dart';
import 'package:emsproject/details_CompletedTask.dart';



class ManagerTaskPage extends StatefulWidget {
  ManagerTaskPage(this._task);

  final List _task;

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ManagerTaskPage> {
 

  @override
  Widget build(BuildContext context) {


    ListTile makeListTile(Task task) => ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 9.0, vertical: 7.0),
      leading: Container(
        padding: EdgeInsets.only(left: 20.0, right:0.0),
        child: CircleAvatar(
          backgroundImage: ExactAssetImage('assets/img/profile.png'),
          backgroundColor: Color(0xff3DBC93), 
          radius: 30, 
        ),
      ),
    
      subtitle: Column (
        crossAxisAlignment: CrossAxisAlignment.start,

        children: <Widget>[
          Text ("Due : " + task.due,
           style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),

          SizedBox(height:4,),
          
          Text ("Subject : " + task.subject, 
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),

          SizedBox(height:10,),

          SizedBox(
            height: 15.0,
            width: 80.0,

            child: Container(
              color: task.status == "Completed" ? Color(0xffB0EFCB) : Color(0xffEFB0C3),  
              child: Center(
                child:Text(task.status,
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
            builder: (context) => DetailCompletedTaskPage(task: task)));
     
    },
    );

    Card makeCard(Task task) => Card(
      elevation: 8.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),

      child: Container(
        decoration: BoxDecoration(color: Color(0xffECECEC)),
        child: makeListTile(task),
      ),
    );

    final makeBody = SingleChildScrollView(
      
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: widget._task.length,
        itemBuilder: (BuildContext context, int index) {
          return makeCard(widget._task[index]);
        },
      ),
    );

    final topAppBar = AppBar(
      elevation: 0,
      brightness: Brightness.light,
      iconTheme: IconThemeData(color: Colors.white),
      backgroundColor: Color(0xff022264),

      title: Text("ALL TASK",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
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
      body: makeBody,
      
    );
  }
}
