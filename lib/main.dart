// ignore_for_file: import_of_legacy_library_into_null_safe

import 'dart:async';

import 'package:product/Auth/Login/login.dart';
import 'package:product/Auth/Login/send_otp.dart';
import 'package:flutter/material.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';
import 'package:product/Utils/utility.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Dashboard/dashboard.dart';

// ignore_for_file: prefer_const_constructors
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(bodyColor: AppColors.textColor),
      ),
      home: const MyHomePage(title: 'Olla'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key,  this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(color: Colors.blue[800]),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 3.5),
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('image/splashscreen.png'),
                      ),
                    ),
                  ),
                  Loading(    
                    indicator: BallPulseIndicator(),
                    size: 50,
                    color: Colors.grey[400],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
  @override
  void initState(){
    super.initState();
    startTimer();
  }

    String emailuser;
    Future<void> startTimer() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    emailuser = preferences.getString('sukses');
    Timer(Duration(seconds: 2), () {
      if(emailuser=='200'){
        Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => Dashboard(),
        ),
      );
      }else{
        Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => SendOtp(),
        ),
      );
      }
    });
  }
}
