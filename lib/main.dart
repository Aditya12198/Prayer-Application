import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hanumanchalisaa_app/home.dart';

void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: new SplashScreen(),
  ));
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Hanuman_Chalisaa()));
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.black,
        body: Column(children: [
          Container(
            padding: EdgeInsets.only(top: 100),
            child: Text(
              'JAI SHREE RAM!',
              style: TextStyle(
                  color: Colors.redAccent,
                  fontSize: 40,
                  fontWeight: FontWeight.w700),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Hanuman_Chalisaa()));
            },
            child: Container(
              padding: EdgeInsets.only(
                top: 100,
              ),
              child: Image.asset(
                'assets/splash.gif',
                fit: BoxFit.cover,
              ),
            ),
          )
        ]));
  }
}
