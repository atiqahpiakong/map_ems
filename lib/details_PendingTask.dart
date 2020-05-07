import 'package:emsproject/model/myTask.dart';
import 'package:flutter/material.dart';

class DetailPendingTaskPage extends StatefulWidget {
  final Task task;
  static const deviceTypes = ["Completed", "Pending"];
  DetailPendingTaskPage({Key key, this.task}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPendingTaskPage> {
  var currentSelectedValue;
  var noteTemp;

  @override
  Widget build(BuildContext context) {

    final details = Container(
      width: MediaQuery.of(context).size.width * 10.0,
      margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 70),

      child: new Container(
          child: new Container(
            width:60,
            padding: EdgeInsets.all(20.0),
            decoration: new BoxDecoration(
              color: Color(0xffECECEC),
              borderRadius: BorderRadius.circular(15.0),
            ),
            
            child: new Text("Due: "+ widget.task.due + "\n" + widget.task.subject + "\n" + widget.task.description,
                        style: TextStyle(color : Colors.black, height: 1.4, fontSize:15.5 )),
          ),
      ),
    );

    final action = Container(
      width: MediaQuery.of(context).size.width * 10.0,
      margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 10),

      child: new Container(
          child: new Container(
            width:60,
            padding: EdgeInsets.all(20.0),
            decoration: new BoxDecoration(
              color: Color(0xffECECEC),
              borderRadius: BorderRadius.circular(15.0),
            ),
            
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                hint: Text("Status : " + widget.task.status,
                        style: TextStyle(color : Colors.black,)
                ),
                value: currentSelectedValue,
                isDense: true,
                items: DetailPendingTaskPage.deviceTypes.map((String value) {
                 return DropdownMenuItem<String>(
                    value: value,
                    child: new Text(value),
                 );
                }).toList(),
                onChanged: (newValue) {
                currentSelectedValue = newValue;
                setState(() => currentSelectedValue);
                },
              ),
            ),
          ),
      ),
    );

    final note = Container(
      width: MediaQuery.of(context).size.width * 90.0,
      margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 1),
      padding: EdgeInsets.only(left:20.0, right:20, top: 10),

          child:new TextFormField(        
            textInputAction: TextInputAction.done, 
            decoration: new InputDecoration(
              //labelText: " Enter Email",
              hintStyle: TextStyle(color: Colors.black),
              hintText:"  Note :"+ widget.task.note,
              fillColor: Color(0xffECECEC),
              filled: true,
              enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide(color: Color(0xffECECEC))),
            ),
            onChanged: (hintText) {
                setState(() => noteTemp = hintText);},
          ),
    );

    final save = Container(   
      margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 1),
      padding: EdgeInsets.only(left:20.0, right:20, top: 10),

        child:Row( 
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pop(widget.task);
                if(currentSelectedValue !=null)
                {
                  setState(() => widget.task.status = currentSelectedValue);
                }
                if(noteTemp !=null)
                {
                  setState(() => widget.task.note = noteTemp);
                }
              },
              textColor: Colors.white,
              color: Colors.green,
              padding: const EdgeInsets.all(10.0),
              child: new Text("SAVE"),
            ),

            SizedBox(
              width:10,
            ),

            RaisedButton(
              onPressed: () {
                Navigator.of(context).pop(null);
              },
              textColor: Colors.white,
              color: Colors.red,
              padding: const EdgeInsets.all(10.0),
              child: new Text("CANCEL"),
            ),
          ],
        ),
    );
     
    final topAppBar = AppBar(
      elevation: 0,
      brightness: Brightness.light,
      iconTheme: IconThemeData(color: Colors.white),
      backgroundColor: Color(0xff022264),
      
      title: Text(
        widget.task.subject,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
    );
  
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      backgroundColor: Colors.blue[100],
      appBar: topAppBar,
      body: SingleChildScrollView(
        child:Column(
        children: <Widget>[details, action, note, save],
      ),
      )

    );
  }
}
