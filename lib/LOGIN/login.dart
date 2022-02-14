import 'package:product/ICON_DLL_PALING_ATAS/Layanan_Carinih.dart';
import 'package:product/LOGIN/Animation_login.dart';
import 'package:product/LOGIN/form_login.dart';
// import 'package:product/SIGN_UP/Sign_up.dart';
import 'package:flutter/material.dart';
import 'package:product/Auth/Register/register.dart';

import 'Animation_login.dart';
import 'form_login.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepPurple[400],
      child: SafeArea(
        child: Scaffold(
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 20,
                    color: Colors.deepPurple[400],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20.0, right: 20, top: 80),
                  child: ListView(
                    children: [
                      Image.asset('gambar/Login/gambar_login.png'),
                      Center(
                          child: Text(
                        'Aplikasi Keluarga',
                        style: TextStyle(
                            fontFamily: 'Comfortaa',
                            fontSize: 20,
                            color: Colors.blue[200],
                            fontWeight: FontWeight.bold),
                      )),
                      SizedBox(height: 25),
                      Row(
                        children: [
                          Text(
                            'Selamat Datang di',
                            style: TextStyle(
                                color: Colors.deepPurple[400],
                                fontFamily: 'Comfortaa',
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Text(
                            'CARIstore!',
                            style: TextStyle(
                                color: Colors.yellow[800],
                                fontFamily: 'Comfortaa',
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Temukan semua kebutuhan keluarga Anda di CARI store.',
                        style: TextStyle(fontFamily: 'Comfortaa', fontSize: 10),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(20)),
                        height: 100,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  //
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  FormLogin()));
                                    },
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              20,
                                      width: MediaQuery.of(context).size.width /
                                          3.8,
                                      decoration: BoxDecoration(
                                          color: Colors.deepPurple[400],
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Center(
                                          child: Text(
                                        'Login',
                                        style: TextStyle(
                                            fontFamily: 'Comfortaa',
                                            color: Colors.white),
                                      )),
                                    ),
                                  ),
                                  //
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  Register()));
                                    },
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              20,
                                      width: MediaQuery.of(context).size.width /
                                          3.8,
                                      decoration: BoxDecoration(
                                          color: Colors.deepPurple[400],
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Center(
                                          child: Text(
                                        'Sign Up',
                                        style: TextStyle(
                                            fontFamily: 'Comfortaa',
                                            color: Colors.white),
                                      )),
                                    ),
                                  ),
                                ],
                              ),
                              //
                              Container(
                                margin: EdgeInsets.only(right: 10, top: 10),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Icon(
                                      Icons.control_point,
                                      size: 15,
                                    ),
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              height: 20,
                                              width: 30,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          'gambar/images/voucher_icon.png'),
                                                      fit: BoxFit.cover)),
                                            ),
                                            Text('10 Voucher')
                                          ],
                                        ),
                                        Text(
                                          'Khusus Pengguna Baru',
                                          style: TextStyle(fontSize: 10),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              //
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Stack(
                  children: [
                    AnimationLogin(),
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
                                    image:
                                        AssetImage('gambar/Login/simbol.png'))),
                          )),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
