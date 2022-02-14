import 'package:dinamika/PROFILE/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UbahKataSandi extends StatefulWidget {
  @override
  _UbahKataSandiState createState() => _UbahKataSandiState();
}

class _UbahKataSandiState extends State<UbahKataSandi> {
  @override
  //
  String datainformation;
    editpassword() async {
     final prefs = await SharedPreferences.getInstance();
    datainformation = prefs.getString('datainformation');
    String myUrl = "https://carinih.ws/api/user_account/change_password";
    http.put(Uri.parse(Uri.encodeFull(myUrl)), headers: {
      'Accept': 'application/json',
      // "imei": "123456"
    }, body: {
      "id": '$datainformation',
      "old_password": pinlama.text,
      "new_password": pinbaru.text,
      "retype_password": konfirmasipin.text,
      // "verification_code": '$data',
      // "reset_code": "",
      // "role": "4",
      // "status": 'active'
    }).then((response) {
        // var jsonObj = json.decode(response.body);
      if (response.statusCode == 404) {
        // print(jsonObj);
        // var data1=jsonObj['message'];
        // print(data1);
        showDialog(
      context: context,
      builder: (BuildContext context) {
        return  Dialog(
          
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
              margin: EdgeInsets.only(top:20),
              decoration: BoxDecoration(
                color:Colors.white,
                shape:BoxShape.rectangle,
                borderRadius: BorderRadius.circular(17),
                boxShadow:[
                  BoxShadow(
                    color:Colors.black26,
                    blurRadius:10.0,
                    offset: Offset(0.0,10.0),
                  ),
                ]
              ),
              child:Padding(
                padding: const EdgeInsets.only(top:70.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 10,),
                    Text('Berhasil!!!',style: TextStyle(fontFamily: 'Comfortaa',fontSize: 13,fontWeight: FontWeight.w900)),
                    SizedBox(height: 10,),
                    Text('Kata Sandi Anda Berhasil Di Update',style: TextStyle(fontFamily: 'Comfortaa',fontSize: 13,fontWeight: FontWeight.w900)),
                ],),
              )
            ),
            Positioned(
              // bottom: 10,
               top: 0,
              left:16,
              right:16,
              child:Container(
                height: 80,
                width: 80,
                child: Image.asset('gambar/C_icon.png')),
            )
          ],
        ),
  );
      },
    );
      
    
                
        // setState(() {
        //   data = '${jsonObj['data']['verification_code']}';
        //   statusinactive = '${jsonObj['data']['status']}';
        //   namauser = '${jsonObj['data']['user_name']}';
        //   emailuser = '${jsonObj['data']['email']}';
        // });
      }else{
           Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                       Profile()));
      }
      // print('$statusinactive');
      // return print(json);
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
  TextEditingController pinlama = TextEditingController();
  TextEditingController pinbaru = TextEditingController();
  TextEditingController konfirmasipin = TextEditingController();
  //
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final _scaffoldkey = GlobalKey<ScaffoldState>();
  //
  bool sandi = true;
  bool ulangisandi = true;
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Form(
          key: formkey,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false,
              leading: Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.deepPurple[400],
                    size: 18,
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
              title: GestureDetector(
                onTap: () {
                  // getJsonData();
                },
                child: Text(
                  "Kembali",
                  style: TextStyle(
                      color: Colors.deepPurple[400],
                      fontFamily: 'Comfortaa',
                      fontWeight: FontWeight.w900,
                      fontSize: 15.sp),
                ),
              ),
              centerTitle: false,
              titleSpacing: 0,
              leadingWidth: 35,
            ),
            body: Container(
              margin: EdgeInsets.only(left: 15.w, right: 15.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30.h,
                  ),
                  Text(
                    'Keamanan',
                    style: TextStyle(
                        color: Colors.deepPurple[400],
                        fontFamily: 'Comfortaa',
                        fontWeight: FontWeight.w900,
                        fontSize: 16.sp),
                  ),
                  //
                  SizedBox(
                    height: 10.h,
                  ),
                  //
                  Text(
                    'Ubah Kata Sandi',
                    style: TextStyle(
                        fontFamily: 'Comfortaa',
                        fontWeight: FontWeight.w700,
                        fontSize: 12.sp),
                  ),
                  //
                  SizedBox(
                    height: 12.h,
                  ),
                  //
                  TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Tidak Boleh Kosong';
                      }
                      return null;
                    },
                    controller: pinlama,
                    decoration: InputDecoration(
                        hintText: "Kata Sandi Lama",
                        hintStyle: TextStyle(
                            fontFamily: 'Comfortaa',
                            color: Colors.grey,
                            fontSize: 12.sp),
                        contentPadding: EdgeInsets.only(left: 20),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        )),
                  ),
                  //
                  SizedBox(
                    height: 15.h,
                  ),
                  //
                   TextFormField(
                     obscureText: sandi,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Tidak Boleh Kosong';
                      }
                      return null;
                    },
                    controller: pinbaru,
                    decoration: InputDecoration(
                        hintText: "Kata Sandi Baru",
                        hintStyle: TextStyle(
                            fontFamily: 'Comfortaa',
                            color: Colors.grey,
                            fontSize: 12.sp),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  sandi = !sandi;
                                });
                              },
                              child: sandi
                                  ? Icon(
                                      Icons.visibility_off_outlined,
                                      color: Colors.deepPurple[400],
                                    )
                                  : Icon(Icons.remove_red_eye,
                                      color: Colors.yellow[800])),
                        contentPadding: EdgeInsets.only(left: 20),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        )),
                  ),
                  //
                  SizedBox(
                    height: 15.h,
                  ),
                  //
                  TextFormField(
                     obscureText: ulangisandi,
                    controller: konfirmasipin,
                    decoration: InputDecoration(
                        hintText: "Konfrimasi Kata Sandi",
                        hintStyle: TextStyle(
                            fontFamily: 'Comfortaa',
                            color: Colors.grey,
                            fontSize: 12.sp),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  ulangisandi = !ulangisandi;
                                });
                              },
                              child: ulangisandi
                                  ? Icon(
                                      Icons.visibility_off_outlined,
                                      color: Colors.deepPurple[400],
                                    )
                                  : Icon(Icons.remove_red_eye,
                                      color: Colors.yellow[800])),
                        contentPadding: EdgeInsets.only(left: 20),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        )),
                        validator: (String value) {
                        if (value.isEmpty) {
                          return "Tidak Boleh Kosong";
                        }
                        if (pinbaru.text != konfirmasipin.text) {
                          return "Password baru tidak cocok";
                        }
                        return null;
                      },
                  ),
                  //
                  SizedBox(
                    height: 20.h,
                  ),
                  //
                  GestureDetector(
                    onTap: () {
                      if (formkey.currentState.validate()) {
                        editpassword();
                        print('ok');
                      } else {
                        //
                      }
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 30.w, right: 30.w),
                      child: Center(
                        child: Text(
                          'Selesai',
                          style: TextStyle(
                              fontFamily: 'Comfortaa',
                              color: Colors.white,
                              fontSize: 12.sp),
                        ),
                      ),
                      height: 30.h,
                      // width: 200.w,
                      decoration: BoxDecoration(
                          color: Colors.deepPurple[400],
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        //
        Container(
          height: ScreenUtil().setHeight(30.h),
          color: Colors.deepPurple[400],
        ),
      ],
    );
  }
}
