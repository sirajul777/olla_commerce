import 'dart:convert';

import 'package:dinamika/LOGIN/Animation_login.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../HomeScreen.dart';

// import '../HomeScreen.dart';

class FormLogin extends StatefulWidget {
  @override
  _FormLoginState createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  //
  String dataemail;
  String pasword;
  final String url = "https://carinih.ws/api/user_account/";

  getJsonData() async {
    http.Response response = await http.get(Uri.parse(Uri.encodeFull(url)),
        headers: {"Accept": "application/json"});
    print(response.body);

    var data = json.decode(response.body);
    // setState(() {
    //   dataemail = data['data']['email'];
    //   pasword = data['data']['password'];
    //   // data4 = data['data'][6]['image'];
    //   // data5 = data['data'][7]['banner_group'];
    //   // datagambar5 = data['data'][7]['image'];
    //   // data6 = data['data'][8]['banner_group'];
    //   // datagambar6 = data['data'][8]['image'];
    // });

    print(data);
  }

  @override
  void initState() {
    getJsonData();
    // _incrementCounter();
    super.initState();
  }

//
  TextEditingController email = TextEditingController();
  TextEditingController katasandi = TextEditingController();
//
  String pengenalid;
  String sukses;
  addData() {
    // var random = randomAlphaNumeric(32).toLowerCase();
    // String myUrl = "http://45.13.132.61:3000/reseller/signup";
    String myUrl = "https://carinih.ws/api/account/login";
    http.post(Uri.parse(Uri.encodeFull(myUrl)), headers: {
      'Accept': 'application/json',
      // "imei": "123456"
    }, body: {
      "email": email.text,
      "password": katasandi.text,
    }).then((response) async {
      var jsonObj = json.decode(response.body);

      // print(jsonObj);
      if (response.statusCode == 200) {
        // print(jsonObj['customer_id']);
        setState(() {
          pengenalid = jsonObj['customer_id'];
          _incrementCounter();
        });
        print(jsonObj);

        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (BuildContext context) => HomeScreen()),
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
                          boxShadow: [
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
                          children: [
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
                        child: Image.asset('gambar/C_icon.png')),
                  )
                ],
              ),
            );
          },
        );
      }
      // print('$statusinactive');
      // return print('$data');
      //   return showDialog(
      //       context: context,
      //       barrierDismissible: false,
      //       builder: (BuildContext context) {
      //         return WillPopScope(
      //           onWillPop: () async => false,
      //           child: GestureDetector(onTap: () {
      //             Navigator.pop(context);
      //             // Navigator.pushAndRemoveUntil(
      //             //     context,
      //             //     MaterialPageRoute(
      //             //         builder: (BuildContext context) => HomeScreen()),
      //             //     (Route<dynamic> route) => false);
      //           }, child: StatefulBuilder(
      //             builder: (BuildContext context, StateSetter setState) {
      //               return SimpleDialog(
      //                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      //                 contentPadding: EdgeInsets.zero,
      //                 titlePadding: EdgeInsets.only(bottom: 0),
      //                 title: Column(
      //                   children: [
      //                     Container(
      //                       decoration: BoxDecoration(
      //                       color:Colors.deepPurple[400],
      //                         borderRadius: BorderRadius.only(topLeft:Radius.circular(10),topRight: Radius.circular(10))
      //                       ),
      //                       height:20,
      //                     ),
      //                     SizedBox(height:15),
      //                     Text('Akun Belum Aktiv'),
      //                     SizedBox(height:15),
      //                     RaisedButton(
      //                       child:Text('Verifikasi Akun'),
      //                       onPressed: (){
      //                         // _launchMap();
      //                       },
      //                     ),
      //                     SizedBox(height:15),
      //                   ],
      //                 )
      //               );
      //             },
      //           )),
      //         );
      //       });
      // } else {}
    });
//
//
  }

