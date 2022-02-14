import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:product/Detail_Produk_Home/Detail_Produk_Home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:http/http.dart' as http;

class ProdukHome2 extends StatefulWidget {
  @override
  _ProdukHome2State createState() => _ProdukHome2State();
}

class _ProdukHome2State extends State<ProdukHome2> {
  //
  final String myUrl = "https://carinih.ws/api/product/";
  List data;

  //
  Future<String> getData() async {
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

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 8), () {
      setState(() {
        isLoading = true;
      });
    });
    getData();
    super.initState();
  }

  //
  bool isLoading = false;
  final controller = PageController(viewportFraction: 0.8);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(height: ScreenUtil().setHeight(5.h)),
        Padding(
          padding: EdgeInsets.only(
            left: ScreenUtil().setWidth(20.w),
            right: ScreenUtil().setWidth(20.w),
          ),
          child: Expanded(
            child: Container(
              // color: Colors.red,
                height:ScreenUtil().setHeight(320.h),
                width: ScreenUtil().setWidth(350.w),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: data == null ? 0 : data.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => DetailProdukHome(
                                    gambar:
                                        'https://carinih.ws/uploads/upload_images/product/${data[index]['image']}',
                                    harga: '${data[index]['price']}',
                                    description: '${data[index]['description']}',
                                    hashtag: '${data[index]['hash_tag']}',
                                    highlight: '${data[index]['highlight']}',
                                    name: '${data[index]['name']}',
                                    minimumorder:
                                        '${data[index]['minimum_order']}',
                                    storename: '${data[index]['store_name']}')));
                      },
                      child:'${data[index]['business_id']}'.contains('21')?Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: ScreenUtil().setWidth(5.w),
                          ),
                          child: isLoading
                              ? Container(
                                height: MediaQuery.of(context).size.height,
                                  width: 155.w,
                                  decoration: BoxDecoration(
                                      // color: Colors.red,
                                      borderRadius: BorderRadius.circular(20.w),
                                      border: Border.all(color: Colors.grey)),
                                  child: Stack(
                                    //ketiga
                                    children: [
                                      Column(
                                        children: [
                                          Stack(
                                            children: [
                                              Container(
                                                height: ScreenUtil().setHeight(130.h),
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.only(
                                                    topLeft: Radius.circular(20.w),
                                                    topRight: Radius.circular(20.w),
                                                  ),
                                                  image: DecorationImage(
                                                      image: NetworkImage(
                                                          'https://carinih.ws/uploads/upload_images/product/${data[index]['image']}'),
                                                      fit: BoxFit.cover),
                                                ),
                                                // width: 140.w,
                                                // child: Padding(
                                                //   padding:  EdgeInsets.only(
                                                //      ),
                                                //  child:Image.network('https://carinih.ws/uploads/upload_images/product/${data[index]['image']}',fit: BoxFit.contain,
                                                // child: ClipRRect(
                                                //    borderRadius: BorderRadius.circular(20),
                                                //   child: Image(
                                                //       image: NetworkImage(
                                                //     'https://carinih.ws/uploads/upload_images/product/${data[index]['image']}',
                                                //   )),
                                              ),
                                              //
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(top: 115.h),
                                                child: Expanded(
                                                  child: Container(
                                                    margin: EdgeInsets.only(left: 13.w,right: 13.w),
                                                      height: 45.h,
                                                      width: 125.w,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                20.w),
                                                                color: Colors.white,
                                                        border: Border.all(
                                                            color: Colors.grey),
                                                      ),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Expanded(
                                                            child: Center(
                                                              child: Text(
                                                                '${data[index]['name']}',maxLines: 2, overflow: TextOverflow.ellipsis,
                                                                textAlign: TextAlign
                                                                    .center,
                                                                style: TextStyle(
                                                                  color: Colors
                                                                          .deepPurple[
                                                                      400],
                                                                  fontFamily:
                                                                      'Comfortaa',
                                                                  fontSize: 12.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      )),
                                                ),
                                              ),
                                            ],
                                          ),
                                          //
                                          //         SizedBox(height:10.h),
                                          //         //
                                          //         Expanded(
                                          //           child: Container(
                                          // height: double.infinity,
                                          //               width:
                                          //                    140.w,
                                          //               decoration: BoxDecoration(
                                          //                 borderRadius: BorderRadius.circular(40.w),
                                          //                 border: Border.all(color: Colors.grey),
                                          //               ),
                                          //               child: Column(
                                          //                 mainAxisAlignment:
                                          //                     MainAxisAlignment.center,
                                          //                 children: [
                                          //                   Expanded(
                                          //                     child: Center(
                                          //                       child: Text(
                                          //                        '${data[index]['name']}',textAlign: TextAlign.center,
                                          //                         style: TextStyle(
                                          //                             color: Colors.deepPurple[400],
                                          //                             fontFamily: 'Comfortaa',
                                          //                             fontSize:12.sp,
                                          //                             fontWeight: FontWeight.bold,),
                                          //                       ),
                                          //                     ),
                                          //                   ),
                                          //                   // Text(
                                          //                   //   '${data[index]['model']}',
                                          //                   //   style: TextStyle(
                                          //                   //       color: Colors.deepPurple[400],
                                          //                   //       fontFamily: 'Comfortaa',
                                          //                   //       fontSize: 12,
                                          //                   //       fontWeight: FontWeight.bold),
                                          //                   // )
                                          //                 ],
                                          //               )),
                                          //         ),
                                          // SizedBox(height: 6),
                                          SizedBox(height: 10.h),
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                bottom: ScreenUtil().setWidth(5.h),
                                              ),
                                              child: Text(
                                                'Rp. ${data[index]['price']}',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontFamily: 'Comfortaa',
                                                    fontSize: 15.sp,
                                                    fontWeight: FontWeight.w900),
                                                //     NumberFormat.currency(
                                                //           locale: 'id',
                                                //           symbol: 'Rp ',
                                                //           decimalDigits: 0)
                                                //       .format(double.parse(
                                                //           '${data[i]['price']}')),
                                                //
                                                // '${data[index]['price']}',
                                                // style: TextStyle(
                                                //     color: Colors.black,
                                                //     fontFamily: 'Comfortaa',
                                                //     fontSize: 22,
                                                //     fontWeight: FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                          //
                                           Expanded(
                                             child: Padding(
                                              padding: EdgeInsets.only(left:6.w,right:6.w),
                                              child: Text(data[index]['description'],textAlign:TextAlign.center,style: TextStyle(fontFamily:'Comfortaa',fontSize: 12.sp,),maxLines: 2,overflow: TextOverflow.ellipsis,),
                                          ),
                                           ),
                                          //
                                          SizedBox(height: 5,),
                                          //
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsets.only(left:13.w,right:13.w),
                                              child: Row(
                                                children: [
                                                  Icon(Icons.location_on,color: Colors.yellow[800],size: 13,),
                                                  Text('1.2 km dari lokasimu',style: TextStyle(fontFamily:'Comfortaa',fontSize: 10.sp,fontWeight: FontWeight.w900,color: Colors.deepPurple[400]),)
                                                ],
                                              ),
                                            ),
                                          ),
                                          //
                                          SizedBox(height: 1,),
                                          //
                                           Expanded(
                                             child: Padding(
                                              padding: EdgeInsets.only(left:20.w,right:20.w),
                                              child: Row(
                                                children: [
                                                 Text('ready stock |',style: TextStyle(fontFamily:'Comfortaa',fontSize: 10.sp,fontWeight:FontWeight.w900,color:Colors.deepPurple[400]),),
                                                 SizedBox(width: 2.w,),
                                                  Text('stok : 12',style: TextStyle(fontFamily:'Comfortaa',fontSize: 10.sp,fontWeight: FontWeight.w900,color: Colors.red),)
                                                ],
                                              ),
                                          ),
                                           ),
                                          // SizedBox(height: 6),
                                          SizedBox(height:2.h),
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                bottom: ScreenUtil().setHeight(10.h),
                                              ),
                                              child: Container(
                                                  width: 80.w,
                                                  child: Image(
                                                      image: AssetImage(
                                                          'gambar/images/rating_icon.png'))),
                                            ),
                                          ),
                                          //
                                          SizedBox(height:0.h),
                                          //
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsets.only(left:12.w,right:12.w,bottom: 5),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(5),
                                                color: Colors.blue,
                                                ),
                                                height: 18,
                                                width:150.w,
                                                child: Center(child: Text('Tinggal 3 hari lagi',style: TextStyle(color:Colors.white,fontSize:10.sp,fontFamily:'Comfortaa',fontWeight: FontWeight.w900),)),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: ScreenUtil().setWidth(220.w),
                                          bottom: ScreenUtil().setWidth(230.h),
                                        ),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.deepPurple[400],
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(0),
                                                  bottomLeft:
                                                      Radius.circular(100.w),
                                                  topRight: Radius.circular(20.w))),
                                          //  alignment: Alignment(10,19),
                                        ),
                                      ),
                                      //align dididalam stack
                                      Align(
                                        alignment: Alignment.topRight,
                                        child: Container(
                                          height: 60,
                                          width: 50,
                                        decoration: BoxDecoration(
                                            color:Colors.deepPurple[400],
                                          borderRadius:BorderRadius.only(topRight: Radius.circular(20),bottomLeft: Radius.circular(35))
                                        ),
                                        child: Padding(
                                          padding:  EdgeInsets.only(left:9.0,top:5),
                                          child: Text('Diskon 15% & Gratis Ongkir',style: TextStyle(fontWeight:FontWeight.w700,color:Colors.white,fontSize:10.sp,fontFamily: 'Comfortaa',),),
                                        ),
                                        ),
                                      ),
                                      //
                                    ],
                                  ))
                              : Container(
                                  width: 140.w,
                                  child: Shimmer.fromColors(
                                    child: Card(
                                      color: Colors.grey,
                                    ),
                                    baseColor: Colors.grey[100],
                                    highlightColor: Colors.grey[400],
                                    direction: ShimmerDirection.ltr,
                                  ),
                                ),
                        ),
                      ):SizedBox(),
                    );
                  },
                )
                // height: 300,
                // width: 440,
                //         child:PageView.builder(
                // itemCount: data == null ? 0:data.length,
                // controller: controller,
                // itemBuilder: (BuildContext context, int index) {
                //   return    Card(
                //                 shape: RoundedRectangleBorder(
                //                     borderRadius: BorderRadius.circular(16.h),
                //                     side: BorderSide(color: Colors.grey)),
                //                 // color: Colors.red,
                //                 // margin: EdgeInsets.only(left:  ScreenUtil().setWidth(0.1.w),right:  ScreenUtil().setWidth(0.w)),
                //                 // color: Colors.pink,

                //                 child: Stack(
                //                   //ketiga
                //                   children: [
                //                     Column(
                //                       children: [
                //                         Container(
                //                           child: Padding(
                //                             padding:  EdgeInsets.only(
                //                                 left:(ScreenUtil().setWidth(60.w)), right: 55, top: 7),
                //                             child: ClipRRect(
                //                                borderRadius: BorderRadius.circular(20),
                //                               child: Image(
                //                                   image: NetworkImage(
                //                                 'https://carinih.ws/uploads/upload_images/product/${data[index]['image']}',
                //                               )),
                //                             ),
                //                           ),
                //                         ),
                //                         SizedBox(height:5),
                //                         //
                //                         Expanded(
                //                           child: Container(
                //                 // height: double.infinity,
                //                               width:
                //                                   MediaQuery.of(context).size.width / 1.6,
                //                               decoration: BoxDecoration(
                //                                 borderRadius: BorderRadius.circular(30),
                //                                 border: Border.all(color: Colors.grey),
                //                               ),
                //                               child: Column(
                //                                 mainAxisAlignment:
                //                                     MainAxisAlignment.center,
                //                                 children: [
                //                                   Expanded(
                //                                     child: Center(
                //                                       child: Text(
                //                                        '${data[index]['name']}',textAlign: TextAlign.center,
                //                                         style: TextStyle(
                //                                             color: Colors.deepPurple[400],
                //                                             fontFamily: 'Comfortaa',
                //                                             fontSize:18,
                //                                             fontWeight: FontWeight.bold,),
                //                                       ),
                //                                     ),
                //                                   ),
                //                                   // Text(
                //                                   //   '${data[index]['model']}',
                //                                   //   style: TextStyle(
                //                                   //       color: Colors.deepPurple[400],
                //                                   //       fontFamily: 'Comfortaa',
                //                                   //       fontSize: 12,
                //                                   //       fontWeight: FontWeight.bold),
                //                                   // )
                //                                 ],
                //                               )),
                //                         ),
                //                         //
                //                         // SizedBox(height: 6),
                //                         SizedBox(height: MediaQuery.of(context).size.height/80),
                //                         Padding(
                //                           padding: const EdgeInsets.only(bottom:8.0),
                //                           child: Text(
                //                               NumberFormat.currency(
                //                                     locale: 'id',
                //                                     symbol: 'Rp ',
                //                                     decimalDigits: 0)
                //                                 .format(double.parse(
                //                                     '${data[index]['price']}')),
                //                            style: TextStyle(
                //                                 color: Colors.black,
                //                                 fontFamily: 'Comfortaa',
                //                                 fontSize: 20,
                //                                 fontWeight: FontWeight.bold),
                //                             // '${data[index]['price']}',
                //                             // style: TextStyle(
                //                             //     color: Colors.black,
                //                             //     fontFamily: 'Comfortaa',
                //                             //     fontSize: 22,
                //                             //     fontWeight: FontWeight.bold),
                //                           ),
                //                         ),
                //                         // SizedBox(height: 6),
                //                          SizedBox(height: MediaQuery.of(context).size.height/150),
                //                          Padding(
                //                            padding: const EdgeInsets.only(bottom:10.0),
                //                            child: Container(
                //                               width: MediaQuery.of(context).size.width/3,
                //                               child: Image(image: AssetImage('gambar/images/rating_icon.png'))),
                //                          )
                //                       ],
                //                     ),
                //                      Padding(
                //                       padding:
                //                           const EdgeInsets.only(left: 220, bottom: 230),
                //                       child: Container(
                //                         decoration: BoxDecoration(
                //                             color: Colors.deepPurple[400],
                //                             borderRadius: BorderRadius.only(
                //                                 topLeft: Radius.circular(0),
                //                                 bottomLeft: Radius.circular(100),
                //                                 topRight: Radius.circular(20))),
                //                         //  alignment: Alignment(10,19),
                //                       ),
                //                     ),
                //                   ],
                //                 ));
                // },
                // ),
                //  Image.network('https://carinih.ws/uploads/upload_images/product/${data[index]['image']}'),
                // PageView(
                //   controller: controller,
                //   children: List.generate(
                //       6,
                //       (_) => Card(
                //             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                //             margin: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                //             child: Container(height: 280),
                //           )),
                // ),
                //     PageView(
                //   controller: controller,
                //   children: <Widget>[
                //     //
                //     Card(
                //         shape: RoundedRectangleBorder(
                //             borderRadius: BorderRadius.circular(16),
                //             side: BorderSide(color: Colors.grey)),
                //         // color: Colors.red,
                //         margin: EdgeInsets.only(left: 20),
                //         // color: Colors.pink,

                //         child: Stack(
                //           //ketiga
                //           children: [
                //             Padding(
                //               padding:
                //                   const EdgeInsets.only(left: 190, bottom: 180),
                //               child: Container(
                //                 decoration: BoxDecoration(
                //                     color: Colors.deepPurple[400],
                //                     borderRadius: BorderRadius.only(
                //                         topLeft: Radius.circular(0),
                //                         bottomLeft: Radius.circular(100),
                //                         topRight: Radius.circular(20))),
                //                 //  alignment: Alignment(10,19),
                //               ),
                //             ),
                //             Column(
                //               children: [
                //                 Container(
                //                   child: Padding(
                //                     padding: const EdgeInsets.only(
                //                         left: 55.0, right: 55, top: 7),
                //                     child: Image(
                //                         image: AssetImage(
                //                       'gambar/produk/blackmore_c1000.png',
                //                     )),
                //                   ),
                //                 ),
                //                 //
                //                 Container(
                //                     height:
                //                         MediaQuery.of(context).size.height / 15,
                //                     width:
                //                         MediaQuery.of(context).size.width / 1.6,
                //                     decoration: BoxDecoration(
                //                       borderRadius: BorderRadius.circular(25),
                //                       border: Border.all(color: Colors.grey),
                //                     ),
                //                     child: Column(
                //                       mainAxisAlignment:
                //                           MainAxisAlignment.center,
                //                       children: [
                //                         Text(
                //                           'Blackmores',
                //                           style: TextStyle(
                //                               color: Colors.deepPurple[400],
                //                               fontFamily: 'Comfortaa',
                //                               fontSize: 18,
                //                               fontWeight: FontWeight.bold),
                //                         ),
                //                         Text(
                //                           'BIO C 1000mg',
                //                           style: TextStyle(
                //                               color: Colors.deepPurple[400],
                //                               fontFamily: 'Comfortaa',
                //                               fontSize: 18,
                //                               fontWeight: FontWeight.bold),
                //                         )
                //                       ],
                //                     )),
                //                 //
                //                 // SizedBox(height: 6),
                //                 SizedBox(height: MediaQuery.of(context).size.height/150),
                //                 Text(
                //                   'Rp.280.000',
                //                   style: TextStyle(
                //                       color: Colors.black,
                //                       fontFamily: 'Comfortaa',
                //                       fontSize: 22,
                //                       fontWeight: FontWeight.bold),
                //                 ),
                //                 // SizedBox(height: 6),
                //                  SizedBox(height: MediaQuery.of(context).size.height/150),
                //                 Container(
                //                     // width: 160,
                //                        width: MediaQuery.of(context).size.height/3.8,
                //                     child: Text(
                //                       'Pengiriman 1.5 km dari daerahmu',
                //                       style: TextStyle(
                //                           color: Colors.black54,
                //                           fontFamily: 'Comfortaa',
                //                           fontSize: 17,
                //                           fontWeight: FontWeight.bold),
                //                       textAlign: TextAlign.center,
                //                     ))
                //               ],
                //             ),
                //           ],
                //         )),
                //     //
                //     Card(
                //         shape: RoundedRectangleBorder(
                //             borderRadius: BorderRadius.circular(16),
                //             side: BorderSide(color: Colors.grey)),
                //         // color: Colors.red,
                //         margin: EdgeInsets.only(left: 10, right: 10),
                //         // color: Colors.pink,

                //         child: Stack(
                //           //tengah
                //           children: [
                //             Padding(
                //               padding:
                //                   const EdgeInsets.only(left: 190, bottom: 180),
                //               child: Container(
                //                 decoration: BoxDecoration(
                //                     color: Colors.deepPurple[400],
                //                     borderRadius: BorderRadius.only(
                //                         topLeft: Radius.circular(0),
                //                         bottomLeft: Radius.circular(100),
                //                         topRight: Radius.circular(20))),
                //                 //  alignment: Alignment(10,19),
                //               ),
                //             ),
                //             Column(
                //               children: [
                //                 Container(
                //                   child: Padding(
                //                     padding: const EdgeInsets.only(
                //                         left: 55.0, right: 55, top: 7),
                //                     child: Image(
                //                         image: AssetImage(
                //                       'gambar/produk/blackmore_c1000.png',
                //                     )),
                //                   ),
                //                 ),
                //                 Container(
                //                     height:
                //                         MediaQuery.of(context).size.height / 15,
                //                    width: MediaQuery.of(context).size.width/1.6,                                    decoration: BoxDecoration(
                //                       borderRadius: BorderRadius.circular(25),
                //                       border: Border.all(color: Colors.grey),
                //                     ),
                //                     child: Column(
                //                       mainAxisAlignment:
                //                           MainAxisAlignment.center,
                //                       children: [
                //                         Text(
                //                           'Blackmores',
                //                           style: TextStyle(
                //                               color: Colors.deepPurple[400],
                //                               fontFamily: 'Comfortaa',
                //                               fontSize: 18,
                //                               fontWeight: FontWeight.bold),
                //                         ),
                //                         Text(
                //                           'BIO C 1000mg',
                //                           style: TextStyle(
                //                               color: Colors.deepPurple[400],
                //                               fontFamily: 'Comfortaa',
                //                               fontSize: 18,
                //                               fontWeight: FontWeight.bold),
                //                         )
                //                       ],
                //                     )),
                //                 //
                //                 // SizedBox(height: 6),
                //                    SizedBox(height: MediaQuery.of(context).size.height/150),
                //                 Text(
                //                   'Rp.280.000',
                //                   style: TextStyle(
                //                       color: Colors.black,
                //                       fontFamily: 'Comfortaa',
                //                       fontSize: 22,
                //                       fontWeight: FontWeight.bold),
                //                 ),
                //                 // SizedBox(height: 6),
                //                    SizedBox(height: MediaQuery.of(context).size.height/150),
                //                 Container(
                //                       width: MediaQuery.of(context).size.height/3.8,
                //                     child: Text(
                //                       'Pengiriman 1.5 km dari daerahmue',
                //                       style: TextStyle(
                //                           color: Colors.black54,
                //                           fontFamily: 'Comfortaa',
                //                           fontSize: 17,
                //                           fontWeight: FontWeight.bold),
                //                       textAlign: TextAlign.center,
                //                     ))
                //               ],
                //             ),
                //           ],
                //         )),
                //     //
                //     Card(
                //       //pertama
                //         shape: RoundedRectangleBorder(
                //             borderRadius: BorderRadius.circular(16),
                //             side: BorderSide(color: Colors.grey)),
                //         // color: Colors.red,
                //         margin: EdgeInsets.only(right: 20),
                //         // color: Colors.pink,

                //         child: Stack(
                //           children: [
                //             Padding(
                //               padding:
                //                   const EdgeInsets.only(left: 190, bottom: 180),
                //               child: Container(
                //                 decoration: BoxDecoration(
                //                     color: Colors.deepPurple[400],
                //                     borderRadius: BorderRadius.only(
                //                         topLeft: Radius.circular(0),
                //                         bottomLeft: Radius.circular(100),
                //                         topRight: Radius.circular(20))),
                //                 //  alignment: Alignment(10,19),
                //               ),
                //             ),
                //             Column(
                //               mainAxisAlignment: MainAxisAlignment.start,
                //               children: [
                //                 Container(
                //                   child: Padding(
                //                     padding: const EdgeInsets.only(
                //                         left: 55.0, right: 55, top: 7),
                //                     child: Image(
                //                         image: AssetImage(
                //                       'gambar/produk/blackmore_c1000.png',
                //                     )),
                //                   ),
                //                 ),
                //                 //
                //                 Container(
                //                     height:
                //                         MediaQuery.of(context).size.height / 15,
                //                     width: MediaQuery.of(context).size.width/1.6,
                //                     decoration: BoxDecoration(
                //                       borderRadius: BorderRadius.circular(25),
                //                       border: Border.all(color: Colors.grey),
                //                     ),
                //                     child: Column(
                //                       mainAxisAlignment:
                //                           MainAxisAlignment.center,
                //                       children: [
                //                         Text(
                //                           'Blackmores',
                //                           style: TextStyle(
                //                               color: Colors.deepPurple[400],
                //                               fontFamily: 'Comfortaa',
                //                               fontSize: 18,
                //                               fontWeight: FontWeight.bold),
                //                         ),
                //                         Text(
                //                           'BIO C 1000mg',
                //                           style: TextStyle(
                //                               color: Colors.deepPurple[400],
                //                               fontFamily: 'Comfortaa',
                //                               fontSize: 18,
                //                               fontWeight: FontWeight.bold),
                //                         )
                //                       ],
                //                     )),
                //                 //
                //                SizedBox(height: MediaQuery.of(context).size.height/150),
                //                 Text(
                //                   'Rp.280.000',
                //                   style: TextStyle(
                //                       color: Colors.black,
                //                       fontFamily: 'Comfortaa',
                //                       fontSize: 22,
                //                       fontWeight: FontWeight.bold),
                //                 ),
                //              SizedBox(height: MediaQuery.of(context).size.height/150),
                //                 Container(
                //                      width: MediaQuery.of(context).size.height/3.8,
                //                     child: Text(
                //                       'Pengiriman 1.5 km dari daerahmu',
                //                       style: TextStyle(
                //                           color: Colors.black54,
                //                           fontFamily: 'Comfortaa',
                //                           fontSize: 17,
                //                           fontWeight: FontWeight.bold),
                //                       textAlign: TextAlign.center,
                //                     ))
                //               ],
                //             ),
                //           ],
                //         )),
                //   ],
                // )),
                // SizedBox(height: 40),
                //  SizedBox(height: MediaQuery.of(context).size.height/25),
                // Padding(
                //   padding: const EdgeInsets.symmetric(vertical: 8),
                //   child: Text("Jumping Dot "),
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(left: 5.0, right: 5),
                //   child: Container(
                //     // height: 40,
                //     height: MediaQuery.of(context).size.height/20,
                //     width: double.infinity,
                //     color: Colors.grey[200],
                //     child: Center(
                //       child: SmoothPageIndicator(
                //         controller: controller,
                //         count: 3,
                //         effect: JumpingDotEffect(

                //             // spacing: 10.0,
                //             // radius: 2.0,
                //             dotWidth: 24.0,
                //             dotHeight: 16.0,
                //             // offset: 10,
                //             dotColor: Colors.blue[100],
                //             paintStyle: PaintingStyle.fill,
                //             strokeWidth: 2,
                //             activeDotColor: Colors.indigo),
                //       ),
                //     ),
                //   ),
                ),
          ),
        ),
      ],
    );
  }
}






















