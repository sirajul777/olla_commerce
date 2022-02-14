import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:http/http.dart' as http;

class ProdukHome3 extends StatefulWidget {
  @override
  _ProdukHome3State createState() => _ProdukHome3State();
}

class _ProdukHome3State extends State<ProdukHome3> {
  final String myUrl = "https://carinih.ws/api/mitra/cari_mitra/";
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

  //
  @override
  void initState() {
    getData();
    super.initState();
  }

  // final controller = PageController(viewportFraction: 0.8);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: ScreenUtil().setHeight(5.h)),
        Padding(
          padding: EdgeInsets.only(
            left: ScreenUtil().setWidth(20.w),
            right: ScreenUtil().setWidth(20.w),
          ),
          child: Expanded(
            child: Container(
              height: ScreenUtil().setHeight(80.h),
              width: double.infinity,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: data == null ? 0 : data.length,
                  itemBuilder: (context, index) {
                    return '${data[index]['mitra_category_id']}'.contains('16')?Padding(
                      padding: EdgeInsets.only(
                            left: ScreenUtil().setWidth(5.w),
                      ),
                      child: Container(
                        height: MediaQuery.of(context).size.height,
                        width: ScreenUtil().setWidth(100.w),
                        decoration: BoxDecoration(
                            // color: Colors.red,
                            borderRadius: BorderRadius.circular(20.w),
                            border: Border.all(color: Colors.grey)),
                            child: Column(
                              children: [
                                Container(
                                                        height: ScreenUtil().setHeight(40.h),
                                                        width:ScreenUtil().setWidth(40.w) ,
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.only(
                                                            topLeft: Radius.circular(20.w),
                                                            topRight: Radius.circular(20.w),
                                                          ),
                                                          image: DecorationImage(
                                                              image: NetworkImage(
                                                                  'https://carinih.ws/uploads/upload_images/mitra/images/${data[index]['profile_image']}'),
                                                              fit: BoxFit.contain),
                                                        ),
                                ),
                                Container(
                                  height: ScreenUtil().setHeight(10.h),
                                  color: Colors.yellow[800],
                                ),
                                //
                                  Expanded(
                                    child: Container(
                                    height:MediaQuery.of(context).size.height,
                                    width:MediaQuery.of(context).size.width,
                                   decoration: BoxDecoration(
                                      color: Colors.deepPurple[400],
                                     borderRadius:BorderRadius.only(bottomLeft:Radius.circular(20),bottomRight:Radius.circular(20)),
                                   ),
                                   child: Center(child: Text(data[index]['store_name'],style: TextStyle(color: Colors.white,fontSize:10.sp,fontFamily: 'Comfortaa',fontWeight: FontWeight.w800),maxLines:2,overflow: TextOverflow.ellipsis, textAlign: TextAlign.center,)),
                                ),
                                  )
                              ],
                            ),
                      ),
                    ):SizedBox();
                    // Column(
                    //   children: [
                    //     Padding(
                    //        padding: EdgeInsets.only(
                    //             left: ScreenUtil().setWidth(5.w),
                    //        ),
                    //       child:  Container(
                    //                                 height: ScreenUtil().setHeight(70.h),
                    //                                 width:ScreenUtil().setWidth(70.w) ,
                    //                                 decoration: BoxDecoration(
                    //                                   borderRadius: BorderRadius.only(
                    //                                     topLeft: Radius.circular(20.w),
                    //                                     topRight: Radius.circular(20.w),
                    //                                   ),
                    //                                   image: DecorationImage(
                    //                                       image: NetworkImage(
                    //                                           'https://carinih.ws/uploads/upload_images/mitra/images/${data[index]['profile_image']}'),
                    //                                       ),
                    //                                 ),
                    //                                 // width: 140.w,
                    //                                 // child: Padding(
                    //                                 //   padding:  EdgeInsets.only(
                    //                                 //      ),
                    //                                 //  child:Image.network('https://carinih.ws/uploads/upload_images/product/${data[index]['image']}',fit: BoxFit.contain,
                    //                                 // child: ClipRRect(
                    //                                 //    borderRadius: BorderRadius.circular(20),
                    //                                 //   child: Image(
                    //                                 //       image: NetworkImage(
                    //                                 //     'https://carinih.ws/uploads/upload_images/product/${data[index]['image']}',
                    //                                 //   )),
                    //                               ),
                    //     ),
                    //     Text(data[index]['store_name'])
                    //   ],
                    // );
                  }),
            ),
          ),
        ),
      ],
    );
  }
}
// Center(
//       child: Directionality(
//         textDirection: TextDirection.rtl,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             SizedBox(height: 16),
//             SizedBox(
//                 // height: 210,
//                 // width: 440,
//                 height:MediaQuery.of(context).size.height/3.5,
//               width:MediaQuery.of(context).size.width/1,
//                 child:
//                     // PageView(
//                     //   controller: controller,
//                     //   children: List.generate(
//                     //       6,
//                     //       (_) => Card(
//                     //             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//                     //             margin: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
//                     //             child: Container(height: 280),
//                     //           )),
//                     // ),
//                     PageView(
//                   controller: controller,
//                   children: <Widget>[
//                     //
//                      Card(
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(16),
//                             side: BorderSide(color: Colors.grey)),
//                         // color: Colors.red,
//                         margin: EdgeInsets.only(right: 20),
//                         // color: Colors.pink,

