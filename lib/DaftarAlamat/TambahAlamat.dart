import 'dart:convert';

import 'package:dinamika/PROPINSI/bottomsheetalamatutama.dart';
import 'package:dinamika/PROPINSI/bottomsheetdaerah.dart';
import 'package:dinamika/PROPINSI/bottomsheetkodepos.dart';
import 'package:dinamika/PROPINSI/bottomsheetkota.dart';
import 'package:dinamika/PROPINSI/bottomsheetprovinsi.dart';
import 'package:dinamika/PROPINSI/bottomsheetwilayah.dart';
import 'package:dinamika/PROPINSI/provinsi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'DaftarAlamat.dart';

class TambahAlamat extends StatefulWidget {
  @override
  _TambahAlamatState createState() => _TambahAlamatState();
}

class _TambahAlamatState extends State<TambahAlamat> {
  @override
  //
  String customerid;
  String district;
  String yes;
  addData() async {
    final prefs = await SharedPreferences.getInstance();
    customerid = prefs.getString('customer');
    //
     final prefs1 = await SharedPreferences.getInstance();
    district = prefs1.getString('idpost');
    //
      final prefs2 = await SharedPreferences.getInstance();
    yes = prefs.getString('yes');
    // var random = randomAlphaNumeric(32).toLowerCase();
    // String myUrl = "http://45.13.132.61:3000/reseller/signup";
    String myUrl = "https://carinih.ws/api/user_account/add_customerAddress";
    http.post(Uri.parse(Uri.encodeFull(myUrl)), headers: {
      'Accept': 'application/json',
      // "imei": "123456"
    }, body: {
      "customer_id": '$customerid',
      "address":alamat.text,
      "district_id":'$district',
      'is_pickup_address':'true',
      'is_return_address':'true',
      'as_primary':'$yes',
    }).then((response) async {
      var jsonObj = json.decode(response.body);
     
      // print(jsonObj);
      if (response.statusCode == 200) {
        print(jsonObj);
        // customerid = jsonObj['customer_id'];
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context)=>DaftarAlamat()));

        //  Navigator.pushAndRemoveUntil(
        //                       context,
        //                       MaterialPageRoute(
        //                           builder: (BuildContext context) =>
        //                               HomeScreen()),
        //                       (Route<dynamic> route) => false);
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
                    Text('Maaf!!!',style: TextStyle(fontFamily: 'Comfortaa',fontSize: 13,fontWeight: FontWeight.w900)),
                    SizedBox(height: 10,),
                    Text('Masukkan Data Anda Dengan Benar',style: TextStyle(fontFamily: 'Comfortaa',fontSize: 13,fontWeight: FontWeight.w900)),
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
  }

