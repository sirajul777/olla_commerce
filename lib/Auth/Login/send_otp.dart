import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:product/Api/api_key.dart';
import 'package:product/Dashboard/dashboard.dart';
import 'package:product/Auth/Register/register.dart';
import 'package:product/Auth/Otp/otpnumber.dart';
import 'package:product/Auth/Otp/sendotp.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// ignore_for_file: prefer_const_constructors

// ignore: use_key_in_widget_constructors
class SendOtp extends StatefulWidget {
  @override
  State<SendOtp> createState() => _SendOtpState();
}

class _SendOtpState extends State<SendOtp> {
  bool loading = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: sized_box_for_whitespace
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        // color: Colors.yellow,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 3.5),
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('image/login.png'),
                  ),
                ),
              ),
              //
              SizedBox(
                height: 30,
              ),
              //
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 15,
                      decoration: BoxDecoration(
                          // color: Colors.blue[50],
                          borderRadius: BorderRadius.circular(25)),
                      child: TextField(
                        controller: email,
                        // textAlign: TextAlign.left,
                        // ignore: unnecessary_new
                        decoration: new InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          contentPadding:
                              EdgeInsets.only(left: 20, right: 20, top: 5),
                          hintText: 'email',
                          hintStyle: TextStyle(color: Colors.grey[300]),
                          border: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(25.0),
                              ),
                              borderSide: BorderSide.none),
                        ),
                      ),
                    ),
                    //
                    SizedBox(
                      height: 20,
                    ),
                    //
                    GestureDetector(
                      onTap: () {
                        addData();
                        // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>Dashboard()));
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 15,
                        decoration: BoxDecoration(
                            color: Colors.blue[300],
                            borderRadius: BorderRadius.circular(25)),
                        child: Center(
                            child: Text(
                          'Send OTP',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        )),
                      ),
                    ),
                    //
                    SizedBox(
                      height: 10,
                    ),
                    //
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Dont have an account '),
                        // ignore: avoid_unnecessary_containers
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        Register()));
                          },
                          child: Container(
                            child: Text(
                              'Sign Up ',
                              style: TextStyle(
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //
  TextEditingController email = TextEditingController();
  //
  addData() {
    // var random = randomAlphaNumeric(32).toLowerCase();
    // String myUrl = "http://45.13.132.61:3000/reseller/signup";
    String myUrl = "https://gopump.id/api/customer/login";
    http.post(Uri.parse(Uri.encodeFull(myUrl)), headers: {
      'Accept': 'application/json',
      "x-token-olla": KEY.APIKEY,
      // "imei": "123456"
    }, body: {
      "email": email.text,
    }).then((response) async {
      var jsonObj = json.decode(response.body);

      if (kDebugMode) {
        print(jsonObj);
      }
      if (response.statusCode == 200) {
        // print(jsonObj['customer_id']);
        setState(() {
          // pengenalid = jsonObj['customer_id'];
          // _incrementCounter();
        });
        if (kDebugMode) {
          print(jsonObj);
        }

        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => SendOtpNumber(
                      email: email.text,
                    )),
            (Route<dynamic> route) => false);
        // setState(() {
        //   data = '${jsonObj['data']['verification_code']}';
        //   statusinactive = '${jsonObj['data']['status']}';
        //   namauser = '${jsonObj['data']['user_name']}';
        //   emailuser = '${jsonObj['data']['email']}';
        // });
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 0,
              backgroundColor: Colors.transparent,
              child: Stack(
                overflow: Overflow.visible,
                children: [
                  Container(
                      height: 200,
                      width: double.infinity,
                      margin: EdgeInsets.only(top: 20),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(17),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 10.0,
                              offset: Offset(0.0, 10.0),
                            ),
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 70.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            SizedBox(
                              height: 10,
                            ),
                            Text('Maaf!!!',
                                style: TextStyle(
                                    fontFamily: 'Comfortaa',
                                    fontSize: 13,
                                    fontWeight: FontWeight.w900)),
                            SizedBox(
                              height: 10,
                            ),
                            Text('Masukkan Data Anda Dengan Benar',
                                style: TextStyle(
                                    fontFamily: 'Comfortaa',
                                    fontSize: 13,
                                    fontWeight: FontWeight.w900)),
                          ],
                        ),
                      )),
                  Positioned(
                    // bottom: 10,
                    top: 0,
                    left: 16,
                    right: 16,
                    child: Container(
                        height: 80,
                        width: 80,
                        child: Image.asset('image/login.png')),
                  )
                ],
              ),
            );
          },
        );
      }
    });
//
//
  }
}
