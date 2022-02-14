import 'dart:convert';

import 'package:product/General/general.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class EditGeneral extends StatefulWidget {
  String photo;
  String harga;
  String description;
  String hashtag;
  String tanggallahir;
  String nama;
  String email;
  String mobilephone;
// Get Key Data
  EditGeneral(
      {Key key,
      this.photo,
      this.harga,
      this.description,
      this.hashtag,
      this.tanggallahir,
      this.nama,
      this.email,
      this.mobilephone})
      : super(key: key);
  @override
  _EditGeneralState createState() => _EditGeneralState();
}

class _EditGeneralState extends State<EditGeneral> {
  //

  final String myUrl = "https://carinih.ws/api/user_account/general";
  List data;

  //
  Future<String> getDataProfile() async {
    var response = await http.get(Uri.parse(Uri.encodeFull(myUrl)),
        headers: {"Accept": "application/json"});
    print(response.body);
    //
    setState(() {
      var converDataToJson = json.decode(response.body);
      data = converDataToJson['data'];
    });
    return "Success";
  }

  //
  // final String myUrl = "https://carinih.ws/api/user_account/general";
  List data1;
  String datainformation;
  //
  Future<String> getDataProfileinformation() async {
    final prefs = await SharedPreferences.getInstance();
    datainformation = prefs.getString('datainformation');
    var response = await http.get(
        Uri.parse(Uri.encodeFull(
            "https://carinih.ws/api/user_account/information/$datainformation")),
        headers: {"Accept": "application/json"});
    print(response.body);
    //
    setState(() {
      var converDataToJson = json.decode(response.body);
      data1 = converDataToJson['data'];
    });
    return "Success";
  }