  //
// String dataprofile;
// String dataprofile1;
//   Future<void> setState(VoidCallback fn) async {
//     final prefs = await SharedPreferences.getInstance();
//     dataprofile = prefs.getString('list');
//     //
//     final prefs1 = await SharedPreferences.getInstance();
//     dataprofile1 = prefs1.getString('pilihan');
//     super.setState(fn);
//   }
  String dataprofile;
  String kota;
  String wilayah;
  String daerah;
  String kodepos;
  String yes1;
  String no;
  _loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      dataprofile = (prefs.getString('list') ?? '');
      kota = (prefs.getString('kota') ?? '');
      wilayah = (prefs.getString('wilayah') ?? '');
      daerah = (prefs.getString('daerah') ?? '');
      kodepos = (prefs.getString('kodepos') ?? '');
      yes1 = (prefs.getString('yes') ?? '');
      no = (prefs.getString('no') ?? '');
      //  dataprofile1 = (prefs.getString('pilihan') ?? '');
      // _provinsi = (prefs.getString('provinsi') ?? '');
      // _name = (prefs.getString('name'));
      // _kecamatan = (prefs.getString('kecamatan'));
      // namaregister = (prefs.getString('nama'));
      // nomorhpregister = (prefs.getString('nomorhp'));
      // alamatregister = (prefs.getString('alamat'));
    });
  }

  //
  void initState() {
    _loadCounter();
    super.initState();
  }

  //
  TextEditingController propinsi = TextEditingController();
  TextEditingController formkota = TextEditingController();
  TextEditingController formwilayah = TextEditingController();
  TextEditingController formdaerah = TextEditingController();
  TextEditingController kodepost = TextEditingController();
  TextEditingController alamat = TextEditingController();
  TextEditingController alamat_utama = TextEditingController();
  TextEditingController alamat_utama1 = TextEditingController();
  //
  Future<bool> _willPopCallback() async {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext context) => DaftarAlamat()));
  }

  //
  bool _disabled = false;
  Widget build(BuildContext context) {
    propinsi.text = dataprofile;
    formkota.text = kota;
    formwilayah.text = wilayah;
    formdaerah.text = daerah;
    kodepost.text = kodepos;
     alamat_utama.text = yes;
       alamat_utama1.text = no;

    return Material(
      child: Stack(
        children: [
          Stack(
            children: [
              WillPopScope(
                onWillPop: _willPopCallback,
                child: Scaffold(
                  appBar: AppBar(
                    backgroundColor: Colors.deepPurple[400],
                    automaticallyImplyLeading: false,
                    leading: Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: 18,
                        ),
                        onPressed: () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    DaftarAlamat())),
                      ),
                    ),
                    title: GestureDetector(
                      onTap: () {
                        // getJsonData();
                      },
                      child: Text(
                        "Pengaturan/ Daftar Alamat/Tambah Alamat",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Comfortaa',
                            fontWeight: FontWeight.w900,
                            fontSize: 12),
                      ),
                    ),
                    centerTitle: false,
                    titleSpacing: 0,
                    leadingWidth: 35,
                  ),
                  body: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10.0.w),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 30.h),
                              Text('Daftar Alamat',
                                  style: TextStyle(
                                      fontFamily: 'Comfortaa',
                                      fontWeight: FontWeight.w900,
                                      color: Colors.deepPurple[400],
                                      fontSize: 15.sp)),
                              Text('Alamat Penerima Pesanan',
                                  style: TextStyle(
                                      fontFamily: 'Comfortaa',
                                      fontWeight: FontWeight.w300,
                                      fontSize: 15.sp)),
                              //
                              SizedBox(
                                height: 20,
                              ),
                              //
                              GestureDetector(
                                onTap: () {
                                  // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>Propinsi()));
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (context) => bottomsheet());
                                },
                                child: Container(
                                    margin: EdgeInsets.only(right: 15.w),
                                    //  width: 330.w,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white,
                                        border:
                                            Border.all(color: Colors.black26)),
                                    child: TextFormField(
                                      controller: propinsi,
                                      enabled: false,
                                      decoration: InputDecoration(
                                        hintText:
                                            dataprofile.contains(dataprofile)
                                                ? 'Propinsi'
                                                : dataprofile,
                                        border: InputBorder.none,
                                        suffixIcon: Icon(
                                          Icons.arrow_drop_down_outlined,
                                        ),
                                        contentPadding: EdgeInsets.only(
                                            top: 15.h, left: 14.w),
                                      ),
                                      style: TextStyle(
                                          fontSize: 13.sp,
                                          fontFamily: 'Comfortaa'),
                                    )),
                              ),
                              //
                              SizedBox(
                                height: 10,
                              ),
                              //
                              GestureDetector(
                                onTap: () {
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (context) => bottomsheetkota());
                                },
                                child: Container(
                                    margin: EdgeInsets.only(right: 15.w),
                                    //  width: 330.w,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white,
                                        border:
                                            Border.all(color: Colors.black26)),
                                    child: TextFormField(
                                      controller: formkota,
                                      enabled: false,
                                      decoration: InputDecoration(
                                        hintText:
                                            kota.contains(kota) ? 'Kota' : kota,
                                        border: InputBorder.none,
                                        suffixIcon: Icon(
                                          Icons.arrow_drop_down_outlined,
                                        ),
                                        contentPadding: EdgeInsets.only(
                                            top: 15.h, left: 14.w),
                                      ),
                                      style: TextStyle(
                                          fontSize: 13.sp,
                                          fontFamily: 'Comfortaa'),
                                    )),
                              ),
                              //
                              SizedBox(
                                height: 10,
                              ),
                              //
                              GestureDetector(
                                onTap: () {
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (context) =>
                                          bottomsheetwilayah());
                                },
                                child: Container(
                                    margin: EdgeInsets.only(right: 15.w),
                                    //  width: 330.w,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white,
                                        border:
                                            Border.all(color: Colors.black26)),
                                    child: TextFormField(
                                      controller: formwilayah,
                                      enabled: false,
                                      decoration: InputDecoration(
                                        hintText: wilayah.contains(wilayah)
                                            ? 'wilayah'
                                            : wilayah,
                                        border: InputBorder.none,
                                        suffixIcon: Icon(
                                          Icons.arrow_drop_down_outlined,
                                        ),
                                        contentPadding: EdgeInsets.only(
                                            top: 15.h, left: 14.w),
                                      ),
                                      style: TextStyle(
                                          fontSize: 13.sp,
                                          fontFamily: 'Comfortaa'),
                                    )),
                              ),
                              //
                              SizedBox(
                                height: 10,
                              ),
                              //
                              GestureDetector(
                                onTap: () {
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (context) =>
                                          bottomsheetdaerah());
                                },
                                child: Container(
                                    margin: EdgeInsets.only(right: 15.w),
                                    //  width: 330.w,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white,
                                        border:
                                            Border.all(color: Colors.black26)),
                                    child: TextFormField(
                                      controller: formdaerah,
                                      enabled: false,
                                      decoration: InputDecoration(
                                        hintText: daerah.contains(daerah)
                                            ?'Daerah'
                                            : daerah,
                                        border: InputBorder.none,
                                        suffixIcon: Icon(
                                          Icons.arrow_drop_down_outlined,
                                        ),
                                        contentPadding: EdgeInsets.only(
                                            top: 15.h, left: 14.w),
                                      ),
                                      style: TextStyle(
                                          fontSize: 13.sp,
                                          fontFamily: 'Comfortaa'),
                                    )),
                              ),
                              //
                              SizedBox(
                                height: 10,
                              ),
                              //
                              GestureDetector(
                                onTap: () {
                                  // showModalBottomSheet(
                                  //     context: context,
                                  //     builder: (context) =>
                                  //         bottomsheetkodepos());
                                },
                                child: Container(
                                    margin: EdgeInsets.only(right: 15.w),
                                    //  width: 330.w,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white,
                                        border:
                                            Border.all(color: Colors.black26)),
                                    child: TextFormField(
                                      controller: kodepost,
                                      enabled: false,
                                      decoration: InputDecoration(
                                        hintText: kodepos.contains(kodepos)
                                            ? 'Kodepos'
                                            : kodepos,
                                        border: InputBorder.none,
                                        // suffixIcon: Icon(
                                        //   Icons.arrow_drop_down_outlined,
                                        // ),
                                        contentPadding: EdgeInsets.only(
                                            top: 0.h, left: 14.w),
                                      ),
                                      style: TextStyle(
                                          fontSize: 13.sp,
                                          fontFamily: 'Comfortaa'),
                                    )),
                              ),
                              //
                              SizedBox(
                                height: 10,
                              ),
                              //
                              Container(
                                  margin: EdgeInsets.only(right: 15.w),
                                  //  width: 330.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                      border:
                                          Border.all(color: Colors.black26)),
                                  child: TextFormField(
                                    controller: alamat,
                                    minLines:
                                        6, // any number you need (It works as the rows for the textarea)
                                    keyboardType: TextInputType.multiline,
                                    maxLines: null,
                                    // enabled: false,
                                    decoration: InputDecoration(
                                      hintText: 'Alamat',
                                      border: InputBorder.none,
                                      // suffixIcon: Icon(
                                      //   Icons.arrow_drop_down_outlined,
                                      // ),
                                      contentPadding: EdgeInsets.only(
                                          top: 15.h, left: 14.w),
                                    ),
                                    style: TextStyle(
                                        fontSize: 13.sp,
                                        fontFamily: 'Comfortaa'),
                                  )),
                              //
                              SizedBox(
                                height: 10,
                              ),
                              //
                              // GestureDetector(
                              //   onTap: (){
                              //     showModalBottomSheet(
                              //         context: context,
                              //         builder: (context) =>
                              //             bottomsheetalamatutama());
                              //   },
                              //   child: yes.contains(yes)?Container(
                              //       margin: EdgeInsets.only(right: 15.w),
                              //       //  width: 330.w,
                              //       decoration: BoxDecoration(
                              //           borderRadius: BorderRadius.circular(10),
                              //           color: Colors.white,
                              //           border:
                              //               Border.all(color: Colors.black26)),
                              //       child: TextFormField(
                              //         controller: alamat_utama,
                              //         enabled: false,
                              //         decoration: InputDecoration(
                              //           hintText: yes.contains(yes)
                              //               ? 'Dijadikan Alamat Utama'
                              //               : yes,
                              //           border: InputBorder.none,
                              //           suffixIcon: Icon(
                              //             Icons.arrow_drop_down_outlined,
                              //           ),
                              //           contentPadding: EdgeInsets.only(
                              //               top: 15.h, left: 14.w),
                              //         ),
                              //         style: TextStyle(
                              //             fontSize: 13.sp,
                              //             fontFamily: 'Comfortaa'),
                              //       )):Container(
                              //       margin: EdgeInsets.only(right: 15.w),
                              //       //  width: 330.w,
                              //       decoration: BoxDecoration(
                              //           borderRadius: BorderRadius.circular(10),
                              //           color: Colors.white,
                              //           border:
                              //               Border.all(color: Colors.black26)),
                              //       child: TextFormField(
                              //         controller: alamat_utama1,
                              //         enabled: false,
                              //         decoration: InputDecoration(
                              //           hintText: no.contains(no)
                              //               ? 'Dijadikan Alamat Utama'
                              //               : no,
                              //           border: InputBorder.none,
                              //           suffixIcon: Icon(
                              //             Icons.arrow_drop_down_outlined,
                              //           ),
                              //           contentPadding: EdgeInsets.only(
                              //               top: 15.h, left: 14.w),
                              //         ),
                              //         style: TextStyle(
                              //             fontSize: 13.sp,
                              //             fontFamily: 'Comfortaa'),
                              //       )),
                              // ),
                              SwitchListTile(
  value: _disabled,
  onChanged: (bool value) async {
    final preff2 =
                                    await SharedPreferences.getInstance();
                                preff2.setString(
                                    'yes', '$value'.contains('true')?'Yes':'No');
                                    //  Navigator.pushReplacement(
                                    // context,
                                    // MaterialPageRoute(
                                    //     builder: (BuildContext context) =>
                                    //         TambahAlamat()));
    print('$value'.contains('true')?'Yes':'No');
    setState((){ 
      _disabled = !_disabled; 
      });
  },
  title: new Text('Dijadikan ALamat Utama',style: TextStyle(
                                    fontFamily: 'Comfortaa',
                                    fontWeight: FontWeight.w900,
                                    color: Colors.deepPurple[400],
                                    fontSize: 13.sp)),
)
                            ],
                          ),
                        ),
                      ),
                      //
                      //   Align(
                      //     alignment: Alignment.bottomCenter,
                      //   child: Container(
                      //     margin: EdgeInsets.only(bottom:30.h),
                      //     height:30.h,
                      //   width: 150.w,
                      //  decoration: BoxDecoration(
                      //    color: Colors.deepPurple[400],
                      //    borderRadius:BorderRadius.circular(10),
                      //  ),
                      //  child: Center(child: Text('Simpan',style: TextStyle(fontFamily: 'Comfortaa',color: Colors.white,fontWeight: FontWeight.w700),)),
                      //   ),
                      //   )
                    ],
                  ),
                ),
              ),
              Container(
                height: ScreenUtil().setHeight(30.h),
                color: Colors.deepPurple[200],
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              onTap: (){
                addData();
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 30.h),
                height: 30.h,
                width: 150.w,
                decoration: BoxDecoration(
                  color: Colors.deepPurple[400],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                    child: Text(
                  'Simpan',
                  style: TextStyle(
                      fontFamily: 'Comfortaa',
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
