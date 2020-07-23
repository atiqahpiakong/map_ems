import 'package:flutter/material.dart';
import 'package:emsproject/model/user_model.dart';
import './services/user_data_service.dart';
class EditProfile extends StatefulWidget {
  final User user;
  EditProfile(this.user);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<EditProfile> {
    final dataService = UserDataService();
  // var nameTemp;
  // var contactTemp;
  // var emailTemp;
  // var addressTemp;

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
            Positioned(
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
                          backgroundImage:
                              ExactAssetImage('assets/img/profile.png'),
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
                          widget.user.name,
                          textAlign: TextAlign.center,
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
                          widget.user.department,
                          textAlign: TextAlign.center,
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
            ),
            Container(
                width: MediaQuery.of(context).size.width * 0.88,
                margin:
                    EdgeInsets.only(right: 22, left: 22, top: 32, bottom: 22),
                child: new Container(
                  child: new Center(
                      child: new Column(children: [
                    new Padding(padding: EdgeInsets.only(top: 180.0)),
                    new Padding(padding: EdgeInsets.only(top: 10.0)),
                    new TextFormField(
                      textInputAction: TextInputAction.done,
                      decoration: new InputDecoration(
                        //labelText: " Enter Email",
                        hintStyle: TextStyle(color: Colors.black),
                        hintText: "\t\t" + widget.user.phone,
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
                        setState(() => widget.user.phone = hintText);
                        print(widget.user.phone);
                      },
                    ),
                  ])),
                )),
            Container(
                width: MediaQuery.of(context).size.width * 0.88,
                margin:
                    EdgeInsets.only(right: 22, left: 22, top: 37, bottom: 22),
                child: new Container(
                  child: new Center(
                      child: new Column(children: [
                    new Padding(padding: EdgeInsets.only(top: 247.0)),
                    new Padding(padding: EdgeInsets.only(top: 10.0)),
                    new TextFormField(
                      textInputAction: TextInputAction.done,
                      decoration: new InputDecoration(
                        //labelText: " Enter Email",
                        hintStyle: TextStyle(color: Colors.black),
                        hintText: "\t\t" + widget.user.email,
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
                        setState(() => widget.user.email = hintText);
                      },
                    ),
                  ])),
                )),
            Container(
                width: MediaQuery.of(context).size.width * 0.88,
                margin:
                    EdgeInsets.only(right: 22, left: 22, top: 42, bottom: 22),
                child: new Container(
                  child: new Center(
                      child: new Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                        new Padding(padding: EdgeInsets.only(top: 314.0)),
                        new Padding(padding: EdgeInsets.only(top: 10.0)),
                        new TextFormField(
                          textInputAction: TextInputAction.done,
                          decoration: new InputDecoration(
                            hintStyle: TextStyle(color: Colors.black),
                            hintText: "\t\t" + widget.user.address,
                            fillColor: Color(0xffECECEC),
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(35.0),
                                borderSide:
                                    BorderSide(color: Color(0xffECECEC))),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          style: new TextStyle(
                            fontFamily: "Poppins",
                          ),
                          onChanged: (hintText) {
                            setState(() => widget.user.address = hintText);
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        new RaisedButton(
                          onPressed: () async{
                            final snackBar = SnackBar(
                                content: Text('Profile has been updated'),
                                duration: Duration(seconds: 2));
                            globalKey.currentState.showSnackBar(snackBar);

                            //Navigator.of(context).pop(widget.emp);
                            
                              User updatedUser = await dataService.updateUser(id: widget.user.id, phone: widget.user.phone, email: widget.user.email, address: widget.user.address);
                               setState(() => widget.user.phone  = updatedUser.phone);
                            
                          },
                          textColor: Colors.white,
                          color: Colors.green,
                          padding: const EdgeInsets.all(8.0),
                          child: new Text(
                            "UPDATE",
                          ),
                        ),
                      ])),
                )),
          ],
        ),
      ),
    );
  }
}