//                         child: Stack(
//                           children: [
//                             Align(
//                               alignment: Alignment.bottomCenter,
//                               child: Container(
//                                 height: MediaQuery.of(context).size.height / 7,
//                                 decoration: BoxDecoration(
//                                     color: Colors.yellow[800],
//                                     borderRadius: BorderRadius.only(
//                                         bottomLeft: Radius.circular(16),
//                                         bottomRight: Radius.circular(16))),
//                                 //  alignment: Alignment(10,19),
//                               ),
//                             ),
//                             //
//                             Align(
//                               alignment: Alignment.bottomCenter,
//                               child: Container(
//                                 width: double.infinity,
//                                 height:
//                                     MediaQuery.of(context).size.height / 8.5,
//                                 decoration: BoxDecoration(
//                                     color: Colors.deepPurple[400],
//                                     borderRadius: BorderRadius.only(
//                                         bottomLeft: Radius.circular(16),
//                                         bottomRight: Radius.circular(16))),
//                                 //  alignment: Alignment(10,19),
//                               child:Center(child: Text('Blackmores', style: TextStyle(
//                                               color: Colors.white,
//                                               fontFamily: 'Comfortaa',
//                                               fontSize: 25,
//                                               fontWeight: FontWeight.bold),
//                                         )),
//                               ),
//                             ),
//                             //
//                             Align(
//                               alignment: Alignment(0.0,-0.5),
//                               child:  Text(
//                                           'BLACKMORES',
//                                           style: TextStyle(
//                                               color: Colors.deepPurple[400],
//                                               fontFamily: 'Comfortaa',
//                                               fontSize: 30,
//                                               fontWeight: FontWeight.bold),
//                                         ),),
//                             //
//                           ],
//                         )),
//                     //
//                     Card(
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(16),
//                             side: BorderSide(color: Colors.grey)),
//                         // color: Colors.red,
//                         margin: EdgeInsets.only(right: 20),
//                         // color: Colors.pink,

