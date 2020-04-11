import 'package:flutter/material.dart';
import 'Constants.dart';
//import 'settingpage.dart';
import 'login.dart';

class HomeScreen extends StatefulWidget {
  
  @override
  _HomeScreenState createState() => _HomeScreenState();

  
}


class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Color(0xffECECEC),
        appBar: AppBar(
        brightness: Brightness.light,
        title: Text(
          "EMS",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        automaticallyImplyLeading: false,

        actions: <Widget>[
          PopupMenuButton<String>(
            //onSelected: choiceAction,
            itemBuilder: (BuildContext context){
              return Constants.choices.map((String choice){
               return PopupMenuItem<String>(
                 value: choice,
                 child: Text(choice),

               );
              }).toList();
            
            },
          )
        ],
        elevation: 0,
        backgroundColor: Color(0xff022264),
        centerTitle: true,
        
      ),
        body: Center(  
               child: 
                RichText(
                  textAlign: TextAlign.center,

                  text: TextSpan(text:
                  'Welcome to Employee Management System ' + '\n',
                  
                  style:TextStyle
                    ( fontWeight: FontWeight.bold,
                      color: Colors.black, 
                    fontFamily: 'serif',
                  fontSize: 23,
                      ),
                        children: <TextSpan>[
                          TextSpan(text: '\n'),

                    TextSpan(text: 'An employee management system consists of crucial work-related and important persona information about an employee. In a nutshell, it is an online inventory of all employees of an organization. Employees are the l of any organization, and it is'
                    + '\n'+' more so in case of a growing business' + '\n\n',
                     style: TextStyle (color: Colors.orange[900], 
                    fontWeight: FontWeight.normal,

                    fontFamily: 'vollkorn',
                     fontSize: 15)
                     
                    ),
                    

                    TextSpan(text: 'FIND US' + '\n',
                     style: TextStyle (color: Colors.black, 
                    // fontWeight: FontWeight.bold,

                    fontFamily: 'Pacifico',
                     fontSize: 22)
                     
                    ),


                    TextSpan(text: 'Level 8, Block D06, UTM'+ '\n\n',

                     style: TextStyle (color: Colors.black, 
                    // fontWeight: FontWeight.normal,
                    fontFamily: 'vollkorn',
                     fontSize: 17)
                     
                    ),

                    TextSpan(text: 'EMAIL' + '\n',
                     style: TextStyle (color: Colors.black, 
                    // fontWeight: FontWeight.bold,

                    fontFamily: 'Pacifico',
                     fontSize: 22)
                     
                    ),
                    TextSpan(text: 'qats@utm.my' + '\n\n',
                     style: TextStyle (color: Colors.black, 
                    // fontWeight: FontWeight.normal,

                    fontFamily: 'vollkorn',
                     fontSize: 17)
                     
                    ),

                    TextSpan(text: 'contacts' + '\n',
                     style: TextStyle (color: Colors.black, 
                    // fontWeight: FontWeight.bold,

                    fontFamily: 'Pacifico',
                     fontSize: 22)
                     
                    ),
                    TextSpan(text: '+60172334489' + '\n',
                     style: TextStyle (color: Colors.black, 
                    // fontWeight: FontWeight.bold,

                    fontFamily: 'vollkorn',
                     fontSize: 17)
                     
                    ),

                  ]             

                ),
 
            ),

    ),


    );
  }
}