// import 'dart:convert';

// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:dinamika/Detail_Produk_Home/Detail_Produk_Home.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:intl/intl.dart';
// import 'package:shimmer/shimmer.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';
// import 'package:http/http.dart' as http;

// class ProdukHome2 extends StatefulWidget {
//   @override
//   _ProdukHome2State createState() => _ProdukHome2State();
// }

// class _ProdukHome2State extends State<ProdukHome2> {
//   //
//    final String myUrl = "https://carinih.ws/api/product/";
//   List data;
  
//   //
//   Future<String>getData()async{
//     var response = await http.get(Uri.parse(Uri.encodeFull(myUrl)),
//     headers: {"Accept":"application/json"}
//     );
//     print(response.body);
//     //
//     setState(() {
//       var converDataToJson = json.decode(response.body);
//       data = converDataToJson['data'];
//     });
//     return "Success";
//   }

//   @override
//   void initState(){
//      Future.delayed(const Duration(seconds: 8), () {
//       setState(() {
//         isLoading = true;
//       });
//     });
//     getData();
//     super.initState();
//   }
//   //
//   bool isLoading = false;
//   final controller = PageController(viewportFraction: 0.8);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//         SizedBox(height:  ScreenUtil().setHeight(5.h)),
//       Padding(
//         padding:  EdgeInsets.only(left:ScreenUtil().setWidth(20.w),right: ScreenUtil().setWidth(20.w),),
//         child: Container(
//             height:200.h,
//             width:350.w,
//             child:ListView.builder(
//               scrollDirection: Axis.horizontal,
//               itemCount: data==null?0:data.length,
//               itemBuilder: (BuildContext context ,int i){
//                 return GestureDetector(
//                   onTap: (){
//                     Navigator.push(context,MaterialPageRoute(builder: (BuildContext context)=>DetailProdukHome(gambar:'https://carinih.ws/uploads/upload_images/product/${data[i]['image']}',harga:'${data[i]['price']}',description:data[i]['description'],hashtag:data[i]['hash_tag'],highlight:data[i]['highlight'],name:data[i]['name'],minimumorder:data[i]['minimum_order'])));
//                   },
//                   child: '${data[i]['business_id']}'.contains('21')?Padding(
//                     padding: EdgeInsets.only(left:ScreenUtil().setWidth(5.w),),
//                     child: isLoading?Container(
//                       width: 140.h,
//                       decoration: BoxDecoration(
//                       // color: Colors.red,
//                         borderRadius: BorderRadius.circular(20),
//                         border: Border.all(color:Colors.grey)
//                       ),
//                       child:  Stack(
//                           //ketiga
//                           children: [
//                             Column(
//                               children: [
//                                 Container(
//                                   child: Padding(
//                                     padding:  EdgeInsets.only(
//                                         left:ScreenUtil().setWidth(30.w), right:ScreenUtil().setWidth(30.w), top: 6.h),
//                                     child: ClipRRect(
//                                        borderRadius: BorderRadius.circular(20),
//                                       child: Image(
//                                           image: NetworkImage(
//                                         'https://carinih.ws/uploads/upload_images/product/${data[i]['image']}',
//                                       )),
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(height:10.h),
//                                 //
//                                 Expanded(
//                                   child: Container(
//                         height: double.infinity,
//                                       width:
//                                            140.w,
//                                       decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(40.w),
//                                         border: Border.all(color: Colors.grey),
//                                       ),
//                                       child: Column(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.center,
//                                         children: [
//                                           Expanded(
//                                             child: Center(
//                                               child: Text(
//                                                '${data[i]['name']}',textAlign: TextAlign.center,
//                                                 style: TextStyle(
//                                                     color: Colors.deepPurple[400],
//                                                     fontFamily: 'Comfortaa',
//                                                     fontSize:12.sp,
//                                                     fontWeight: FontWeight.bold,),
//                                               ),
//                                             ),
//                                           ),
//                                           // Text(
//                                           //   '${data[index]['model']}',
//                                           //   style: TextStyle(
//                                           //       color: Colors.deepPurple[400],
//                                           //       fontFamily: 'Comfortaa',
//                                           //       fontSize: 12,
//                                           //       fontWeight: FontWeight.bold),
//                                           // )
//                                         ],
//                                       )),
//                                 ),
//                                 //
//                                 // SizedBox(height: 6),
//                                 SizedBox(height:10.h),
//                                 Padding(
//                                   padding:  EdgeInsets.only(bottom:ScreenUtil().setWidth(5.h),),
//                                   child: Text('Rp. ${data[i]['price']}',style: TextStyle(
//                                         color: Colors.black,
//                                         fontFamily: 'Comfortaa',
//                                         fontSize: 15.sp,
//                                         fontWeight: FontWeight.w900),
//                                   //     NumberFormat.currency(
//                                   //           locale: 'id',
//                                   //           symbol: 'Rp ',
//                                   //           decimalDigits: 0)
//                                   //       .format(double.parse(
//                                   //           '${data[i]['price']}')),
//                                   //  
//                                     // '${data[index]['price']}',
//                                     // style: TextStyle(
//                                     //     color: Colors.black,
//                                     //     fontFamily: 'Comfortaa',
//                                     //     fontSize: 22,
//                                     //     fontWeight: FontWeight.bold),
//                                   ),
//                                 ),
//                                 // SizedBox(height: 6),
//                                  SizedBox(height:3.h),
//                                  Padding(
//                                    padding:  EdgeInsets.only(bottom:ScreenUtil().setWidth(10.h),),
//                                    child: Container(
//                                       width: 80.w,
//                                       child: Image(image: AssetImage('gambar/images/rating_icon.png'))),
//                                  )
//                               ],
//                             ),
//                              Padding(
//                               padding:
//                                    EdgeInsets.only(left: ScreenUtil().setWidth(220.w), bottom: ScreenUtil().setWidth(230.h),),
//                               child: Container(
//                                 decoration: BoxDecoration(
//                                     color: Colors.deepPurple[400],
//                                     borderRadius: BorderRadius.only(
//                                         topLeft: Radius.circular(0),
//                                         bottomLeft: Radius.circular(100.w),
//                                         topRight: Radius.circular(20.w))),
//                                 //  alignment: Alignment(10,19),
//                               ),
//                             ),
//                           ],
//                         )):Container(
//                           width: 140.w,
//                           child:  Shimmer.fromColors(
//                                                 child: Card(
//                                                   color: Colors.grey,
//                                                 ),
//                                                 baseColor: Colors.grey[100],
//                                                 highlightColor:
//                                                     Colors.grey[400],
//                                                 direction: ShimmerDirection.ltr,
//                                               ),
//                         ),
//                   ):SizedBox(),
//                 );
                