//                         child: Stack(
//                           children: [
//                             Align(
//                               alignment: Alignment.bottomCenter,
//                               child: Container(
//                                 height: MediaQuery.of(context).size.height / 7,
//                                 decoration: BoxDecoration(
//                                     color: Colors.yellow[800],
//                                     borderRadius: BorderRadius.only(
//                                         bottomLeft: Radius.circular(16),
//                                         bottomRight: Radius.circular(16))),
//                                 //  alignment: Alignment(10,19),
//                               ),
//                             ),
//                             //
//                             Align(
//                               alignment: Alignment.bottomCenter,
//                               child: Container(
//                                 width: double.infinity,
//                                 height:
//                                     MediaQuery.of(context).size.height / 8.5,
//                                 decoration: BoxDecoration(
//                                     color: Colors.deepPurple[400],
//                                     borderRadius: BorderRadius.only(
//                                         bottomLeft: Radius.circular(16),
//                                         bottomRight: Radius.circular(16))),
//                                 //  alignment: Alignment(10,19),
//                               child:Center(child: Text('Blackmores', style: TextStyle(
//                                               color: Colors.white,
//                                               fontFamily: 'Comfortaa',
//                                               fontSize: 25,
//                                               fontWeight: FontWeight.bold),
//                                         )),
//                               ),
//                             ),
//                             //
//                             Align(
//                               alignment: Alignment(0.0,-0.5),
//                               child:  Text(
//                                           'BLACKMORES',
//                                           style: TextStyle(
//                                               color: Colors.deepPurple[400],
//                                               fontFamily: 'Comfortaa',
//                                               fontSize: 30,
//                                               fontWeight: FontWeight.bold),
//                                         ),),
//                             //
//                           ],
//                         ),),
//                     //
//                     Card(
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(16),
//                             side: BorderSide(color: Colors.grey)),
//                         // color: Colors.red,
//                         margin: EdgeInsets.only(right: 20),
//                         // color: Colors.pink,

//                         child: Stack(
//                           children: [
//                             Align(
//                               alignment: Alignment.bottomCenter,
//                               child: Container(
//                                 height: MediaQuery.of(context).size.height / 7,
//                                 decoration: BoxDecoration(
//                                     color: Colors.yellow[800],
//                                     borderRadius: BorderRadius.only(
//                                         bottomLeft: Radius.circular(16),
//                                         bottomRight: Radius.circular(16))),
//                                 //  alignment: Alignment(10,19),
//                               ),
//                             ),
//                             //
//                             Align(
//                               alignment: Alignment.bottomCenter,
//                               child: Container(
//                                 width: double.infinity,
//                                 height:
//                                     MediaQuery.of(context).size.height / 8.5,
//                                 decoration: BoxDecoration(
//                                     color: Colors.deepPurple[400],
//                                     borderRadius: BorderRadius.only(
//                                         bottomLeft: Radius.circular(16),
//                                         bottomRight: Radius.circular(16))),
//                                 //  alignment: Alignment(10,19),
//                               child:Center(child: Text('Blackmores', style: TextStyle(
//                                               color: Colors.white,
//                                               fontFamily: 'Comfortaa',
//                                               fontSize: 25,
//                                               fontWeight: FontWeight.bold),
//                                         )),
//                               ),
//                             ),
//                             //
//                             Align(
//                               alignment: Alignment(0.0,-0.5),
//                               child:  Text(
//                                           'BLACKMORES',
//                                           style: TextStyle(
//                                               color: Colors.deepPurple[400],
//                                               fontFamily: 'Comfortaa',
//                                               fontSize: 30,
//                                               fontWeight: FontWeight.bold),
//                                         ),),
//                             //
//                           ],
//                         )),
//                   ],
//                 )),
//               SizedBox(height: MediaQuery.of(context).size.height/25),
//             // Padding(
//             //   padding: const EdgeInsets.symmetric(vertical: 8),
//             //   child: Text("Jumping Dot "),
//             // ),
//             Padding(
//               padding: const EdgeInsets.only(left: 5.0, right: 5),
//               child: Container(
//                   height: MediaQuery.of(context).size.height/30,
//                 width: double.infinity,
//                 color: Colors.grey[200],
//                 child: Center(
//                   child: SmoothPageIndicator(
//                     controller: controller,
//                     count: 3,
//                     effect: JumpingDotEffect(

//                         // spacing: 10.0,
//                         // radius: 2.0,
//                         dotWidth: 10.0,
//                         dotHeight: 10.0,
//                         // offset: 10,
//                         dotColor: Colors.red[100],
//                         paintStyle: PaintingStyle.fill,
//                         strokeWidth: 3,
//                         activeDotColor: Colors.red),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
