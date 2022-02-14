import 'dart:convert';

import 'package:dinamika/PROPINSI/bottomsheetalamatutamaedit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'DaftarAlamat.dart';
import 'TambahAlamat.dart';
import 'package:http/http.dart' as http;

class EditAlamat extends StatefulWidget{
  @override
  String prov;
  String kota;
  String wilayah;
  String daerah;
  String kodepos;
  String alamat;
  String utama;
  String asprimary;
  String idalamat;
  
// Get Key Data
  EditAlamat(
      {Key key,
      this.prov,
      this.kota,
      this.wilayah,
      this.daerah,
      this.kodepos,
      this.alamat,
      this.asprimary,
      this.idalamat
      // this.utama,
      })
      : super(key: key);
  _EditAlamatState createState() => _EditAlamatState();
}

class _EditAlamatState extends State<EditAlamat> {
  //
  String district;
  String utamayes;
  String utamano;
 addData() async {
    final prefs1 = await SharedPreferences.getInstance();
    district = prefs1.getString('idpost');
    //
     final prefs2 = await SharedPreferences.getInstance();
    utamayes = prefs2.getString('yes');
    //
     final prefs3 = await SharedPreferences.getInstance();
    utamano = prefs3.getString('no');
    // var random = randomAlphaNumeric(32).toLowerCase();
    // String myUrl = "http://45.13.132.61:3000/reseller/signup";
    String myUrl = "https://carinih.ws/api/user_account/update_customerAddress";
    http.post(Uri.parse(Uri.encodeFull(myUrl)), headers: {
      'Accept': 'application/json',
      // "imei": "123456"
    }, body: {
      // 'id':'${widget.idalamat}',
      // "address":'${widget.alamat}' ,
      // // "district_id":'$district' ,
      // 'is_pickup_address':'true',
      // 'is_return_address':'true',
      'as_primary':'Yes',
    }).then((response) async {
      var jsonObj = json.decode(response.body);

      // print(jsonObj);
      if (response.statusCode == 200) {
        // print(jsonObj['customer_id']);
        // setState(() {
        //   pengenalid = jsonObj['customer_id'];
        //   _incrementCounter();
        // });
        print(jsonObj);

        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (BuildContext context) => DaftarAlamat()),
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
   String yes;
  String no;
   bool _disabled = false;
     bool _enabled = true;
     //
     String alamatutama;
_loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      alamatutama = (prefs.getString('yes') ?? '');
      // kota = (prefs.getString('kota') ?? '');
      // wilayah = (prefs.getString('wilayah') ?? '');
      // daerah = (prefs.getString('daerah') ?? '');
      // kodepos = (prefs.getString('kodepos') ?? '');
      // yes = (prefs.getString('yes') ?? '');
      // no = (prefs.getString('No') ?? '');
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
  @override
void initState(){
  _loadCounter();
  super.initState();
}
  //
     //
  @override
  Widget build(BuildContext context){
    return Scaffold(
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
                        "Ubah ALamat",
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
                  body: Padding(
                    padding: EdgeInsets.only(left: 10.0.w),
                    child: ListView(
                      children: [
                          SizedBox(height: 30.h),
                        Text(widget.idalamat,style: TextStyle(
                                    fontFamily: 'Comfortaa',
                                    fontWeight: FontWeight.w900,
                                    color: Colors.deepPurple[400],
                                    fontSize: 15.sp)),
                                    //
                                      SizedBox(height: 10.h),
                                    //
                                     Text('Ubah Alamat Kamu',
                                style: TextStyle(
                                    fontFamily: 'Comfortaa',
                                    fontWeight: FontWeight.w300,
                                    fontSize: 15.sp)),
                                    //
                                    SizedBox(height: 10.h),
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
                                    // controller: propinsi,
                                    enabled: false,
                                    decoration: InputDecoration(
                                      hintText: widget.prov,
                                          // dataprofile.contains(dataprofile)
                                          //     ? 'Propinsi'
                                          //     : dataprofile,
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
                                              //
                                    SizedBox(height: 10.h),
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
                                    // controller: propinsi,
                                    enabled: false,
                                    decoration: InputDecoration(
                                      hintText: widget.kota,
                                          // dataprofile.contains(dataprofile)
                                          //     ? 'Propinsi'
                                          //     : dataprofile,
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
                                              //
                                    SizedBox(height: 10.h),
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
                                    // controller: propinsi,
                                    enabled: false,
                                    decoration: InputDecoration(
                                      hintText: widget.wilayah,
                                          // dataprofile.contains(dataprofile)
                                          //     ? 'Propinsi'
                                          //     : dataprofile,
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
                                              //
                                    SizedBox(height: 10.h),
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
                                    // controller: propinsi,
                                    enabled: false,
                                    decoration: InputDecoration(
                                      hintText: widget.daerah,
                                          // dataprofile.contains(dataprofile)
                                          //     ? 'Propinsi'
                                          //     : dataprofile,
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
                                  //
                                    SizedBox(height: 10.h),
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
                                    // controller: propinsi,
                                    enabled: false,
                                    decoration: InputDecoration(
                                      hintText: widget.kodepos,
                                          // dataprofile.contains(dataprofile)
                                          //     ? 'Propinsi'
                                          //     : dataprofile,
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
                                  //
                                    SizedBox(height: 10.h),
                                    //
                        Container(
                              margin: EdgeInsets.only(right: 15.w),
                              //  width: 330.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                  border:
                                      Border.all(color: Colors.black26)),
                              child: TextField(
                                
                                // controller: alamat,
                                minLines:
                                    6, // any number you need (It works as the rows for the textarea)
                                keyboardType: TextInputType.text,
                                maxLines: null,
                                // enabled: false,
                                decoration: InputDecoration(
                                  hintText: widget.alamat,
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
                              SizedBox(height: 10.h,),
                              //
                          //      GestureDetector(
                          //   onTap: (){
                          //     showModalBottomSheet(
                          //         context: context,
                          //         builder: (context) =>
                          //             bottomsheetalamatutamaedit());
                          //   },
                          //   child: Container(
                          //       margin: EdgeInsets.only(right: 15.w),
                          //       //  width: 330.w,
                          //       decoration: BoxDecoration(
                          //           borderRadius: BorderRadius.circular(10),
                          //           color: Colors.white,
                          //           border:
                          //               Border.all(color: Colors.black26)),
                          //       child: TextFormField(
                          //         // controller: alamat_utama,
                          //         enabled: false,
                          //         decoration: InputDecoration(
                          //           hintText: 'Dijadikan Alamat Utama',
                                        
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
                          //       ))
                          // ),
                         widget.asprimary.contains('Yes')?SwitchListTile(
  value: _enabled,
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
      _enabled = !_enabled; 
      });
  },
  title: new Text('Dijadikan ALamat Utama',style: TextStyle(
                                    fontFamily: 'Comfortaa',
                                    fontWeight: FontWeight.w900,
                                    color: Colors.deepPurple[400],
                                    fontSize: 13.sp)),
):SwitchListTile(
  value: _disabled,
  onChanged: (bool value) async {
    final preff2 =
                                    await SharedPreferences.getInstance();
                                preff2.setString(
                                    'no', '$value'.contains('false')?'No':'Yes');
                                    //  Navigator.pushReplacement(
                                    // context,
                                    // MaterialPageRoute(
                                    //     builder: (BuildContext context) =>
                                    //         TambahAlamat()));
    print('$value'.contains('false')?'No':'Yes');
    setState((){ 
      _disabled = !_disabled; 
      });
  },
  title: new Text('Dijadikan ALamat Utama',style: TextStyle(
                                    fontFamily: 'Comfortaa',
                                    fontWeight: FontWeight.w900,
                                    color: Colors.deepPurple[400],
                                    fontSize: 13.sp)),
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
                  ),
    );
  }
}