//               },
           
//             )
//               // height: 300,
//               // width: 440,
//     //         child:PageView.builder(
//     // itemCount: data == null ? 0:data.length,
//     // controller: controller,
//     // itemBuilder: (BuildContext context, int index) {
//     //   return    Card(
//     //                 shape: RoundedRectangleBorder(
//     //                     borderRadius: BorderRadius.circular(16.h),
//     //                     side: BorderSide(color: Colors.grey)),
//     //                 // color: Colors.red,
//     //                 // margin: EdgeInsets.only(left:  ScreenUtil().setWidth(0.1.w),right:  ScreenUtil().setWidth(0.w)),
//     //                 // color: Colors.pink,

//     //                 child: Stack(
//     //                   //ketiga
//     //                   children: [
//     //                     Column(
//     //                       children: [
//     //                         Container(
//     //                           child: Padding(
//     //                             padding:  EdgeInsets.only(
//     //                                 left:(ScreenUtil().setWidth(60.w)), right: 55, top: 7),
//     //                             child: ClipRRect(
//     //                                borderRadius: BorderRadius.circular(20),
//     //                               child: Image(
//     //                                   image: NetworkImage(
//     //                                 'https://carinih.ws/uploads/upload_images/product/${data[index]['image']}',
//     //                               )),
//     //                             ),
//     //                           ),
//     //                         ),
//     //                         SizedBox(height:5),
//     //                         //
//     //                         Expanded(
//     //                           child: Container(
//     //                 // height: double.infinity,
//     //                               width:
//     //                                   MediaQuery.of(context).size.width / 1.6,
//     //                               decoration: BoxDecoration(
//     //                                 borderRadius: BorderRadius.circular(30),
//     //                                 border: Border.all(color: Colors.grey),
//     //                               ),
//     //                               child: Column(
//     //                                 mainAxisAlignment:
//     //                                     MainAxisAlignment.center,
//     //                                 children: [
//     //                                   Expanded(
//     //                                     child: Center(
//     //                                       child: Text(
//     //                                        '${data[index]['name']}',textAlign: TextAlign.center,
//     //                                         style: TextStyle(
//     //                                             color: Colors.deepPurple[400],
//     //                                             fontFamily: 'Comfortaa',
//     //                                             fontSize:18,
//     //                                             fontWeight: FontWeight.bold,),
//     //                                       ),
//     //                                     ),
//     //                                   ),
//     //                                   // Text(
//     //                                   //   '${data[index]['model']}',
//     //                                   //   style: TextStyle(
//     //                                   //       color: Colors.deepPurple[400],
//     //                                   //       fontFamily: 'Comfortaa',
//     //                                   //       fontSize: 12,
//     //                                   //       fontWeight: FontWeight.bold),
//     //                                   // )
//     //                                 ],
//     //                               )),
//     //                         ),
//     //                         //
//     //                         // SizedBox(height: 6),
//     //                         SizedBox(height: MediaQuery.of(context).size.height/80),
//     //                         Padding(
//     //                           padding: const EdgeInsets.only(bottom:8.0),
//     //                           child: Text(
//     //                               NumberFormat.currency(
//     //                                     locale: 'id',
//     //                                     symbol: 'Rp ',
//     //                                     decimalDigits: 0)
//     //                                 .format(double.parse(
//     //                                     '${data[index]['price']}')),
//     //                            style: TextStyle(
//     //                                 color: Colors.black,
//     //                                 fontFamily: 'Comfortaa',
//     //                                 fontSize: 20,
//     //                                 fontWeight: FontWeight.bold),
//     //                             // '${data[index]['price']}',
//     //                             // style: TextStyle(
//     //                             //     color: Colors.black,
//     //                             //     fontFamily: 'Comfortaa',
//     //                             //     fontSize: 22,
//     //                             //     fontWeight: FontWeight.bold),
//     //                           ),
//     //                         ),
//     //                         // SizedBox(height: 6),
//     //                          SizedBox(height: MediaQuery.of(context).size.height/150),
//     //                          Padding(
//     //                            padding: const EdgeInsets.only(bottom:10.0),
//     //                            child: Container(
//     //                               width: MediaQuery.of(context).size.width/3,
//     //                               child: Image(image: AssetImage('gambar/images/rating_icon.png'))),
//     //                          )
//     //                       ],
//     //                     ),
//     //                      Padding(
//     //                       padding:
//     //                           const EdgeInsets.only(left: 220, bottom: 230),
//     //                       child: Container(
//     //                         decoration: BoxDecoration(
//     //                             color: Colors.deepPurple[400],
//     //                             borderRadius: BorderRadius.only(
//     //                                 topLeft: Radius.circular(0),
//     //                                 bottomLeft: Radius.circular(100),
//     //                                 topRight: Radius.circular(20))),
//     //                         //  alignment: Alignment(10,19),
//     //                       ),
//     //                     ),
//     //                   ],
//     //                 ));
//     // },
//     // ),
//           //  Image.network('https://carinih.ws/uploads/upload_images/product/${data[index]['image']}'),
//                   // PageView(
//                   //   controller: controller,
//                   //   children: List.generate(
//                   //       6,
//                   //       (_) => Card(
//                   //             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//                   //             margin: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
//                   //             child: Container(height: 280),
//                   //           )),
//                   // ),
//               //     PageView(
//               //   controller: controller,
//               //   children: <Widget>[
//               //     //
//               //     Card(
//               //         shape: RoundedRectangleBorder(
//               //             borderRadius: BorderRadius.circular(16),
//               //             side: BorderSide(color: Colors.grey)),
//               //         // color: Colors.red,
//               //         margin: EdgeInsets.only(left: 20),
//               //         // color: Colors.pink,

