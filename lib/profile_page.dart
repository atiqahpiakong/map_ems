import 'package:flutter/material.dart';
import 'editprofile.dart';
import 'package:emsproject/model/empmockdata.dart';
import 'package:emsproject/model/employee.dart';
//import 'homescreen_admin.dart';

class ProfilePage extends StatefulWidget {
  final Employee emp;
  ProfilePage(this.emp);

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
                  widget.emp.contact, 
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

   Widget _userEmail() {
    return Positioned(
      top: 270,
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
                  Icons.email,
                  color: Colors.black,
                ),
         
        
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                  widget.emp.email, 
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

  Widget _userAddress() {
    return Positioned(
      top: 335,
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
                  Icons.location_on,
                  color: Colors.black,
                ),
         
        
                  SizedBox(
                    width: 20,
                  ),
                  Flexible(
                    child:Text(
                  widget.emp.address, 
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    
                    
                  ),)
                ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        
        brightness: Brightness.light,
        
        title: Text(
          "PROFILE",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        
        elevation: 0,
        backgroundColor: Color(0xff022264),
        centerTitle: true,
        automaticallyImplyLeading: false,
        // leading: IconButton(
        //   icon: Icon(
        //     Icons.arrow_back_ios,
        //     color: Colors.white,
        //   ),
        //   onPressed: () {},
        // ),
        actions: <Widget>[
          
          IconButton(icon: Icon(Icons.edit, color: Colors.white),onPressed: (){
          Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => EditProfile(mockListEmp[2])));

        },),],
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
            _userPhone(),
            _userEmail(),
            _userAddress()

          ],
        ),

      


      ),
    );
    
  }

  
}
