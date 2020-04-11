import 'package:flutter/material.dart';
import 'dart:async';
import 'package:shimmer/shimmer.dart';
import 'login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EMS',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        
      ),
      home: MyHomePage(title: 'Employee Management System'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin{

     @override
    void initState(){
    super.initState();

    _mockCheckForSession().then(
        (status) {
          if (status) {
            _navigateToHome();
          } else {
            
          }
        }
    );

    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();

  }

   void _navigateToHome(){
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (BuildContext context) => FormScreen()
      )
    );
  }

  Future<bool> _mockCheckForSession() async {
    await Future.delayed(Duration(seconds: 5), () {});

    return true;
  }

  AnimationController _controller;

  

  Animatable<Color> background = TweenSequence<Color>([
    TweenSequenceItem(
      weight: 1.0,
      tween: ColorTween(
        begin: Color(0xff000c18),
        end: Color(0xff00162b),
        
      ),
    ),
    TweenSequenceItem(
      weight: 1.0,
      tween: ColorTween(
        begin: Color(0xff00162b),
        end: Color(0xff000c18),
      ),
    ),
    
  ]);
  

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
        builder: (context, child){
          return Scaffold(
            body: Stack(
              fit: StackFit.expand,
            )

          );
        }

    );
  }
}