//               //         child: Stack(
//               //           //ketiga
//               //           children: [
//               //             Padding(
//               //               padding:
//               //                   const EdgeInsets.only(left: 190, bottom: 180),
//               //               child: Container(
//               //                 decoration: BoxDecoration(
//               //                     color: Colors.deepPurple[400],
//               //                     borderRadius: BorderRadius.only(
//               //                         topLeft: Radius.circular(0),
//               //                         bottomLeft: Radius.circular(100),
//               //                         topRight: Radius.circular(20))),
//               //                 //  alignment: Alignment(10,19),
//               //               ),
//               //             ),
//               //             Column(
//               //               children: [
//               //                 Container(
//               //                   child: Padding(
//               //                     padding: const EdgeInsets.only(
//               //                         left: 55.0, right: 55, top: 7),
//               //                     child: Image(
//               //                         image: AssetImage(
//               //                       'gambar/produk/blackmore_c1000.png',
//               //                     )),
//               //                   ),
//               //                 ),
//               //                 //
//               //                 Container(
//               //                     height:
//               //                         MediaQuery.of(context).size.height / 15,
//               //                     width:
//               //                         MediaQuery.of(context).size.width / 1.6,
//               //                     decoration: BoxDecoration(
//               //                       borderRadius: BorderRadius.circular(25),
//               //                       border: Border.all(color: Colors.grey),
//               //                     ),
//               //                     child: Column(
//               //                       mainAxisAlignment:
//               //                           MainAxisAlignment.center,
//               //                       children: [
//               //                         Text(
//               //                           'Blackmores',
//               //                           style: TextStyle(
//               //                               color: Colors.deepPurple[400],
//               //                               fontFamily: 'Comfortaa',
//               //                               fontSize: 18,
//               //                               fontWeight: FontWeight.bold),
//               //                         ),
//               //                         Text(
//               //                           'BIO C 1000mg',
//               //                           style: TextStyle(
//               //                               color: Colors.deepPurple[400],
//               //                               fontFamily: 'Comfortaa',
//               //                               fontSize: 18,
//               //                               fontWeight: FontWeight.bold),
//               //                         )
//               //                       ],
//               //                     )),
//               //                 //
//               //                 // SizedBox(height: 6),
//               //                 SizedBox(height: MediaQuery.of(context).size.height/150),
//               //                 Text(
//               //                   'Rp.280.000',
//               //                   style: TextStyle(
//               //                       color: Colors.black,
//               //                       fontFamily: 'Comfortaa',
//               //                       fontSize: 22,
//               //                       fontWeight: FontWeight.bold),
//               //                 ),
//               //                 // SizedBox(height: 6),
//               //                  SizedBox(height: MediaQuery.of(context).size.height/150),
//               //                 Container(
//               //                     // width: 160,
//               //                        width: MediaQuery.of(context).size.height/3.8,
//               //                     child: Text(
//               //                       'Pengiriman 1.5 km dari daerahmu',
//               //                       style: TextStyle(
//               //                           color: Colors.black54,
//               //                           fontFamily: 'Comfortaa',
//               //                           fontSize: 17,
//               //                           fontWeight: FontWeight.bold),
//               //                       textAlign: TextAlign.center,
//               //                     ))
//               //               ],
//               //             ),
//               //           ],
//               //         )),
//               //     //
//               //     Card(
//               //         shape: RoundedRectangleBorder(
//               //             borderRadius: BorderRadius.circular(16),
//               //             side: BorderSide(color: Colors.grey)),
//               //         // color: Colors.red,
//               //         margin: EdgeInsets.only(left: 10, right: 10),
//               //         // color: Colors.pink,

