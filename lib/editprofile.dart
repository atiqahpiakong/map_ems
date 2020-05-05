import 'package:flutter/material.dart';
import 'package:emsproject/model/employee.dart';


class EditProfile extends StatefulWidget {
  final Employee emp;
  EditProfile(this.emp);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<EditProfile> {

  
  var nameTemp;
  var contactTemp;
  var emailTemp;
  var addressTemp;

  Widget _greenColors() {
    return Positioned(
      top: 0,
      child: Container(
        color: Color(0xff022264),
        //height: 205,
        width: MediaQuery.of(context).size.width,

        padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                 CircleAvatar(
                   backgroundImage: ExactAssetImage('assets/img/profile.png'),
                   backgroundColor: Color(0xff3DBC93), 
                    radius: 60,
                  
                )
                                  
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                  widget.emp.name, textAlign: TextAlign.center,
                  
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                   
                  ),
                ),
                ],
              ),

               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                  widget.emp.dept, textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.white,
                    
                    
                  ),
                ),
                ],
              ),
            ],
          ),
      ),
    );
  }

  Widget _contact() {
    return new Container (
                width: MediaQuery.of(context).size.width * 0.88,
                margin: EdgeInsets.only(right:22, left:22, top:32, bottom:22),
                child: new Container(
                  
                  child: new Center(
                    child: new Column(
                     children : [
                       new Padding(padding: EdgeInsets.only(top: 180.0)),
                       new Padding(padding: EdgeInsets.only(top: 10.0)),
                       new TextFormField(
                         textInputAction: TextInputAction.done,
                      decoration: new InputDecoration(
                        //labelText: " Enter Email",
                        hintStyle: TextStyle(color: Colors.black),
                        hintText: "\t\t" + widget.emp.contact,
                        fillColor: Color(0xffECECEC),
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(35.0),
                        borderSide: BorderSide(color: Color(0xffECECEC))),
            
                      ),
                      keyboardType: TextInputType.emailAddress,
                      style: new TextStyle(
                        fontFamily: "Poppins",
                      ),

                      onChanged: (hintText) {
                        setState(() => contactTemp = hintText);}, 
                    ),
                     ]
                    )
                 ),
            )
            );
  }

   

  Widget _email() {
      return new Container (
                width: MediaQuery.of(context).size.width * 0.88,
                margin: EdgeInsets.only(right:22, left:22, top:37, bottom:22),
                child: new Container(
                  
                  child: new Center(
                    child: new Column(
                     children : [
                       new Padding(padding: EdgeInsets.only(top: 247.0)),
                       
                       new Padding(padding: EdgeInsets.only(top: 10.0)),
                       new TextFormField(
                         textInputAction: TextInputAction.done,
                         
                      decoration: new InputDecoration(
                        //labelText: " Enter Email",
                        hintStyle: TextStyle(color: Colors.black),
                        hintText: "\t\t" + widget.emp.email,
                        fillColor: Color(0xffECECEC),
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(35.0),
                        borderSide: BorderSide(color: Color(0xffECECEC))),
            
                      ),
                      keyboardType: TextInputType.emailAddress,
                      style: new TextStyle(
                        fontFamily: "Poppins",
                      ),

                      onChanged: (hintText) {
                       setState(() => emailTemp = hintText);},
                    ),
                     ]
                    )
                 ),
            )
            );
  }

 Widget _address() {
     return new Container (
                width: MediaQuery.of(context).size.width * 0.88,
                
                margin: EdgeInsets.only(right:22, left:22, top:42, bottom:22),
                child: new Container(
                  
                  child: new Center(
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children : [
                       new Padding(padding: EdgeInsets.only(top: 314.0)),
                       
                       new Padding(padding: EdgeInsets.only(top: 10.0)),
                       new TextFormField(
                        textInputAction: TextInputAction.done,
                         
                      decoration: new InputDecoration(
                        hintStyle: TextStyle(color: Colors.black),
                        hintText: "\t\t" + widget.emp.address,
                        fillColor: Color(0xffECECEC),
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(35.0),
                        borderSide: BorderSide(color: Color(0xffECECEC))),
            
                      ),
                      
                      keyboardType: TextInputType.emailAddress,
                      style: new TextStyle(
                        fontFamily: "Poppins",
                      ),
                      onChanged: (hintText) {
                       setState(() => addressTemp = hintText);},
                    ),

                     SizedBox(
                        height: 15,
                    ),

                    new RaisedButton(
                    onPressed: () {
                           final snackBar = SnackBar(
                              content: Text('Profile has been updated'),
                              duration: Duration(seconds: 2));
                              globalKey.currentState.showSnackBar(snackBar);
                         

                          //Navigator.of(context).pop(widget.emp);
                          if(nameTemp !=null)
                          {
                            setState(() => widget.emp.name = nameTemp);
                          }
                          if(contactTemp !=null)
                          {
                             setState(() => widget.emp.contact = contactTemp);
                          }
                          if(emailTemp !=null)
                          {
                            setState(() => widget.emp.email = emailTemp);
                          }
                          if(addressTemp != null)
                          {
                            setState(() => widget.emp.address = addressTemp);
                          }
                    },
                    textColor: Colors.white,
                    color: Colors.green,
                    padding: const EdgeInsets.all(8.0),
                    child: new Text(
                      "UPDATE",
                    ),
                  ),
                 
            
                     ]
                    )
                    
                    
                
                 ),
            )
            );
  }


  
  
  final globalKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      
      resizeToAvoidBottomPadding: true,
      key: globalKey,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xff022264),
        
        title: Text(
          "UPDATE PROFILE",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        
        centerTitle: true,
        
        //actions: <Widget>[IconButton(icon: Icon(Icons.edit, color: Colors.white),onPressed: (){},),],
      ),
      body: SingleChildScrollView(
        
        child: Stack(
          children: <Widget>[
            Container(
              color: Colors.blue[100],
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
            _greenColors(),
            _contact(),
            _email(),
            _address(),
            

          ],
        ),

      


      ),
    );
    
  }

  
}