import 'package:flutter/material.dart';
import 'editprofile.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

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
                  "Nurul Atiqah ", textAlign: TextAlign.center,
                  
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
                  "Software Department ", textAlign: TextAlign.center,
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

  Widget _userPhone() {
    return Positioned(
      top: 205,
      child: Container(
        margin: EdgeInsets.all(18),
        
        width: MediaQuery.of(context).size.width * 0.90,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                
              Icon(
                  Icons.call,
                  color: Colors.black,
                ),
         
        
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                  "012-3456789 ", 
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    
                    
                  ),
                ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

}