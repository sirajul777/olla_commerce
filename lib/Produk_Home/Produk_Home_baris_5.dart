import 'dart:convert';

import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;

class ProdukHome5 extends StatefulWidget{
  @override
  _ProdukHome5State createState() => _ProdukHome5State();
}

class _ProdukHome5State extends State<ProdukHome5> {
  @override
  //
//  final String myUrl = "https://carinih.ws/api/banner/";
  String data;
  String data1;

  //
   getData() async {
    final response = await http.get(Uri.parse(Uri.encodeFull('https://carinih.ws/api/banner/')),
        headers: {"Accept": "application/json"});
    print(response.body);
    //
    setState(() {
      var converDataToJson = json.decode(response.body);
      data = converDataToJson['data'][2]['image'];
       data1 = converDataToJson['data'][6]['image'];
    });
    return "Success";
  }

  @override
  void initState() {
    getData();
    super.initState();
  }
  //
  Widget build(BuildContext context){
    return   SizedBox(
                              
                                 height: ScreenUtil().setHeight(240),
                              child: Carousel(
                                // autoplay: true,
                                animationCurve: Curves.fastOutSlowIn,
                                animationDuration:
                                    Duration(milliseconds: 500),
                                dotSize: 6.0,
                                dotIncreasedColor: Colors.white,
                                dotBgColor: Colors.blue[300],
                                dotColor: Colors.white38,
                                dotPosition: DotPosition.bottomCenter,
                                borderRadius:true,
                                dotIncreaseSize: 2,
                                dotVerticalPadding: 0.0,
                                showIndicator: true,
                                indicatorBgPadding: 8.0,
                                images:[
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius:BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
                                      image: DecorationImage(
                                        image: NetworkImage('https://carinih.ws/uploads/upload_images/banner_banner/banner_a6c7499.jpg'),
                                      )
                                    ),
                                  ),
                                  //
                                  // Container(
                                  //   decoration: BoxDecoration(
                                  //     borderRadius:BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
                                  //     image: DecorationImage(
                                  //       image: NetworkImage('https://carinih.ws/uploads/upload_images/banner_banner/banner_a6c7499.jpg'),
                                  //     )
                                  //   ),
                                  // )
                                  // NetworkImage('https://carinih.ws/uploads/upload_images/banner_banner/$data')
                                ]
                              ),
                            );
  }
}