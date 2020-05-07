import 'package:emsproject/model/myTask.dart';
import 'package:flutter/material.dart';

class DetailCompletedTaskPage extends StatefulWidget {
  final Task task;
  
  DetailCompletedTaskPage({Key key, this.task}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailCompletedTaskPage> {
  var currentSelectedValue;
  
  @override
  Widget build(BuildContext context) {
  
    final details = Container(
      width: MediaQuery.of(context).size.width * 10.0,
      margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 70),

   
          child: new Container(
            width:60,
            padding: EdgeInsets.all(20.0),
            decoration: new BoxDecoration(
              color: Color(0xffECECEC),
              borderRadius: BorderRadius.circular(15.0),
            ),
            
            child: new Text("Due: "+widget.task.due + "\n" + widget.task.subject + "\n" + widget.task.description,
            style: TextStyle(
              color : Colors.black,
              height: 1.4 //You can set your custom height here
            )
            ),
        ),
    );

    final action = Container(
      width: MediaQuery.of(context).size.width * 10.0,
      margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 10),

          child: new Container(
            width:60,
            padding: EdgeInsets.all(20.0),
            decoration: new BoxDecoration(
              color: Color(0xffECECEC),
              borderRadius: BorderRadius.circular(15.0),
            ),
            
            child: new Text("Status: "+widget.task.status,
            style: TextStyle(color : Colors.black, height: 1.4)),
          ),
    );

    final note = Container(
         
      width: MediaQuery.of(context).size.width * 90.0,
      margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 1),
      padding: EdgeInsets.only(left:20.0, right:20, top: 10),
 
        child: new Container(
          width:60,
          padding: EdgeInsets.all(20.0),
          decoration: new BoxDecoration(
            color: Color(0xffECECEC),
            borderRadius: BorderRadius.circular(15.0),
          ),  
          child: new Text("Note: "+widget.task.note,
            style: TextStyle(color : Colors.black,height: 1.4)),
          ),
    );

    final topAppBar = AppBar(
      elevation: 0,
      brightness: Brightness.light,
      iconTheme: IconThemeData(color: Colors.white),
      backgroundColor: Color(0xff022264),
      
      title: Text(
          widget.task.subject,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        centerTitle: true,
    );
    
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      backgroundColor: Colors.blue[100],
      appBar: topAppBar,
      body: SingleChildScrollView(
        child:Column(
        children: <Widget>[details, action, note],
      ),
      )
    );
  }
}
