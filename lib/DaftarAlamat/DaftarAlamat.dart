import 'dart:convert';
import 'package:dinamika/DaftarAlamat/EditAlamat.dart';
import 'package:dinamika/PROFILE/profile.dart';
import 'package:http/http.dart'as http;
import 'package:dinamika/DaftarAlamat/TambahAlamat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DaftarAlamat extends StatefulWidget {
  //    String idcustomer;
  // DaftarAlamat({Key key,this.idcustomer}) : super(key: key);
  @override
  _DaftarAlamatState createState() => _DaftarAlamatState();
}

class _DaftarAlamatState extends State<DaftarAlamat> {
  @override
  //
  // final String myUrl1 = "https://carinih.ws/api/user_account/customer_address/";
  List data1;

  //
  String pengenalid;
   getDataAlamat() async { 
    final prefs = await SharedPreferences.getInstance();
   pengenalid = prefs.getString('customer');
    var response = await http.get(Uri.parse(Uri.encodeFull('https://carinih.ws/api/user_account/customer_address/$pengenalid')),
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
  //  final String myUrl = "https://carinih.ws/api/user_account/general";
  List data;

  //
  String idprofile;
  Future<String> getDataProfile() async {
     final prefs = await SharedPreferences.getInstance();
    idprofile = prefs.getString('datainformation');
    var response = await http.get(Uri.parse(Uri.encodeFull("https://carinih.ws/api/user_account/general/$idprofile")),
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
  @override
  void initState() {
      getDataAlamat();
      getDataProfile();
    // _loadCounter();
    super.initState();
  }
  //
  String idaddress;
  //   delete() async {
  //   _loadCounter();
  //    final prefs = await SharedPreferences.getInstance();
  //   idaddress = prefs.getString('iddelete');
  //   var response = await http.delete(Uri.parse(Uri.encodeFull("https://carinih.ws/api/user_account/delete_customerAddress/$iddelete")),
  //       headers: {"Accept": "application/json"});
  //   print(response.body);
  //   //
  //   // setState(() {
  //   //   var converDataToJson = json.decode(response.body);
  //   //   data = converDataToJson['data'];
  //   // });
  //   return "Success";
  // }
//
// String provinsi;
//  _loadCounter() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     setState(() {
//       provinsi = (prefs.getString('list') ?? '');
     
//       //  dataprofile1 = (prefs.getString('pilihan') ?? '');
//       // _provinsi = (prefs.getString('provinsi') ?? '');
//       // _name = (prefs.getString('name'));
//       // _kecamatan = (prefs.getString('kecamatan'));
//       // namaregister = (prefs.getString('nama'));
//       // nomorhpregister = (prefs.getString('nomorhp'));
//       // alamatregister = (prefs.getString('alamat'));
//     });
//   }

//
// 
String iddelete;
  _loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      iddelete = (prefs.getString('iddelete') ?? '');
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
  Future<bool> _willPopCallback() async {
       Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      Profile()));
   }
  //
  Widget build(BuildContext context) {
    return Stack(
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
                  onPressed: () =>  Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      Profile()))
                ),
              ),
              title: GestureDetector(
                onTap: () {
                  // getJsonData();
                },
                child: Text(
                  "Pengaturan/ Daftar Alamat",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Comfortaa',
                      fontWeight: FontWeight.w900,
                      fontSize: 15),
                ),
              ),
              centerTitle: false,
              titleSpacing: 0,
              leadingWidth: 35,
            ),
            body: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: 120.h,
                        width: double.infinity,
                        color: Colors.black12,
                        child: Padding(
                          padding: EdgeInsets.only(right:60.w),
                          child: Center(
                            child: Container(
                                width: 250.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.white,
                                  // border: Border.all(color:Colors.grey)
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      spreadRadius: 2,
                                      blurRadius: 3,
                                      offset: Offset(2, 5), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    hintText: 'Cari Alamat',
                                    border: InputBorder.none,
                                    prefixIcon: Icon(
                                      Icons.search,
                                      color: Colors.grey,
                                    ),
                                    contentPadding: EdgeInsets.only(top: 14.h),
                                  ),
                                  style:
                                      TextStyle(fontSize: 15.sp, fontFamily: 'Comfortaa'),
                                )),
                          ),
                        ),
                      ),
                      //
                        SizedBox(height:20.h),
                      //
                  '$data1'==null?Padding(
                      padding:  EdgeInsets.only(left:20.w,right: 20.w),
                      child:   Text('Daftar alamat kamu saat ini masih kosong. Isi yuk supaya kurir bisa anter barang kamu.',style: TextStyle(fontFamily: 'Comfortaa',fontSize: 12.sp),),
                    ):SizedBox(),
                    //
                    SizedBox(height: 25.h,),
                    //
                           GestureDetector(
                             onTap: () async {
                                 SharedPreferences prefs = await SharedPreferences.getInstance();
                                 prefs.remove('list');
                                 //
                                 SharedPreferences prefs1 = await SharedPreferences.getInstance();
                                 prefs1.remove('kota');
                                 //
                                 SharedPreferences prefs2 = await SharedPreferences.getInstance();
                                 prefs2.remove('wilayah');
                                 //
                                 SharedPreferences prefs3 = await SharedPreferences.getInstance();
                                 prefs3.remove('daerah');
                                 //
                                 SharedPreferences pref4 = await SharedPreferences.getInstance();
                                 pref4.remove('kodepos');
                                 //
                                  SharedPreferences pref5 = await SharedPreferences.getInstance();
                                 pref5.remove('yes');
                               Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>TambahAlamat()));
                             },
                             child: Padding(
                               padding: EdgeInsets.only(left:20.w,right: 20.w),
                               child: Container(
                                   width: 330.w,
                                   decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(10),
                                     color: Colors.grey[200],
                                     border: Border.all(color:Colors.black26)
                                   ),
                                   child: TextFormField(
                                     enabled: false,
                                     decoration: InputDecoration(
                                       hintText: 'Tambah Alamat Toko',
                                       border: InputBorder.none,
                                       suffixIcon: Icon(Icons.add),
                                       contentPadding: EdgeInsets.only(top: 15.h,left:14.w),
                                     ),
                                     style:
                                         TextStyle(fontSize: 13.sp, fontFamily: 'Comfortaa'),
                                   )),
                             ),
                           ),
                           //
                            SizedBox(height: 15.h,),
                           //
                           ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  // scrollDirection: Axis.horizontal,
                                  itemCount: data1 == null ? 0 : data1.length,
                                  itemBuilder: (BuildContext context, int i) {
                                    return Padding(
                                      padding:  EdgeInsets.only(left:20.w,right: 20.w,top:10.h),
                                      child: Container(
                                       decoration: BoxDecoration(
                                          color:Colors.grey[200],
                                         borderRadius:BorderRadius.circular(10.w),
                                         border: Border.all(color:Colors.black12),
                                       ),
                                        child: Stack(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(30.0),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text('Alamat Rumah',style: TextStyle(fontFamily: 'Comfortaa',fontWeight:FontWeight.w800,fontSize: 12.sp),),
                                                      SizedBox(width: 5.w,),
                                                       Text(data1[i]['provinsi'],style: TextStyle(fontFamily: 'Comfortaa',fontWeight:FontWeight.w800,fontSize: 12.sp),),
                                                        SizedBox(width: 5.w,),
                                                      data1[i]['as_primary'].contains('Yes')? Container(
                                                        height: 15.h,
                                                        width: 50.w,
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(10),
                                                          color: Colors.blue[100],
                                                        ),
                                                        child: Expanded(child: Center(child: Text('utama',style: TextStyle(fontFamily: 'Comfortaa',fontWeight:FontWeight.w800,fontSize: 10.sp),)))):Text(''),
                                                    ],
                                                  ),
                                                  //
                                                      SizedBox(height: 10.h,),
                                                  //
                                                 ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  // scrollDirection: Axis.horizontal,
                                  itemCount: data == null ? 0 : data.length,
                                  itemBuilder: (BuildContext context, int i) {
                                    return Text(data[i]['user_name'],style: TextStyle(fontFamily: 'Comfortaa',fontWeight:FontWeight.w900,fontSize: 15.sp,color: Colors.deepPurple[400],));
                                  }
                                                 ),
                                                 
                                                      SizedBox(height: 10.h,),
                                                  //
                                                  Padding(
                                                    padding: EdgeInsets.only(right:20.0),
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text(data1[i]['alamat'],style: TextStyle(fontFamily: 'Comfortaa',color: Colors.black87,fontSize: 12.sp)),
                                                        SizedBox(height: 3.h,),
                                                        Row(
                                                          children: [
                                                            Text(data1[i]['wilayah'],style: TextStyle(fontFamily: 'Comfortaa',color: Colors.black87,fontSize: 12.sp)),
                                                            SizedBox(width:3.w),
                                                            Expanded(child: Text(data1[i]['kota'],style: TextStyle(fontFamily: 'Comfortaa',color: Colors.black87,fontSize: 12.sp))),
                                                            SizedBox(width:3.w),
                                                            Text(data1[i]['post_code'],style: TextStyle(fontFamily: 'Comfortaa',color: Colors.black87,fontSize: 12.sp)),
                                                         Text(data1[i]['id']),
                                                           ],
                                                        ),
                                                           GestureDetector(
                                                             onTap: ()  {
                                                               showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: new Text('Apakah anda yakin ingin menghapus',style: TextStyle(fontSize: 13.sp),),
      // content: new Text('dddddddddd'),
      actions: <Widget>[
        new FlatButton(
          child: new Text("Ya"),
           onPressed: () async {
             String dataid = data1[i]['id'];
             var response = await http.delete(Uri.parse(Uri.encodeFull("https://carinih.ws/api/user_account/delete_customerAddress/$dataid")),
        headers: {"Accept": "application/json"});
    print(dataid);

    //
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>DaftarAlamat()));
    // setState(() {
    //   var converDataToJson = json.decode(response.body);
    //   data = converDataToJson['data'];
    // });
    return "Success";
          },
        ),
        new FlatButton(
          child: Text("Tidak"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
      );
    },
  );

    //                                                            String dataid = data1[i]['id'];
    //                               //                               final preff2 =
    //                               //     await SharedPreferences.getInstance();
    //                               // preff2.setString('iddelete', data1[i]['id']);
    //                               //                              delete();
    //                               //
                                  
    // //  final prefs = await SharedPreferences.getInstance();
    // // idaddress = prefs.getString('iddelete');
    // var response = await http.delete(Uri.parse(Uri.encodeFull("https://carinih.ws/api/user_account/delete_customerAddress/${dataid}")),
    //     headers: {"Accept": "application/json"});
    // print(response.body);
    // //
    // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>DaftarAlamat()));
    // // setState(() {
    // //   var converDataToJson = json.decode(response.body);
    // //   data = converDataToJson['data'];
    // // });
    // return "Success";
                                                             },
                                                             child: Container(
                                                               margin: EdgeInsets.only(left:170.w,top:10.h),
                                                              //  color:
                                                              //  Colors.red,
                                                               child: Row(
                                                                 children: [
                                                                     Icon(Icons.delete,color: Colors.grey),
                                                                   Text('Hapus',style: TextStyle(fontFamily: 'Comfortaa',color: Colors.black54,fontSize: 10.sp)),
                                                                 ],
                                                               ))),
                                                               //
                                                              SizedBox(height: 8.h,),
                                                               //
                                                            GestureDetector(
                                                              onTap:(){
                                                                     Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>EditAlamat(prov:data1[i]['provinsi'],kota:data1[i]['kota'],wilayah:data1[i]['wilayah'],daerah:data1[i]['daerah'],kodepos:data1[i]['post_code'],alamat:data1[i]['alamat'],asprimary:data1[i]['as_primary'],idalamat:data1[i]['id'])));

                                                              },
                                                              child: Container(
                                                        height: 25.h,
                                                        decoration: BoxDecoration(
                                                          color: Colors.deepPurple[400],
                                                          borderRadius:BorderRadius.circular(8)
                                                        ),
                                                        child: Center(child: Text('Ubah Alamat',style: TextStyle(fontFamily: 'Comfortaa',color: Colors.white,fontSize: 12.sp))),
                                                      ),
                                                            ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(height:5.h),
                                //                   Stack(
                                //                     children: [
                                //                       Row(
                                //                         mainAxisAlignment: MainAxisAlignment.end,
                                //                         children:[
                                //                           Icon(Icons.delete,color: Colors.grey),
                                //                         Text('Hapus',style: TextStyle(fontFamily: 'Comfortaa',color: Colors.black54,fontSize: 10.sp))
                                //                         ]
                                //                       ),
                                //                      ListView.builder(
                                //   physics: NeverScrollableScrollPhysics(),
                                //   shrinkWrap: true,
                                //   // scrollDirection: Axis.horizontal,
                                //   itemCount: data1 == null ? 0 : data1.length,
                                //   itemBuilder: (BuildContext context, int i) {
                                //     return Container(
                                //        margin: EdgeInsets.only(left: 200.w),
                                //                      height: 1.8.h,
                                //                       // color: Colors.red,
                                //       child: GestureDetector(
                                //         onTap:() async {
                                //           final preff4 =
                                //     await SharedPreferences.getInstance();
                                // preff4.setString(
                                //     'idaddress', data1[i]['id']);
                                //     deletetambahalamat();
                                //     Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context)=>DaftarAlamat()));
                                //         },
                                //       ),
                                //     );
                                //   }
                                //                      )
                                //                     ],
                                //                   ),
                                                  //
                                                  SizedBox(height: 5.h,),
                                                  //
                                  //                 Stack(
                                  //                   children: [
                                  //                     Container(
                                  //                       height: 25.h,
                                  //                       decoration: BoxDecoration(
                                  //                         color: Colors.deepPurple[400],
                                  //                         borderRadius:BorderRadius.circular(8)
                                  //                       ),
                                  //                       child: Center(child: Text('Ubah Alamat',style: TextStyle(fontFamily: 'Comfortaa',color: Colors.white,fontSize: 12.sp))),
                                  //                     ),
                                  //                     ListView.builder(
                                  // physics: NeverScrollableScrollPhysics(),
                                  // shrinkWrap: true,
                                  // // scrollDirection: Axis.horizontal,
                                  // itemCount: data1 == null ? 0 : data1.length,
                                  // itemBuilder: (BuildContext context, int i) {
                                  //   return GestureDetector(
                                  //     onTap:(){
                                  //         Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>EditAlamat(provinsi:data1[i]['provinsi'],kota:data1[i]['kota'],wilayah:data1[i]['wilayah'],daerah:data1[1]['daerah'],kodepos:data1[i]['post_code'],alamat:data1[i]['alamat'])));
                                                  
                                  //     },
                                  //     child: Container(
                                  //        height: 8.h,
                                  //       //  width:10.w,
                                  //        color: Colors.transparent,
                                  //     ),
                                  //   );
                                  // }
                                  //                     )
                                  //                   ],
                                  //                 )
                                                ],
                                              ),
                                            ),
                                            //
                                             Container(
                                                 margin: EdgeInsets.only(top:20.h),
                                                    height: 25.h,
                                                    width: 15.w,
                                                    decoration: BoxDecoration(
                                                      color: Colors.deepPurple[400],
                                                      borderRadius:BorderRadius.only(topRight: Radius.circular(30),bottomRight: Radius.circular(30))
                                                    ),
                                                  )
                                          ],
                                        )),
                                    );
                                  }
                           )
                          // RaisedButton(onPressed:(){
                          //   getDataAlamat();
                          // } ),
                    ],
                  ),
                ),
               GestureDetector(
                 onTap: (){
                   getDataAlamat();
                 },
                 child: Align(
                    alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: EdgeInsets.only(bottom:30.h),
                    height:30.h,
                  width: 150.w,
                 decoration: BoxDecoration(
                   color: Colors.deepPurple[400],
                   borderRadius:BorderRadius.circular(10),
                 ),
                 child: Center(child: Text('Selesai',style: TextStyle(fontFamily: 'Comfortaa',color: Colors.white,fontWeight: FontWeight.w700),)),
                  ),
                  ),
               )
              ],
            ),
          ),
        ),
        Container(
          height: ScreenUtil().setHeight(30.h),
          color: Colors.deepPurple[200],
        ),
        //
      ],
    );
  }
}
