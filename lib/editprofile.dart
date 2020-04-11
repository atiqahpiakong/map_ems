import 'package:flutter/material.dart';


class EditProfile extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<EditProfile> {

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
                    radius: 55,
                  
                )
                                  
                ],
              ),
              SizedBox(
                height: 35,
              ),
              

              
            ],
          ),
      ),
    );
  }

}