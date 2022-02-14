import 'dart:convert';

import 'package:dinamika/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart'as http;
import 'package:shared_preferences/shared_preferences.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  //
  List datacart;
  String customer;
  // String datacartid;
  //  String datacartidd;
   getDataCart() async {
    final prefs = await SharedPreferences.getInstance();
    customer = prefs.getString('customer');
    var response = await http.get(
        Uri.parse(Uri.encodeFull('https://carinih.ws/api/cart/$customer')),
        headers: {"Accept": "application/json"});
    // print(response.body);
    //
    setState(() {
      var converDataToJson = json.decode(response.body);
      datacart = converDataToJson['data'];
    });
    print(datacart);
    return "Success";
  }
  //
   List datacartproduct;
  // String productid;
   getDatacartproduct() async {
    final prefs = await SharedPreferences.getInstance();
    customer = prefs.getString('customer');
    var response = await http.get(
        Uri.parse(Uri.encodeFull('https://carinih.ws/api/cart_product/2')),
        headers: {"Accept": "application/json"});
    print(response.body);
    //
    setState(() {
      var converDataToJson = json.decode(response.body);
      datacartproduct = converDataToJson['data'];
    });
    return "Success";
  }
  //
   List dataproduct;
  String productid;
   getDataproduk() async {
    final prefs = await SharedPreferences.getInstance();
    customer = prefs.getString('customer');
    var response = await http.get(
        Uri.parse(Uri.encodeFull('https://carinih.ws/api/product/2')),
        headers: {"Accept": "application/json"});
    print(response.body);
    //
    setState(() {
      var converDataToJson = json.decode(response.body);
      dataproduct = converDataToJson['data'];
    });
    return "Success";
  }
  //
  @override
  void initState(){
    super.initState();
    // getDataCart();
    getDatacartproduct();
  }
  //
  bool ceklist = false;
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
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
                          builder: (BuildContext context) => HomeScreen()))),
            ),
            title: GestureDetector(
              onTap: () {
                // getJsonData();
              },
              child: Text(
                "Keranjang Saya",
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
          body: ListView(
            children: [
              // SizedBox(height: 8.h,),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              ceklist = !ceklist;
                            });
                          },
                          child: Container(
                              child: Center(
                                  child: ceklist
                                      ? Icon(
                                          Icons.check,
                                          color: ceklist
                                              ? Colors.green
                                              : Colors.deepPurple[800],
                                        )
                                      : SizedBox()),
                              height: 30.h,
                              width: 30.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      color: ceklist
                                          ? Colors.green
                                          : Colors.deepPurple[800],
                                      width: 4.w))),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          'Pilih Semua Barang',
                          style: TextStyle(
                              fontFamily: 'Comfortaa',
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600),
                        ),
                        GestureDetector(
                          onTap: (){
                            getDataCart();
                            // getDatacartproduct();
                            // getDataproduk();
                          },
                          child: Container(
                              margin: EdgeInsets.only(left: 100.w),
                              child: Text(
                                'Hapus',
                                style: TextStyle(
                                    fontFamily: 'Comfortaa',
                                    fontSize: 13.sp,
                                    color: Colors.deepPurple[800],
                                    fontWeight: FontWeight.w800),
                              )),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 5.h,
                    decoration: BoxDecoration(
                        // color:Colors.white,
                        boxShadow: [
                          new BoxShadow(
                            offset: Offset(0, 5),
                            color: Colors.grey[300],
                            blurRadius: 5.0,
                          ),
                        ]),
                  ),
                  //
                  SizedBox(height: 8.h,),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                      itemCount: datacartproduct == null ? 0 : datacartproduct.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(top:8.h),
                          child: Row(
                            children: [
                               Container(
                                  child: Center(
                                      child: ceklist
                                          ? Icon(
                      Icons.check,
                      color: ceklist
                            ? Colors.green
                            : Colors.deepPurple[800],
                    )
                                          : SizedBox()),
                                  height: 30.h,
                                  width: 30.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          color: ceklist
                      ? Colors.green
                      : Colors.deepPurple[800],
                                          width: 4.w))),
                                          SizedBox(width: 5.w,),
                              Text(datacartproduct[index]['name']),
                              // Image.network('')
                            ],
                          ),
                        );
                      }
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        Container(
          height: ScreenUtil().setHeight(30.h),
          color: Colors.deepPurple[200],
        ),
      ],
    );
  }
}