  //
  @override
  void initState() {
    getDataProfileinformation();
    getDataProfile();
    super.initState();
  }

//
  String idupdate;
  addData() async {
    final prefs = await SharedPreferences.getInstance();
    idupdate = prefs.getString('datainformation');
    // var random = randomAlphaNumeric(32).toLowerCase();
    // String myUrl = "http://45.13.132.61:3000/reseller/signup";
    String myUrl = "https://carinih.ws/api/user_account/update_general";
    http.post(Uri.parse(Uri.encodeFull(myUrl)), headers: {
      'Accept': 'application/json',
      // "imei": "123456"
    }, body: {
      'id': '$idupdate',
      'email': emailedit.text,
      'mobile_phone': mobilephoneedit.text,
      'user_name': namaedit.text,
      'birth': tanggallahiredit.text,
      'gender': jeniskelaminprofile.text
      // "email": email.text,
      // "password": katasandi.text,
    }).then((response) async {
      var jsonObj = json.decode(response.body);
      print(jsonObj);
      if (response.statusCode == 200) {
        print(jsonObj);

        //  Navigator.pushAndRemoveUntil(
        //                       context,
        //                       MaterialPageRoute(
        //                           builder: (BuildContext context) =>
        //                               HomeScreen()),
        //                       (Route<dynamic> route) => false);
        // // setState(() {
        // //   data = '${jsonObj['data']['verification_code']}';
        // //   statusinactive = '${jsonObj['data']['status']}';
        // //   namauser = '${jsonObj['data']['user_name']}';
        // //   emailuser = '${jsonObj['data']['email']}';
        // // });
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return WillPopScope(
              onWillPop: () async => false,
              child: Dialog(
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
                              Text('Berhasil!!!',
                                  style: TextStyle(
                                      fontFamily: 'Comfortaa',
                                      fontSize: 13,
                                      fontWeight: FontWeight.w900)),
                              SizedBox(
                                height: 10,
                              ),
                              Text(' Data Anda Berhasil DiUpdate',
                                  style: TextStyle(
                                      fontFamily: 'Comfortaa',
                                      fontSize: 13,
                                      fontWeight: FontWeight.w900)),
                              //
                              //
                              SizedBox(
                                height: 10.h,
                              ),
                              //
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              General()));
                                },
                                child: Container(
                                  height: 30.h,
                                  width: 150.w,
                                  decoration: BoxDecoration(
                                      color: Colors.deepPurple[400],
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Center(
                                      child: Text('Lanjutkan',
                                          style: TextStyle(
                                              fontFamily: 'Comfortaa',
                                              fontSize: 13,
                                              fontWeight: FontWeight.w900,
                                              color: Colors.white))),
                                ),
                              )
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
              ),
            );
          },
        );
      } else {}
    });
  }
  //
  // String dataprofile;
  // String editnama;
  // String editemail;
  // String editmobilphone;
  // String edittanggallahir;
  // Future<void> setState(VoidCallback fn) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   dataprofile = prefs.getString('dataprofile');
  //   //
  //   final prefs2 = await SharedPreferences.getInstance();
  //   editnama = prefs2.getString('nama') ?? '';
  //   //
  //   final prefs3 = await SharedPreferences.getInstance();
  //   editemail = prefs3.getString('email') ?? '';
  //   //
  //   final prefs4 = await SharedPreferences.getInstance();
  //   editmobilphone = prefs4.getString('mobilephone') ?? '';
  //   //
  //   final prefs5 = await SharedPreferences.getInstance();
  //   edittanggallahir = prefs5.getString('tanggallahir') ?? '';
  //   //
  //   super.setState(fn);
  // }

  bool nama = true;
  bool email = true;
  bool nomorponsel = true;
  bool tanggallahir = true;
  bool jeniskelamin = true;
  //
  TextEditingController namaedit = TextEditingController();
  TextEditingController emailedit = TextEditingController();
  TextEditingController mobilephoneedit = TextEditingController();
  TextEditingController tanggallahiredit = TextEditingController();
  TextEditingController jeniskelaminprofile = TextEditingController();
  //
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  //
  DateTime _date = DateTime.now();
  //
  Future<Null> selectDate(BuildContext context) async {
    DateTime _datepicker = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: DateTime(1947),
        lastDate: DateTime(2030));
    if (_datepicker != null && _datepicker != _date) {
      setState(() {
        _date = _datepicker;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // namaedit.text = '${widget.nama}';
    // emailedit.text = '${widget.email}';
    // mobilephoneedit.text = '${widget.mobilephone}';
    // tanggallahiredit.text = datainformation;
    // mobilephoneedit.text = widget.mobilephone;
    return Stack(
      children: [
        Form(
          key: formkey,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.deepPurple[400],
              automaticallyImplyLeading: false,
              leading: Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.white,
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
                  "Pengaturan / General",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Comfortaa',
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ),
              centerTitle: false,
              titleSpacing: 0,
              leadingWidth: 35,
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 150.h,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.black12,
                    child: Center(
                        child: Stack(
                      children: [
                        Container(
                          height: 100.h,
                          width: 100.w,
                          // color: Colors.red,
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(widget.photo),
                          ),
                        ),
                        Positioned(
                          top: 70,
                          left: 65,
                          child: Container(
                              height: 35,
                              width: 35,
                              child: CircleAvatar(
                                backgroundColor: Colors.yellow[800],
                                child: Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                ),
                              )),
                        ),
                      ],
                    )),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 10.w, right: 10.w, top: 20.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Nama',
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Comfortaa',
                              color: Colors.deepPurple[400],
                              fontWeight: FontWeight.w900),
                        ),
                        //
                        SizedBox(height: 5.h),
                        //
                        Container(
                          height: 50.h,
                          decoration: BoxDecoration(
                            // color: Colors.yellow,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.grey[400]),
                          ),
                          child: TextFormField(
                            // autofocus: true,
                            controller: namaedit,
                            decoration: InputDecoration(
                                hintText: widget.nama,
                                hintStyle: TextStyle(
                                    fontFamily: 'Comfortaa',
                                    color: Colors.black,
                                    fontSize: 15.sp),
                                // prefixIcon: Icon(
                                //   Icons.perm_identity_rounded,
                                //   size: 30,
                                //   color: Colors.yellow[800],
                                // ),
                                contentPadding: EdgeInsets.only(left: 20.w),
                                border: InputBorder.none),
                          ),
                        ),
                        //
                        SizedBox(height: 10.h),
                        //
                        Text(
                          'Email',
                          style: TextStyle(
                              fontSize: 15.sp,
                              fontFamily: 'Comfortaa',
                              color: Colors.deepPurple[400],
                              fontWeight: FontWeight.w900),
                        ),
                        //
                        SizedBox(height: 5.h),
                        //
                        Container(
                          height: 50.h,
                          decoration: BoxDecoration(
                            // color: Colors.yellow,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.grey[400]),
                          ),
                          child: TextFormField(
                            // autofocus: true,
                            controller: emailedit,
                            decoration: InputDecoration(
                                hintText: widget.email,
                                hintStyle: TextStyle(
                                    fontFamily: 'Comfortaa',
                                    color: Colors.black,
                                    fontSize: 15.sp),
                                // prefixIcon: Icon(
                                //   Icons.perm_identity_rounded,
                                //   size: 30,
                                //   color: Colors.yellow[800],
                                // ),
                                contentPadding: EdgeInsets.only(left: 20.w),
                                border: InputBorder.none),
                          ),
                        ),
                        // //
                        SizedBox(height: 10.h),
                        //
                        Text(
                          'Nomor Ponsel',
                          style: TextStyle(
                              fontSize: 15.sp,
                              fontFamily: 'Comfortaa',
                              color: Colors.deepPurple[400],
                              fontWeight: FontWeight.w900),
                        ),
                        //
                        SizedBox(height: 5.h),
                        //
                        Container(
                          height: 50.h,
                          decoration: BoxDecoration(
                            // color: Colors.yellow,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.grey[400]),
                          ),
                          child: TextFormField(
                            controller: mobilephoneedit,
                            decoration: InputDecoration(
                                hintText: widget.mobilephone,
                                hintStyle: TextStyle(
                                    fontFamily: 'Comfortaa',
                                    color: Colors.black,
                                    fontSize: 15.sp),
                                // prefixIcon: Icon(
                                //   Icons.perm_identity_rounded,
                                //   size: 30,
                                //   color: Colors.yellow[800],
                                // ),
                                contentPadding: EdgeInsets.only(left: 20.w),
                                border: InputBorder.none),
                          ),
                        ),
                        //
                        SizedBox(height: 10.h),
                        //
                        Text(
                          'Tanggal Lahir',
                          style: TextStyle(
                              fontSize: 15.sp,
                              fontFamily: 'Comfortaa',
                              color: Colors.deepPurple[400],
                              fontWeight: FontWeight.w900),
                        ),
                        //
                        SizedBox(height: 5.h),
                        ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            // scrollDirection: Axis.horizontal,
                            itemCount: data1 == null ? 0 : data1.length,
                            itemBuilder: (BuildContext context, int i) {
                              return GestureDetector(
                                onTap: () {
                                  selectDate(context);
                                },
                                child: Container(
                                  height: 50.h,
                                  decoration: BoxDecoration(
                                    // color: Colors.yellow,
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(color: Colors.grey[400]),
                                  ),
                                  child: TextFormField(
                                    // initialValue: 'sssssssssssssssss',
                                    // autofocus: true,
                                    controller: tanggallahiredit,
                                    decoration: InputDecoration(
                                        enabled: false,
                                        hintText: data1[i]['birth'],
                                        hintStyle: TextStyle(
                                            fontFamily: 'Comfortaa',
                                            color: Colors.black,
                                            fontSize: 15.sp),
                                        // prefixIcon: Icon(
                                        //   Icons.perm_identity_rounded,
                                        //   size: 30,
                                        //   color: Colors.yellow[800],
                                        // ),
                                        contentPadding:
                                            EdgeInsets.only(left: 20.w),
                                        border: InputBorder.none),
                                  ),
                                ),
                              );
                            }),
                        //
                        SizedBox(height: 10.h),
                        //
                        Text(
                          'Jenis Kelamin',
                          style: TextStyle(
                              fontSize: 15.sp,
                              fontFamily: 'Comfortaa',
                              color: Colors.deepPurple[400],
                              fontWeight: FontWeight.w900),
                        ),
                        //
                        SizedBox(height: 5.h),
                        //
                        ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            // scrollDirection: Axis.horizontal,
                            itemCount: data1 == null ? 0 : data1.length,
                            itemBuilder: (BuildContext context, int i) {
                              return Container(
                                height: 50.h,
                                decoration: BoxDecoration(
                                  // color: Colors.yellow,
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(color: Colors.grey[400]),
                                ),
                                child: TextFormField(
                                  // initialValue: 'sssssssssssssssss',
                                  // autofocus: true,
                                  controller: jeniskelaminprofile,
                                  decoration: InputDecoration(
                                      hintText: data1[i]['gender_name'],
                                      hintStyle: TextStyle(
                                          fontFamily: 'Comfortaa',
                                          color: Colors.black,
                                          fontSize: 15.sp),
                                      // prefixIcon: Icon(
                                      //   Icons.perm_identity_rounded,
                                      //   size: 30,
                                      //   color: Colors.yellow[800],
                                      // ),
                                      contentPadding:
                                          EdgeInsets.only(left: 20.w),
                                      border: InputBorder.none),
                                ),
                              );
                            }),
                        //
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: GestureDetector(
                            onTap: () {
                              addData();
                            },
                            child: Container(
                              child: Center(
                                child: Text(
                                  'Simpan',
                                  style: TextStyle(
                                      fontFamily: 'Comfortaa',
                                      color: Colors.white,
                                      fontSize: 15.sp),
                                ),
                              ),
                              height: 30.h,
                              width: 150.w,
                              decoration: BoxDecoration(
                                  color: Colors.deepPurple[400],
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                          ),
                        )
                        // Container(
                        //   height: 50.h,
                        //   decoration: BoxDecoration(
                        //     // color: Colors.yellow,
                        //     borderRadius: BorderRadius.circular(15),
                        //     border: Border.all(color: Colors.grey[400]),
                        //   ),
                        //   child: TextFormField(
                        //     autofocus: true,
                        //     controller: tanggallahiredit==tanggallahirinformation[1]['birth'],
                        //     decoration: InputDecoration(
                        //         hintText: 'Tulis Tanggal Lahir Baru Kamu',
                        //         hintStyle: TextStyle(
                        //             fontFamily: 'Comfortaa',
                        //             color: Colors.grey[400],
                        //             fontSize: 12),
                        //         // prefixIcon: Icon(
                        //         //   Icons.perm_identity_rounded,
                        //         //   size: 30,
                        //         //   color: Colors.yellow[800],
                        //         // ),
                        //         contentPadding: EdgeInsets.only(left: 20.w),
                        //         border: InputBorder.none),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