//
  _incrementCounter() async {
    final preff3 = await SharedPreferences.getInstance();
    preff3.setString('customer', '$pengenalid');
    //   prefs.setString('email', _email);
  }
  //
  // simpandatalogin() async {
  //   final preff1 = await SharedPreferences.getInstance();
  //   preff1.setString('true', '$sukses');
  // }

  //
  bool sandi = true;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Container(
            color: Colors.deepPurple[400],
            child: SafeArea(
              child: Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.white,
                  automaticallyImplyLeading: false,
                  leading: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.grey,
                        size: 18,
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                  title: GestureDetector(
                    onTap: () {
                      getJsonData();
                    },
                    child: Text(
                      "Kembali",
                      style: TextStyle(
                          color: Colors.deepPurple[400],
                          fontFamily: 'Comfortaa',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  centerTitle: false,
                  titleSpacing: 0,
                  leadingWidth: 35,
                ),
                body: Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Log In',
                                style: TextStyle(
                                    color: Colors.deepPurple[400],
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Comfortaa'),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Masukkan nomor ponsel atau email yang terdaftar.',
                                style: TextStyle(
                                    fontFamily: 'Comfortaa', fontSize: 10),
                              ),
                              SizedBox(height: 15),
                              //
                              Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  // color: Colors.yellow,
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(color: Colors.grey),
                                ),
                                child: TextFormField(
                                  controller: email,
                                  decoration: InputDecoration(
                                      hintText: 'Nomor Ponsel / Email',
                                      hintStyle: TextStyle(
                                          fontFamily: 'Comfortaa',
                                          color: Colors.grey[400],
                                          fontSize: 12),
                                      prefixIcon: Icon(
                                        Icons.perm_identity_rounded,
                                        size: 30,
                                        color: Colors.yellow[800],
                                      ),
                                      border: InputBorder.none),
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Contoh:  0812345678',
                                style: TextStyle(
                                    color: Colors.grey[500],
                                    fontFamily: 'Comfortaa',
                                    fontSize: 12),
                              ),
                              SizedBox(height: 10),
                              //
                              Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  // color: Colors.yellow,
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(color: Colors.grey),
                                ),
                                child: TextFormField(
                                  controller: katasandi,
                                  obscureText: sandi,
                                  decoration: InputDecoration(
                                      hintText: 'Kata Sandi',
                                      hintStyle: TextStyle(
                                          fontFamily: 'Comfortaa',
                                          color: Colors.grey[400],
                                          fontSize: 12),
                                      prefixIcon: Icon(
                                        Icons.lock_outline,
                                        size: 30,
                                        color: Colors.yellow[800],
                                      ),
                                      suffixIcon: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 12.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    sandi = !sandi;
                                                  });
                                                },
                                                child: sandi
                                                    ? Icon(
                                                        Icons
                                                            .visibility_off_outlined,
                                                        color: Colors
                                                            .deepPurple[400],
                                                      )
                                                    : Icon(Icons.remove_red_eye,
                                                        color: Colors
                                                            .yellow[800])),
                                            SizedBox(
                                              width: 8,
                                            ),
                                            Container(
                                                height: 20,
                                                width: 2,
                                                color: Colors.grey[400]),
                                            SizedBox(
                                              width: 8,
                                            ),
                                            Text(
                                              'Lupa?',
                                              style: TextStyle(
                                                  color: Colors.deepPurple[400],
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w900,
                                                  fontFamily: 'Comfortaa'),
                                            ),
                                          ],
                                        ),
                                      ),
                                      border: InputBorder.none),
                                ),
                              ),
                              SizedBox(height: 10),
                              //
                              GestureDetector(
                                onTap: () async {
                                  final preff1 =
                                      await SharedPreferences.getInstance();
                                  preff1.setString('true', 'success');
                                  //
                                  final preff2 =
                                      await SharedPreferences.getInstance();
                                  preff2.setString('dataprofile', email.text);
                                  //
                                  //       final preff3 =
                                  //     await SharedPreferences.getInstance();
                                  // preff3.setString(
                                  //     'customer', '$pengenalid');
                                  //
                                  addData();
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Container(
                                    child: Center(
                                        child: Text('Log In',
                                            style: TextStyle(
                                                color: Colors.white))),
                                    height: 35,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.deepPurple[400]),
                                  ),
                                ),
                              ),
                              //
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Divider(
                                          thickness: 0.8,
                                          color: Colors.deepPurple[400]),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 4),
                                      child: Text(
                                        'atau masuk dengan',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 11,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'Comfortaa'),
                                      ),
                                    ),
                                    Expanded(
                                      child: Divider(
                                        thickness: 0.8,
                                        color: Colors.deepPurple[400],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10),
                              //
                              Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    // color: Colors.yellow,
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(color: Colors.grey),
                                  ),
                                  child: Stack(
                                    children: [
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Icon(Icons.fingerprint,
                                              color: Colors.yellow[800])),
                                      Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          'Sidik Jari',
                                          style: TextStyle(
                                              fontFamily: 'Comfortaa'),
                                        ),
                                      ),
                                    ],
                                  )),
                              SizedBox(height: 15),
                              //
                              Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    // color: Colors.yellow,
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(color: Colors.grey),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Akun Media Sosial',
                                      style: TextStyle(fontFamily: 'Comfortaa'),
                                    ),
                                  )),
                              SizedBox(height: 10),
                              //
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Belum punya akun CARInih? ',
                                        style: TextStyle(
                                            fontFamily: 'Comfortaa',
                                            fontSize: 12),
                                      ),
                                      Text(
                                        'Sign Up',
                                        style: TextStyle(
                                            fontFamily: 'Comfortaa',
                                            color: Colors.blue[200],
                                            fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    //
                  ],
                ),
              ),
            ),
          ),
          //
          Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 20,
                  color: Colors.deepPurple[400],
                ),
              ),
              Stack(
                children: [
                  AnimationLogin(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 24.0),
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Butuh bantuan ?',
                              style: TextStyle(
                                  fontSize: 12, fontFamily: 'Comfortaa'),
                            ),
                            SizedBox(width: 5),
                            Text(
                              'Hubungi kami',
                              style: TextStyle(
                                  color: Colors.blue[200],
                                  fontSize: 12,
                                  fontFamily: 'Comfortaa'),
                            )
                          ],
                        )),
                  ),
                ],
              ),
              Positioned(
                left: 0,
                right: 30,
                bottom: 50,
                child: Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('gambar/Login/simbol.png'))),
                    )),
              )
            ],
          ),
        ],
      ),
    );
  }
}
// Container(
//         color: Colors.deepPurple[400],
//         child: SafeArea(
//           child: Scaffold(
//             appBar: AppBar(
//               backgroundColor: Colors.white,
//               automaticallyImplyLeading: false,
//               leading: Padding(
//                 padding: const EdgeInsets.only(left: 10.0),
//                 child: IconButton(
//                   icon: Icon(
//                     Icons.arrow_back_ios,
//                     color: Colors.grey,
//                     size: 18,
//                   ),
//                   onPressed: () => Navigator.of(context).pop(),
//                 ),
//               ),
//               title: Text(
//                 "Kembali",
//                 style: TextStyle(
//                     color: Colors.deepPurple[400],
//                     fontFamily: 'Comfortaa',
//                     fontWeight: FontWeight.bold),
//               ),
//               centerTitle: false,
//               titleSpacing: 0,
//               leadingWidth: 35,
//             ),
