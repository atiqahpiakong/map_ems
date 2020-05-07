import 'package:emsproject/model/myLeave.dart';
import 'package:emsproject/model/Leave.dart';
import 'package:flutter/material.dart';


class LeavePage extends StatefulWidget {
  LeavePage(this._leave);
  final List _leave;
  
  

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<LeavePage> {
 
  @override
  Widget build(BuildContext context) {
    
    ListTile makeListTile(Leave leave) => ListTile(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 9.0, vertical: 7.0),
          leading: Container(
            padding: EdgeInsets.only(left: 20.0, right:0.0),
            
            child: CircleAvatar(
                   backgroundImage: ExactAssetImage('assets/profile.png'),
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
          
         // onTap: () => alertDialog(context, leave),
          onTap: () {
          if(leave.status =="Pending")
          {
            alertDialog(context, leave);
          }
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
        itemCount: widget._leave.length,
        itemBuilder: (BuildContext context, int index) {
          
          return makeCard(widget._leave[index]);
        },
        
      ),
    );

    final topAppBar = AppBar(
      elevation: 0,
      brightness: Brightness.light,
      iconTheme: IconThemeData(color: Colors.white),
      backgroundColor: Color(0xff022264),
          
      title: Text(
          "LEAVE LIST",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      
      centerTitle: true,
    );

    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: topAppBar,
      body: makeBody,
    );
  }

  alertDialog(BuildContext context, Leave leave) {

  AlertDialog alert = AlertDialog(

    content:Container(
      height:160 ,
      child:Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CircleAvatar(
            backgroundImage: ExactAssetImage('assets/profile.png'),
            backgroundColor: Color(0xff3DBC93), 
            radius: 30, 
          ),
          SizedBox(width: 12,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:<Widget> [
              Text(leave.name,
              style: TextStyle( height: 1.8,fontSize: 18, fontWeight:FontWeight.bold)),
              Text(leave.dateFrom + " - " +leave.dateFrom +"\nType: "+leave.type +"\nReason: "+ leave.reason,
              style: TextStyle( height: 1.4, fontSize: 15,fontWeight:FontWeight.bold)),
          Row(
            children:<Widget> [
              RaisedButton(
                child: new Text("Approve"),
                color: Color(0xffB0EFCB),
                onPressed:  () {
                  setState(() => leave.status = "Approved");
                  Navigator.of(context).pop();
                },
              ),
              SizedBox(width:10),
              RaisedButton(
              child: new Text("Reject"),
              color: Color(0xffEFB0C3),
              onPressed:  () {
                setState(() => leave.status = "Rejected");
                Navigator.of(context).pop();
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
}