//               //         child: Stack(
//               //           //tengah
//               //           children: [
//               //             Padding(
//               //               padding:
//               //                   const EdgeInsets.only(left: 190, bottom: 180),
//               //               child: Container(
//               //                 decoration: BoxDecoration(
//               //                     color: Colors.deepPurple[400],
//               //                     borderRadius: BorderRadius.only(
//               //                         topLeft: Radius.circular(0),
//               //                         bottomLeft: Radius.circular(100),
//               //                         topRight: Radius.circular(20))),
//               //                 //  alignment: Alignment(10,19),
//               //               ),
//               //             ),
//               //             Column(
//               //               children: [
//               //                 Container(
//               //                   child: Padding(
//               //                     padding: const EdgeInsets.only(
//               //                         left: 55.0, right: 55, top: 7),
//               //                     child: Image(
//               //                         image: AssetImage(
//               //                       'gambar/produk/blackmore_c1000.png',
//               //                     )),
//               //                   ),
//               //                 ),
//               //                 Container(
//               //                     height:
//               //                         MediaQuery.of(context).size.height / 15,
//               //                    width: MediaQuery.of(context).size.width/1.6,                                    decoration: BoxDecoration(
//               //                       borderRadius: BorderRadius.circular(25),
//               //                       border: Border.all(color: Colors.grey),
//               //                     ),
//               //                     child: Column(
//               //                       mainAxisAlignment:
//               //                           MainAxisAlignment.center,
//               //                       children: [
//               //                         Text(
//               //                           'Blackmores',
//               //                           style: TextStyle(
//               //                               color: Colors.deepPurple[400],
//               //                               fontFamily: 'Comfortaa',
//               //                               fontSize: 18,
//               //                               fontWeight: FontWeight.bold),
//               //                         ),
//               //                         Text(
//               //                           'BIO C 1000mg',
//               //                           style: TextStyle(
//               //                               color: Colors.deepPurple[400],
//               //                               fontFamily: 'Comfortaa',
//               //                               fontSize: 18,
//               //                               fontWeight: FontWeight.bold),
//               //                         )
//               //                       ],
//               //                     )),
//               //                 //
//               //                 // SizedBox(height: 6),
//               //                    SizedBox(height: MediaQuery.of(context).size.height/150),
//               //                 Text(
//               //                   'Rp.280.000',
//               //                   style: TextStyle(
//               //                       color: Colors.black,
//               //                       fontFamily: 'Comfortaa',
//               //                       fontSize: 22,
//               //                       fontWeight: FontWeight.bold),
//               //                 ),
//               //                 // SizedBox(height: 6),
//               //                    SizedBox(height: MediaQuery.of(context).size.height/150),
//               //                 Container(
//               //                       width: MediaQuery.of(context).size.height/3.8,
//               //                     child: Text(
//               //                       'Pengiriman 1.5 km dari daerahmue',
//               //                       style: TextStyle(
//               //                           color: Colors.black54,
//               //                           fontFamily: 'Comfortaa',
//               //                           fontSize: 17,
//               //                           fontWeight: FontWeight.bold),
//               //                       textAlign: TextAlign.center,
//               //                     ))
//               //               ],
//               //             ),
//               //           ],
//               //         )),
//               //     //
//               //     Card(
//               //       //pertama
//               //         shape: RoundedRectangleBorder(
//               //             borderRadius: BorderRadius.circular(16),
//               //             side: BorderSide(color: Colors.grey)),
//               //         // color: Colors.red,
//               //         margin: EdgeInsets.only(right: 20),
//               //         // color: Colors.pink,

