// ignore_for_file: import_of_legacy_library_into_null_safe

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';
import 'package:product/HomeScreen.dart';
import 'package:product/LOGIN/login.dart';
import 'package:product/Utils/utility.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Dashboard/dashboard.dart';

// ignore_for_file: prefer_const_constructors
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(360, 690),
        builder: () => MaterialApp(
              debugShowCheckedModeBanner: false,
              builder: (context, wiget) {
                return MediaQuery(
                    data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                    child: wiget);
              },
              home: MyHomePage(),
            ));
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void completed() {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (BuildContext context) => HomeScreen()),
        (Route<dynamic> route) => false);
  }

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), completed);
    // startTimer();
  }

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

  // String emailuser;
  // Future<void> startTimer() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   emailuser = preferences.getString('sukses');
  //   Timer(Duration(seconds: 2), () {
  //     if (emailuser == '200') {
  //       Navigator.of(context).pushReplacement(
  //         MaterialPageRoute(
  //           builder: (BuildContext context) => HomeScreen(),
  //         ),
  //       );
  //     } else {
  //       Navigator.of(context).pushReplacement(
  //         MaterialPageRoute(
  //           builder: (BuildContext context) => Login(),
  //         ),
  //       );
  //     }
  //   });
  // }
}
