import 'dart:convert';

import 'package:product/General/editgeneral.dart';
// import 'package:dinamika/PROFILE/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:product/Users/Profile/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class General extends StatefulWidget {
  String gambar;
  String dataid;
  String dataid1;
  String description;
  String hashtag;
  String highlight;
  String name;
  String minimumorder;
  String storename;
// Get Key Data
  General(
      {Key key,
      this.gambar,
      this.dataid,
      this.dataid1,
      this.description,
      this.hashtag,
      this.highlight,
      this.name,
      this.minimumorder,
      this.storename})
      : super(key: key);
  @override
  _GeneralState createState() => _GeneralState();
}

class _GeneralState extends State<General> {
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
//  final String myUrl1 = "https://carinih.ws/api/user_account/information/";
  List data1;
  String datainformation;
  //
  Future<String> getDataBirth() async {
    final prefs = await SharedPreferences.getInstance();
    datainformation = prefs.getString('datainformation');
    var response = await http.get(
        Uri.parse(Uri.encodeFull(
            'https://gopump.id/api/user_account/information/$datainformation')),
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
    getDataProfile();
    getDataBirth();
    super.initState();
  }

  //
  String dataprofile;
  Future<void> setState(VoidCallback fn) async {
    final prefs = await SharedPreferences.getInstance();
    dataprofile = prefs.getString('dataprofile');
    super.setState(fn);
  }

  bool nama = true;
  bool email = true;
  bool nomorponsel = true;
  bool tanggallahir = true;
  bool jeniskelamin = true;
  //
  Future<bool> _willPopCallback() async {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext context) => Profile()));
  }

  // return true if the route to be popped
  @override
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
            body: ListView.builder(
                // scrollDirection: Axis.horizontal,
                itemCount: data == null ? 0 : data.length,
                itemBuilder: (BuildContext context, int i) {
                  return dataprofile == data[i]['email']
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                      backgroundImage: NetworkImage(
                                          'https://carinih.ws/uploads/upload_images/webmin_user/${data[i]['photo']}'),
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
                                  )
                                ],
                              )),
                            ),
                            //
                            Padding(
                              padding: const EdgeInsets.all(15.0),
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
                                  Text(
                                    data[i]['user_name'],
                                    style: TextStyle(
                                        fontSize: 15, fontFamily: 'Comfortaa'),
                                  ),
                                  //
                                  SizedBox(
                                    height: 15,
                                  ),
                                  //
                                  Text(
                                    'Email',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: 'Comfortaa',
                                        color: Colors.deepPurple[400],
                                        fontWeight: FontWeight.w900),
                                  ),
                                  Text(
                                    data[i]['email'],
                                    style: TextStyle(
                                        fontSize: 15, fontFamily: 'Comfortaa'),
                                  ),
                                  //
                                  SizedBox(
                                    height: 15,
                                  ),
                                  //
                                  Text(
                                    'Nomor Ponsel',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: 'Comfortaa',
                                        color: Colors.deepPurple[400],
                                        fontWeight: FontWeight.w900),
                                  ),
                                  Text(
                                    data[i]['mobile_phone'],
                                    style: TextStyle(
                                        fontSize: 15, fontFamily: 'Comfortaa'),
                                  ),
                                  //
                                  SizedBox(
                                    height: 15,
                                  ),
                                  //
                                  Text(
                                    'Tanggal lahir',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: 'Comfortaa',
                                        color: Colors.deepPurple[400],
                                        fontWeight: FontWeight.w900),
                                  ),

                                  ListView.builder(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount:
                                          data1 == null ? 0 : data1.length,
                                      itemBuilder:
                                          (BuildContext context, int i) {
                                        return
                                            // Text(data1[i]['id']);
                                            '${data1[i]['birth']}' == null
                                                ? Text(
                                                    'No data',
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontFamily:
                                                            'Comfortaa'),
                                                  )
                                                : Text(
                                                    '${data1[i]['birth']}',
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontFamily:
                                                            'Comfortaa'),
                                                  );
                                      }),
                                  //
                                  SizedBox(
                                    height: 15,
                                  ),
                                  //
                                  Text(
                                    'Jenis Kelamin',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: 'Comfortaa',
                                        color: Colors.deepPurple[400],
                                        fontWeight: FontWeight.w900),
                                  ),
                                  ListView.builder(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount:
                                          data1 == null ? 0 : data1.length,
                                      itemBuilder:
                                          (BuildContext context, int i) {
                                        return
                                            // Text(data1[i]['id']);
                                            Text(
                                          '${data1[i]['gender_name']}',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontFamily: 'Comfortaa'),
                                        );
                                      }),
                                  // ListView.builder(
                                  //   shrinkWrap: true,
                                  //   physics: NeverScrollableScrollPhysics(),
                                  //    itemCount: data1 == null ? 0 : data1.length,
                                  //   itemBuilder: (BuildContext context, int i) {
                                  //      return
                                  //     // Text(data1[i]['id']);
                                  //        '${data[i]['birth']}'==null?Text('No data',style: TextStyle(fontSize:15,fontFamily:'Comfortaa'),):Text('${data1[i]['birth']}',style: TextStyle(fontSize:15,fontFamily:'Comfortaa'),);

                                  //   }
                                  // ),
                                  // Text(widget.dataid),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  //
                                  // Text('Jenis Kelamin',style: TextStyle(fontSize:15,fontFamily:'Comfortaa',color: Colors.deepPurple[400],fontWeight: FontWeight.w900),),
                                  //   Text(data[i]['gender'],style: TextStyle(fontSize:15,fontFamily:'Comfortaa'),),
                                  //
                                  SizedBox(
                                    height: 20,
                                  ),
                                  //
                                  //
                                  // Text('${widget.dataid}'),
                                  Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            //        final preff =
                                            //     await SharedPreferences.getInstance();
                                            // preff.setString(
                                            //     'tanggallahir', data1[i]['birth']);
                                            //     //
                                            //       final preff1=
                                            //     await SharedPreferences.getInstance();
                                            // preff1.setString(
                                            //     'email', data[i]['email']);
                                            //     //
                                            //       final preff2 =
                                            //     await SharedPreferences.getInstance();
                                            // preff2.setString(
                                            //     'mobilephone', data[i]['mobile_phone']);
                                            //     //
                                            //       final preff3 =
                                            //     await SharedPreferences.getInstance();
                                            // preff3.setString(
                                            //     'tanggallahir', data1[i]['birth']);
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (BuildContext context) =>
                                                        EditGeneral(
                                                            nama: data[i]
                                                                ['user_name'],
                                                            email: data[i]
                                                                ['email'],
                                                            mobilephone: data[i]
                                                                [
                                                                'mobile_phone'],
                                                            photo:
                                                                'https://carinih.ws/uploads/upload_images/webmin_user/${data[i]['photo']}')));
                                          },
                                          child: Container(
                                            height: 25.h,
                                            width: 130.w,
                                            decoration: BoxDecoration(
                                              color: Colors.deepPurple[400],
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: Center(
                                                child: Text(
                                              'Ubah',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'Comfortaa'),
                                            )),
                                          ),
                                        ),
                                        //
                                        Container(
                                          height: 25.h,
                                          width: 130.w,
                                          decoration: BoxDecoration(
                                            color: Colors.deepPurple[400],
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Center(
                                              child: Text(
                                            'Selesai',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'Comfortaa'),
                                          )),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        )
                      : SizedBox();
                }),
          ),
        ),
        Container(
          height: ScreenUtil().setHeight(30.h),
          color: Colors.white30,
        ),
      ],
    );
  }
}