//               //         child: Stack(
//               //           children: [
//               //             Padding(
//               //               padding:
//               //                   const EdgeInsets.only(left: 190, bottom: 180),
//               //               child: Container(
//               //                 decoration: BoxDecoration(
//               //                     color: Colors.deepPurple[400],
//               //                     borderRadius: BorderRadius.only(
//               //                         topLeft: Radius.circular(0),
//               //                         bottomLeft: Radius.circular(100),
//               //                         topRight: Radius.circular(20))),
//               //                 //  alignment: Alignment(10,19),
//               //               ),
//               //             ),
//               //             Column(
//               //               mainAxisAlignment: MainAxisAlignment.start,
//               //               children: [
//               //                 Container(
//               //                   child: Padding(
//               //                     padding: const EdgeInsets.only(
//               //                         left: 55.0, right: 55, top: 7),
//               //                     child: Image(
//               //                         image: AssetImage(
//               //                       'gambar/produk/blackmore_c1000.png',
//               //                     )),
//               //                   ),
//               //                 ),
//               //                 //
//               //                 Container(
//               //                     height:
//               //                         MediaQuery.of(context).size.height / 15,
//               //                     width: MediaQuery.of(context).size.width/1.6,
//               //                     decoration: BoxDecoration(
//               //                       borderRadius: BorderRadius.circular(25),
//               //                       border: Border.all(color: Colors.grey),
//               //                     ),
//               //                     child: Column(
//               //                       mainAxisAlignment:
//               //                           MainAxisAlignment.center,
//               //                       children: [
//               //                         Text(
//               //                           'Blackmores',
//               //                           style: TextStyle(
//               //                               color: Colors.deepPurple[400],
//               //                               fontFamily: 'Comfortaa',
//               //                               fontSize: 18,
//               //                               fontWeight: FontWeight.bold),
//               //                         ),
//               //                         Text(
//               //                           'BIO C 1000mg',
//               //                           style: TextStyle(
//               //                               color: Colors.deepPurple[400],
//               //                               fontFamily: 'Comfortaa',
//               //                               fontSize: 18,
//               //                               fontWeight: FontWeight.bold),
//               //                         )
//               //                       ],
//               //                     )),
//               //                 //
//               //                SizedBox(height: MediaQuery.of(context).size.height/150),
//               //                 Text(
//               //                   'Rp.280.000',
//               //                   style: TextStyle(
//               //                       color: Colors.black,
//               //                       fontFamily: 'Comfortaa',
//               //                       fontSize: 22,
//               //                       fontWeight: FontWeight.bold),
//               //                 ),
//               //              SizedBox(height: MediaQuery.of(context).size.height/150),
//               //                 Container(
//               //                      width: MediaQuery.of(context).size.height/3.8,
//               //                     child: Text(
//               //                       'Pengiriman 1.5 km dari daerahmu',
//               //                       style: TextStyle(
//               //                           color: Colors.black54,
//               //                           fontFamily: 'Comfortaa',
//               //                           fontSize: 17,
//               //                           fontWeight: FontWeight.bold),
//               //                       textAlign: TextAlign.center,
//               //                     ))
//               //               ],
//               //             ),
//               //           ],
//               //         )),
//               //   ],
//               // )),
//           // SizedBox(height: 40),
//           //  SizedBox(height: MediaQuery.of(context).size.height/25),
//           // Padding(
//           //   padding: const EdgeInsets.symmetric(vertical: 8),
//           //   child: Text("Jumping Dot "),
//           // ),
//           // Padding(
//           //   padding: const EdgeInsets.only(left: 5.0, right: 5),
//           //   child: Container(
//           //     // height: 40,
//           //     height: MediaQuery.of(context).size.height/20,
//           //     width: double.infinity,
//           //     color: Colors.grey[200],
//           //     child: Center(
//           //       child: SmoothPageIndicator(
//           //         controller: controller,
//           //         count: 3,
//           //         effect: JumpingDotEffect(

//           //             // spacing: 10.0,
//           //             // radius: 2.0,
//           //             dotWidth: 24.0,
//           //             dotHeight: 16.0,
//           //             // offset: 10,
//           //             dotColor: Colors.blue[100],
//           //             paintStyle: PaintingStyle.fill,
//           //             strokeWidth: 2,
//           //             activeDotColor: Colors.indigo),
//           //       ),
//           //     ),
//           //   ),
//            ),
//       ),
//        ],
//      );
//   }
// }
