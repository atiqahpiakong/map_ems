import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'homescreen_admin.dart';
import 'homescreen_manager.dart';
import 'home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';


class FormScreen extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<StatefulWidget> createState() {
    return FormScreenState();
  }
}

enum ConfirmAction { CANCEL, OKAY }

class FormScreenState extends State<FormScreen> {
  // Future<ConfirmAction> _asyncConfirmDialog(BuildContext context) async {
  //   return showDialog<ConfirmAction>(
  //     context: context,
  //     barrierDismissible: true, // user must tap button for close dialog!
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         shape:
  //             RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
  //         backgroundColor: Color(0xff00162b),
  //         title: Center(
  //           child: Text(
  //             'EMS',
  //             style: TextStyle(color: Colors.white),
  //           ),
  //         ),
  //         content: const Text(
  //           'Enter atiqah@gmail.com for EMPLOYEE login or balqeshy@gmail.com for ADMIN login or sitinabilah@gmail.com for MANAGER login',
  //           style: TextStyle(color: Colors.white),
  //         ),
  //       );
  //     },
  //   );
  // }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  String _email, _password;

  final TextEditingController _passwordController = TextEditingController();

  bool _rememberMe = false;

  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Email',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            )),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(color: Colors.transparent),
          height: 60.0,
          child: TextFormField(
            // validator: EmailValidator.validate,
            // controller: _emailController,
              validator: (input) {
              if (input.isEmpty) {
                return 'Please type an email';
              }
            },
            onSaved: (input) => _email = input,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsetsDirectional.only(top: 14.0),
                prefixIcon: Icon(
                  Icons.email,
                  color: Colors.white,
                ),
                hintText: 'Enter your Email',
                hintStyle: TextStyle(color: Colors.white)),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Password', style: TextStyle(color: Colors.white)),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(color: Colors.transparent),
          height: 60.0,
          child: TextFormField(
            // validator: PasswordValidator.validate,
            // controller: _passwordController,

             validator: (input) {
              if (input.length < 6) {
                return 'Your password needs to be atleast 6 characters';
              }
            },
            onSaved: (input) => _password = input,
            obscureText: true,
            style: TextStyle(color: Colors.white, fontFamily: 'OpenSans'),
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsetsDirectional.only(top: 14.0),
                prefixIcon: Icon(
                  Icons.lock,
                  color: Colors.white,
                ),
                hintText: 'Enter your Password',
                hintStyle: TextStyle(color: Colors.white)),
          ),
        ),
      ],
    );
  }

  Widget _buildForgotPasswordBtn() {
    return Container(
        alignment: Alignment.centerRight,
        child: FlatButton(
          onPressed: () => print('Forgot Password Button Pressed'),
          padding: EdgeInsets.only(right: 0.0),
          child: Text(
            'Forget Password?',
            style: TextStyle(color: Colors.white),
          ),
        ));
  }

  Widget _buildRememberMeCheckbox() {
    return Container(
      height: 20.0,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Checkbox(
              value: _rememberMe,
              checkColor: Colors.green,
              activeColor: Colors.white,
              onChanged: (value) {
                setState(() {
                  _rememberMe = value;
                });
              },
            ),
          ),
          Text(
            'Remember me',
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
Widget _buildLoginBtn() {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 25.0),
        width: double.infinity,
        child: RaisedButton(
            elevation: 5.0,
            onPressed: signIn,
            padding: EdgeInsets.all(15.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            color: Colors.white,
            child: Text('LOGIN',
                style: TextStyle(
                  color: Color(0xFF527DAA),
                  letterSpacing: 4.0,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans',
                ))));
  }


  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Scaffold(
          body: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.light,
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Stack(children: <Widget>[
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF7986CB),
                        Color(0xFF3F51B5),
                        Color(0xFF303F9F),
                        Color(0xFF1A237E),
                      ],
                      stops: [0.1, 0.4, 0.7, 0.9],
                    ),
                  ),
                ),
                Container(
                  height: double.infinity,
                  child: SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    padding: EdgeInsets.symmetric(
                      horizontal: 40.0,
                      vertical: 120.0,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Sign In',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'OpenSans',
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 30.0),
                        _buildEmailTF(),
                        _buildPasswordTF(),
                        _buildForgotPasswordBtn(),
                        _buildRememberMeCheckbox(),
                        _buildLoginBtn(),
                      ],
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ));
  }


  // Firebase Authentication
  Future<void> signIn() async {
    final formState = _formKey.currentState;
    if (formState.validate()) {
      formState.save();
      try {
        FirebaseUser user = (await FirebaseAuth.instance
                .signInWithEmailAndPassword(email: _email, password: _password))
            .user;
        if (_email == "admin@gmail.com") {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AdminNavBar(user: user)));
        } else if (_email == "manager@gmail.com") {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ManagerNavBar(user: user)));
        } else {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => BottomNavBar(user: user)));
        }
      } catch (e) {
        dialog(context);
        print(e.message);
      }
    }
  }

  void dialog(BuildContext context) {
    var alertDialog = AlertDialog(
      backgroundColor: Color.fromRGBO(40, 20, 40, 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      title: Text(
        "Wrong Email or Password",
        style: TextStyle(color: Colors.white),
      ),
      content: Text(
        "Please enter the correct email and password.",
        style: TextStyle(color: Colors.white),
      ),
      actions: <Widget>[
        FlatButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return FormScreen();
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
