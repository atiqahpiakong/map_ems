import 'package:emsproject/home_screen.dart';
import 'package:emsproject/model/task_model.dart';
import 'package:flutter/material.dart';
import './services/task_data_service.dart';
import 'menu.dart';

class DetailPendingTaskPage extends StatefulWidget {
  final Task task;
  static const deviceTypes = ["Completed", "Pending"];
  DetailPendingTaskPage({ this.task});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPendingTaskPage> {
final dataService = TaskDataService();
  var currentSelectedValue;
  var noteTemp;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: true,
        backgroundColor: Colors.blue[100],
        appBar: AppBar(
          elevation: 0,
          brightness: Brightness.light,
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Color(0xff022264),
          title: Text(
            widget.task.title,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 10.0,
                margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 70),
                child: new Container(
                  child: new Container(
                    width: 60,
                    padding: EdgeInsets.all(20.0),
                    decoration: new BoxDecoration(
                      color: Color(0xffECECEC),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: new Text(
                        "Assign To: " +
                            widget.task.assign +
                            "\n" +
                        "Due: " +
                            widget.task.due +
                            "\n" +
                            "Title: " +
                            widget.task.title +
                            "\n" + "Description: " +
                            widget.task.description,
                        style: TextStyle(
                            color: Colors.black, height: 1.4, fontSize: 15.5)),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 10.0,
                margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 10),
                child: new Container(
                  child: new Container(
                    width: 60,
                    padding: EdgeInsets.all(20.0),
                    decoration: new BoxDecoration(
                      color: Color(0xffECECEC),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        hint: Text("Status : " + widget.task.status,
                            style: TextStyle(
                              color: Colors.black,
                            )),
                        value: widget.task.status,
                        isDense: true,
                        items: DetailPendingTaskPage.deviceTypes
                            .map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: new Text(value),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          widget.task.status = newValue;
                          setState(() => widget.task.status);
                        },
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 1),
                padding: EdgeInsets.only(left: 20.0, right: 20, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      onPressed: () async {
                        Task updatedTask = await dataService.updateTask(id: widget.task.id, status: widget.task.status);
                        setState(() => widget.task.status  = updatedTask.status);

                        dialog(context);
                      },
                      textColor: Colors.white,
                      color: Colors.green,
                      padding: const EdgeInsets.all(10.0),
                      child: new Text("SAVE"),
                    ),
                    SizedBox(
                      width: 10,
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
              )
            ],
          ),
        ));
  }

  void dialog(BuildContext context) {
    var alertDialog = AlertDialog(
      backgroundColor: Color.fromRGBO(40, 20, 40, 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      title: Text(
        "Success",
        style: TextStyle(color: Colors.white),
      ),
      content: Text(
        "Task is Completed!",
        style: TextStyle(color: Colors.white),
      ),
      actions: <Widget>[
        FlatButton(
            onPressed: () {
              // Navigator.of(context).pop();
               
      
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return new BottomNavBar(user:null);
              }));
            
   
            },
            child: Text("OK"))
      ],
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }
}
