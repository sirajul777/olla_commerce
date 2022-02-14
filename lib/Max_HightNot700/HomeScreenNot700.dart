import 'dart:convert';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:product/Produk_Home/Produk_Home_baris_1.dart';
import 'package:product/Produk_Home/Produk_Home_baris_2.dart';
import 'package:product/Produk_Home/Produk_Home_baris_3.dart';
import 'package:product/Produk_Home/Produk_Rekomendasi.dart';
import 'package:product/Produk_Home/Produk_cari_mitra.dart';
import 'package:product/Produk_Home/Produk_cari_store.dart';
import 'package:product/Produk_Home_No_700/Produk_Home_Baris_1_N0_700.dart';
import 'package:product/Produk_Home_No_700/Produk_Home_Baris_2_No_700.dart';
import 'package:product/animation_floating_icon_home/animation.dart';
import 'package:product/testapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class HomeScreenNot700 extends StatefulWidget {
  @override
  _HomeScreenNot700State createState() => _HomeScreenNot700State();
}

class _HomeScreenNot700State extends State<HomeScreenNot700>
    with TickerProviderStateMixin {
  // int index = 0;
  final String myUrl = "https://carinih.ws/api/icon_home";
  List data2;

  //
  Future<String> getData() async {
    var response = await http.get(Uri.parse(Uri.encodeFull(myUrl)),
        headers: {"Accept": "application/json"});
    print(response.body);
    //
    setState(() {
      var converDataToJson = json.decode(response.body);
      data2 = converDataToJson['data'];
    });
    return "Success";
  }

  final String url = "https://carinih.ws/api/banner/";
  String data1;
  Future<String> getJsonData() async {
    http.Response response = await http.get(Uri.parse(Uri.encodeFull(url)),
        headers: {"Accept": "application/json"});
    print(response.body);

    Map<String, dynamic> data = json.decode(response.body);
    setState(() {
      data1 = data['data'][3]['image'];
    });

    print('$data1');
  }

  //
  AnimationController _ColorAnimationController;
  AnimationController _TextAnimationController;
  Animation _colorTween, _iconColorTween, _iconColorTween1;
  Animation<Offset> _transTween;

  @override
  void initState() {
    _ColorAnimationController =
        AnimationController(vsync: this, duration: Duration(seconds: 0));
    _colorTween = ColorTween(begin: Colors.transparent, end: Colors.white)
        .animate(_ColorAnimationController);
    _iconColorTween = ColorTween(begin: Colors.white, end: Colors.grey[100])
        .animate(_ColorAnimationController);
    _iconColorTween1 = ColorTween(begin: Colors.white, end: Colors.grey)
        .animate(_ColorAnimationController);
    _TextAnimationController =
        AnimationController(vsync: this, duration: Duration(seconds: 0));

    _transTween = Tween(begin: Offset(-10, 40), end: Offset(-10, 0))
        .animate(_TextAnimationController);
    getJsonData();
    getData();
    super.initState();
  }

  bool _scrollListener(ScrollNotification scrollInfo) {
    if (scrollInfo.metrics.axis == Axis.vertical) {
      _ColorAnimationController.animateTo(scrollInfo.metrics.pixels / 350);

      _TextAnimationController.animateTo(
          (scrollInfo.metrics.pixels - 350) / 50);
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        // color: Colors.red,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: NotificationListener<ScrollNotification>(
            onNotification: _scrollListener,
            child: Stack(
              children: [
                SingleChildScrollView(
                    child: Column(
                  children: [
                    Stack(
                      children: [
                        //unutk banner
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 3,
                          child: Carousel(
                            // autoplay: true,
                            animationCurve: Curves.fastOutSlowIn,
                            animationDuration: Duration(milliseconds: 500),
                            dotSize: 6.0,
                            dotIncreasedColor: Colors.white,
                            dotBgColor: Colors.transparent,
                            dotColor: Colors.grey,
                            dotPosition: DotPosition.bottomRight,
                            dotVerticalPadding: 30.0,
                            showIndicator: true,
                            indicatorBgPadding: 7.0,
                            images: [
                              // RaisedButton(onPressed: (){
                              //   getJsonData();
                              // }),
                              // Center(child: Text('$data1'))

                              NetworkImage(
                                  'https://carinih.ws/uploads/upload_images/banner_banner/$data1'),
                              //   Image.network(
                              // 'https://carinih.ws/uploads/upload_images/banner_banner/banner_1251991.jpg',fit: BoxFit.fitWidth),
                              //   Image.network(
                              // 'https://carinih.ws/uploads/upload_images/banner_banner/banner_86d84ad.jpg',fit: BoxFit.fill),
                              // NetworkImage(
                              //     'https://carinih.ws/uploads/upload_images/banner_banner/${data[index]['image']}'),
                              // NetworkImage(
                              //     'https://carinih.ws/uploads/upload_images/banner_banner/${data[index]['image']}'),
                              //  Image.network('https://carinih.ws/uploads/upload_images/banner_banner/$data'),
                            ],

                            // TestApi(),
                            //   TestApi()
                            // NetworkImage(
                            //     'https://cdn-images-1.medium.com/max/2000/1*GqdzzfB_BHorv7V2NV7Jgg.jpeg'),
                            // NetworkImage(
                            //     'https://cdn-images-1.medium.com/max/2000/1*wnIEgP1gNMrK5gZU7QS0-A.jpeg'),
                            // NetworkImage(
                            //     'https://cdn-images-1.medium.com/max/2000/1*wnIEgP1gNMrK5gZU7QS0-A.jpeg'),
                          ),
                        ),
                        //akhir banner
                        //
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 215.0),
                            child: Container(
                                height: MediaQuery.of(context).size.height / 8,
                                width: MediaQuery.of(context).size.width / 1.1,
                                decoration: BoxDecoration(
                                    color: Colors.deepPurple[400],
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: Colors.white, width: 2)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                19,
                                            // width: 30,
                                            child: GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (BuildContext
                                                                context) =>
                                                            TestApi()));
                                              },
                                              child: Container(
                                                child: Image.asset(
                                                  'gambar/images/hi_icon.png',
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            )),
                                        //
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'WELCOME',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12),
                                                ),
                                                Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            5,
                                                    child: Text(
                                                      'Daftar Pengguna Baru',
                                                      textAlign: TextAlign.left,
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 10,
                                                          fontFamily:
                                                              'Comfortaa'),
                                                    )),
                                              ]),
                                        ),
                                      ],
                                    ),
                                    //
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              10,
                                      width: MediaQuery.of(context).size.width /
                                          110,
                                      color: Colors.white,
                                    ),

                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                30,
                                            // width: 30,
                                            child: Image.asset(
                                              'gambar/images/voucher_icon.png',
                                              fit: BoxFit.cover,
                                            )),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'REWARDS',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12),
                                                ),
                                                Container(
                                                    //  width: MediaQuery.of(context).size.width/4,
                                                    child: Text(
                                                  '10 Voucher',
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 10,
                                                      fontFamily: 'Comfortaa'),
                                                )),
                                              ]),
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
                          ),
                        ),
                        //
                        Positioned(
                          bottom: 100,
                          left: 15,
                          child: Stack(
                            children: [
                              Container(
                                height: 30,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 65.0),
                                  child: Image.asset(
                                    'gambar/images/icon_promo.png',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 50,
                                bottom: 8,
                                child: Text('Semua Promo',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontFamily: 'Comfortaa')),
                              ),
                            ],
                          ),
                        ),
                        //
                      ],
                    ), //akhir stack
                    // Positioned(
                    //   bottom: 110,
                    //   left: 15,
                    //   child: Stack(
                    //     children: [
                    //       Container(
                    //         height: 30,
                    //         child: Padding(
                    //           padding: const EdgeInsets.only(right: 65.0),
                    //           child: Image.asset(
                    //             'gambar/images/icon_promo.png',
                    //             fit: BoxFit.contain,
                    //           ),
                    //         ),
                    //       ),
                    //       Positioned(
                    //         left: 50,
                    //         bottom: 8,
                    //         child: Text('Semua Promo',
                    //             style: TextStyle(
                    //                 color: Colors.white,
                    //                 fontSize: 12,
                    //                 fontFamily: 'Comfortaa')),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    //
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 15),
                      child: Container(
                        height: MediaQuery.of(context).size.height / 3,
                        width: MediaQuery.of(context).size.width,
                        // color: Colors.red,
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 5,
                                  mainAxisSpacing: 0,
                                  childAspectRatio: 1 / 1.6,
                                  crossAxisSpacing: 4),
                          itemCount: data2 == null ? 0 : data2.length,
                          itemBuilder: (BuildContext context, int i) {
                            if (data2[i]['image_group'].contains('13')) {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 60,
                                    child: Image.network(
                                      'https://carinih.ws/uploads/upload_images/image_image/${data2[i]['image']}',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Container(
                                      height: 40,
                                      width: 75,
                                      child: Text(
                                        data2[i]['title'],
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 8),
                                      ))
                                ],
                              );
                              // Column(
                              //   children: [
                              //     Image.network(
                              //         'https://carinih.ws/uploads/upload_images/image_image/${data2[i]['image']}',
                              //         fit: BoxFit.cover,
                              //       ),
                              //       Expanded(child: Text(data2[i]['title'],textAlign:TextAlign.center,style: TextStyle(fontSize: 9),))
                              //   ],
                              // );

                              //Container(
                              //   child: Image.network(
                              //     'https://carinih.ws/uploads/upload_images/image_image/${data2[i]['image']}',
                              //     fit: BoxFit.cover,
                              //   ),
                              // );

                              //  ListTile(
                              //   title:
                              //    Image.network(
                              //           'https://carinih.ws/uploads/upload_images/image_image/${data2[i]['image']}'),
                              //           subtitle: Text(data2[i]['title']),
                              // );
                              // Image.network(
                              // 'https://carinih.ws/uploads/upload_images/image_image/${data2[i]['image']}');

                              // Image.network(
                              //     'https://carinih.ws/uploads/upload_images/image_image/${data2[i]['image']}');

                            } else {
                              print('tidak ada gambar');
                            }
                          },
                        ),
                        // Column(
                        //   mainAxisAlignment: MainAxisAlignment.start,
                        //   children: [
                        //     //
                        //     Row(
                        //       crossAxisAlignment: CrossAxisAlignment.start,
                        //       mainAxisAlignment: MainAxisAlignment.spaceAround,
                        //       children: [
                        //         Column(
                        //           crossAxisAlignment: CrossAxisAlignment.start,
                        //           mainAxisAlignment:
                        //               MainAxisAlignment.spaceAround,
                        //           children: [
                        //             Container(
                        //               height: 45,
                        //               width: 45,
                        //               decoration: BoxDecoration(
                        //                 image: DecorationImage(
                        //                     image: AssetImage(
                        //                         'gambar/images/kesehatan_icon.png')),
                        //                 borderRadius: BorderRadius.circular(5),
                        //               ),
                        //             ),
                        //             Text(
                        //               'CARimakan',
                        //               style: TextStyle(
                        //                   fontSize: 10, fontFamily: 'Comfortaa'),
                        //             )
                        //           ],
                        //         ),
                        //         //
                        //         Column(
                        //           mainAxisAlignment:
                        //               MainAxisAlignment.spaceAround,
                        //           children: [
                        //             Container(
                        //               height: 45,
                        //               width: 45,
                        //               decoration: BoxDecoration(
                        //                 image: DecorationImage(
                        //                     image: AssetImage(
                        //                         'gambar/images/kesehatan_icon.png')),
                        //                 borderRadius: BorderRadius.circular(5),
                        //               ),
                        //             ),
                        //             Text(
                        //               'CARi \nKesehatan',
                        //               style: TextStyle(
                        //                   fontSize: 9, fontFamily: 'Comfortaa'),
                        //               textAlign: TextAlign.center,
                        //             )
                        //           ],
                        //         ),
                        //         Column(
                        //           mainAxisAlignment:
                        //               MainAxisAlignment.spaceAround,
                        //           children: [
                        //             Container(
                        //               height: 45,
                        //               width: 45,
                        //               decoration: BoxDecoration(
                        //                 image: DecorationImage(
                        //                     image: AssetImage(
                        //                         'gambar/images/perlengkapan_icon.png')),
                        //                 borderRadius: BorderRadius.circular(5),
                        //               ),
                        //             ),
                        //             Text(
                        //               'CARi\n Perlengkapan \nAnak',
                        //               style: TextStyle(
                        //                 fontSize: 9,
                        //                 fontFamily: 'Comfortaa',
                        //               ),
                        //               textAlign: TextAlign.center,
                        //             )
                        //           ],
                        //         ),
                        //         Column(
                        //           mainAxisAlignment:
                        //               MainAxisAlignment.spaceAround,
                        //           children: [
                        //             Container(
                        //               height: 45,
                        //               width: 45,
                        //               decoration: BoxDecoration(
                        //                 image: DecorationImage(
                        //                     image: AssetImage(
                        //                         'gambar/images/vitamin_icon.png')),
                        //                 borderRadius: BorderRadius.circular(5),
                        //               ),
                        //             ),
                        //             Text(
                        //               'CARi \nVitamin',
                        //               style: TextStyle(
                        //                   fontSize: 9, fontFamily: 'Comfortaa'),
                        //               textAlign: TextAlign.center,
                        //             )
                        //           ],
                        //         ),
                        //         Column(
                        //           mainAxisAlignment:
                        //               MainAxisAlignment.spaceAround,
                        //           children: [
                        //             Container(
                        //               height: 45,
                        //               width: 45,
                        //               decoration: BoxDecoration(
                        //                 image: DecorationImage(
                        //                     image: AssetImage(
                        //                         'gambar/images/rumah_tangga_icon.png')),
                        //                 borderRadius: BorderRadius.circular(5),
                        //               ),
                        //             ),
                        //             Text(
                        //               'CARi \nKebutuhan \nRumah \nTangga',
                        //               style: TextStyle(
                        //                   fontSize: 9, fontFamily: 'Comfortaa'),
                        //               textAlign: TextAlign.center,
                        //             )
                        //           ],
                        //         )
                        //       ],
                        //     ),
                        //     //
                        //     SizedBox(height: 55),
                        //     Row(
                        //       mainAxisAlignment: MainAxisAlignment.spaceAround,
                        //       children: [
                        //         Column(
                        //           mainAxisAlignment:
                        //               MainAxisAlignment.spaceAround,
                        //           children: [
                        //             Container(
                        //               height: 45,
                        //               width: 45,
                        //               decoration: BoxDecoration(
                        //                 image: DecorationImage(
                        //                     image: AssetImage(
                        //                         'gambar/images/project_icon.png')),
                        //                 borderRadius: BorderRadius.circular(5),
                        //               ),
                        //             ),
                        //             SizedBox(height: 5),
                        //             Text(
                        //               'CARi Project',
                        //               style: TextStyle(
                        //                   fontSize: 9, fontFamily: 'Comfortaa'),
                        //             )
                        //           ],
                        //         ),
                        //         //
                        //         Column(
                        //           mainAxisAlignment:
                        //               MainAxisAlignment.spaceAround,
                        //           children: [
                        //             Container(
                        //               height: 45,
                        //               width: 45,
                        //               decoration: BoxDecoration(
                        //                 image: DecorationImage(
                        //                     image: AssetImage(
                        //                         'gambar/images/kesehatan_icon.png')),
                        //                 borderRadius: BorderRadius.circular(5),
                        //               ),
                        //             ),
                        //             SizedBox(height: 5),
                        //             Text(
                        //               'CARi Farmasi',
                        //               style: TextStyle(
                        //                   fontSize: 9, fontFamily: 'Comfortaa'),
                        //               textAlign: TextAlign.center,
                        //             )
                        //           ],
                        //         ),
                        //         Column(
                        //           mainAxisAlignment:
                        //               MainAxisAlignment.spaceAround,
                        //           children: [
                        //             Container(
                        //               height: 45,
                        //               width: 45,
                        //               decoration: BoxDecoration(
                        //                 image: DecorationImage(
                        //                     image: AssetImage(
                        //                         'gambar/images/kesehatan_icon.png')),
                        //                 borderRadius: BorderRadius.circular(5),
                        //               ),
                        //             ),
                        //             SizedBox(height: 5),
                        //             Text(
                        //               'CARi Service',
                        //               style: TextStyle(
                        //                   fontSize: 9, fontFamily: 'Comfortaa'),
                        //               textAlign: TextAlign.center,
                        //             )
                        //           ],
                        //         ),
                        //         Column(
                        //           mainAxisAlignment:
                        //               MainAxisAlignment.spaceAround,
                        //           children: [
                        //             Container(
                        //               height: 45,
                        //               width: 45,
                        //               decoration: BoxDecoration(
                        //                 image: DecorationImage(
                        //                     image: AssetImage(
                        //                         'gambar/images/kesehatan_icon.png')),
                        //                 borderRadius: BorderRadius.circular(5),
                        //               ),
                        //             ),
                        //             SizedBox(height: 5),
                        //             Text(
                        //               'CARi Event',
                        //               style: TextStyle(
                        //                   fontSize: 9, fontFamily: 'Comfortaa'),
                        //               textAlign: TextAlign.center,
                        //             )
                        //           ],
                        //         ),
                        //         Column(
                        //           mainAxisAlignment:
                        //               MainAxisAlignment.spaceAround,
                        //           children: [
                        //             Container(
                        //               height: 45,
                        //               width: 45,
                        //               decoration: BoxDecoration(
                        //                 image: DecorationImage(
                        //                     image: AssetImage(
                        //                         'gambar/images/kesehatan_icon.png')),
                        //                 borderRadius: BorderRadius.circular(5),
                        //               ),
                        //             ),
                        //             SizedBox(height: 5),
                        //             Text(
                        //               'Flash Sale',
                        //               style: TextStyle(
                        //                   fontSize: 9, fontFamily: 'Comfortaa'),
                        //               textAlign: TextAlign.center,
                        //             )
                        //           ],
                        //         ),
                        //       ],
                        //     ),
                        //   ],
                        // ),

                        // child: GridView.count(
                        //   shrinkWrap: true,
                        //   physics: ScrollPhysics(),
                        //   //  crossAxisSpacing: ,
                        // mainAxisSpacing: 50,
                        //   crossAxisCount:4,
                        //   padding: EdgeInsets.only(bottom: 10),

                        //   children: [
                        //     Container(
                        //       child: Column(
                        //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //         children: [
                        //           Container(
                        //             height: 45.0,
                        //             width: 45.0,
                        //             decoration: BoxDecoration(
                        //               borderRadius: BorderRadius.circular(5.0),
                        //               image: DecorationImage(
                        //                 image: AssetImage('gambar/images/kesehatan_icon.png'),
                        //               ),
                        //             ),
                        //           ),
                        //           // Container(
                        //           //   width: 80,
                        //           //   // height: 20,

                        //           //   child: Text('CARimakan', style: TextStyle(fontSize: 12)
                        //           //   ),
                        //           //   ),
                        //         ],
                        //       ),
                        //     ),
                        //       Container(
                        //       child: Column(
                        //         mainAxisAlignment: MainAxisAlignment.spaceAround,
                        //         children: [
                        //           Container(
                        //             height: 45.0,
                        //             width: 45.0,
                        //             decoration: BoxDecoration(
                        //               borderRadius: BorderRadius.circular(5.0),
                        //               image: DecorationImage(
                        //                 image: AssetImage('gambar/images/kesehatan_icon.png'),
                        //               ),
                        //             ),
                        //           ),
                        //           // SizedBox(height: 10,),
                        //           Container(

                        //             child: Text('Cari Kesehatan', style: TextStyle(fontSize: 10,fontFamily: 'Comfortaa'),textAlign: TextAlign.center,)),
                        //         ],
                        //       ),
                        //     ),
                        //       Container(
                        //       child: Column(
                        //         mainAxisAlignment: MainAxisAlignment.spaceAround,
                        //         children: [
                        //           Container(
                        //               height: 45.0,
                        //             width: 45.0,
                        //             decoration: BoxDecoration(
                        //               borderRadius: BorderRadius.circular(5.0),
                        //               image: DecorationImage(
                        //                 image: AssetImage('gambar/images/perlengkapan_icon.png'),
                        //               ),
                        //             ),
                        //           ),
                        //           Container(
                        //             // alignment: Alignment.center,
                        //             child: Text('Cari Perlengkapan Anak', style: TextStyle(fontSize: 9,fontFamily: 'Comfortaa'),textAlign: TextAlign.center,)),
                        //         ],
                        //       ),
                        //     ),
                        //       Container(
                        //       child: Column(
                        //         mainAxisAlignment: MainAxisAlignment.spaceAround,
                        //         children: [
                        //           Container(
                        //             height: 50.0,
                        //             width: 50.0,
                        //             decoration: BoxDecoration(
                        //               borderRadius: BorderRadius.circular(5.0),
                        //               image: DecorationImage(
                        //                 image: AssetImage('gambar/images/vitamin_icon.png'),
                        //               ),
                        //             ),
                        //           ),
                        //           // Text('Games', style: TextStyle(fontSize: 12)),`
                        //         ],
                        //       ),
                        //     ),
                        //       Container(
                        //       child: Column(
                        //         mainAxisAlignment: MainAxisAlignment.spaceAround,
                        //         children: [
                        //           Container(
                        //              height: 50.0,
                        //             width: 50.0,
                        //             decoration: BoxDecoration(
                        //               borderRadius: BorderRadius.circular(5.0),
                        //               image: DecorationImage(
                        //                 image: AssetImage('gambar/images/rumah_tangga_icon.png'),
                        //               ),
                        //             ),
                        //           ),
                        //           // Text('Games', style: TextStyle(fontSize: 12)),
                        //         ],
                        //       ),
                        //     ),
                        //      Container(
                        //       child: Column(
                        //         mainAxisAlignment: MainAxisAlignment.spaceAround,
                        //         children: [
                        //           Container(
                        //             height: 50.0,
                        //             width: 50.0,
                        //             decoration: BoxDecoration(
                        //               borderRadius: BorderRadius.circular(5.0),
                        //               image: DecorationImage(
                        //                 image: AssetImage('gambar/images/project_icon.png'),
                        //               ),
                        //             ),
                        //           ),
                        //           // Text('Games', style: TextStyle(fontSize: 12)),
                        //         ],
                        //       ),
                        //     ),
                        //      Container(
                        //       child: Column(
                        //         mainAxisAlignment: MainAxisAlignment.spaceAround,
                        //         children: [
                        //           Container(
                        //             height: 50.0,
                        //             width: 50.0,
                        //             decoration: BoxDecoration(
                        //               borderRadius: BorderRadius.circular(5.0),
                        //               image: DecorationImage(
                        //                 image: AssetImage('gambar/images/rumah_tangga_icon.png'),
                        //               ),
                        //             ),
                        //           ),
                        //           // Text('Games', style: TextStyle(fontSize: 12)),
                        //         ],
                        //       ),
                        //     ),
                        //      Container(
                        //       child: Column(
                        //         mainAxisAlignment: MainAxisAlignment.spaceAround,
                        //         children: [
                        //           Container(
                        //             height: 50.0,
                        //             width: 50.0,
                        //             decoration: BoxDecoration(
                        //               borderRadius: BorderRadius.circular(5.0),
                        //               image: DecorationImage(
                        //                 image: AssetImage('gambar/images/rumah_tangga_icon.png'),
                        //               ),
                        //             ),
                        //           ),
                        //           // Text('Games', style: TextStyle(fontSize: 12)),
                        //         ],
                        //       ),
                        //     ),
                        //      Container(
                        //       child: Column(
                        //         mainAxisAlignment: MainAxisAlignment.spaceAround,
                        //         children: [
                        //           Container(
                        //             height: 50.0,
                        //             width: 50.0,
                        //             decoration: BoxDecoration(
                        //               borderRadius: BorderRadius.circular(5.0),
                        //               image: DecorationImage(
                        //                 image: AssetImage('gambar/images/rumah_tangga_icon.png'),
                        //               ),
                        //             ),
                        //           ),
                        //           // Text('Games', style: TextStyle(fontSize: 12)),
                        //         ],
                        //       ),
                        //     ),
                        //      Container(
                        //       child: Column(
                        //         mainAxisAlignment: MainAxisAlignment.spaceAround,
                        //         children: [
                        //           Container(
                        //             height: 50.0,
                        //             width: 50.0,
                        //             decoration: BoxDecoration(
                        //               borderRadius: BorderRadius.circular(5.0),
                        //               image: DecorationImage(
                        //                 image: AssetImage('gambar/images/rumah_tangga_icon.png'),
                        //               ),
                        //             ),
                        //           ),
                        //           // Text('Games', style: TextStyle(fontSize: 12)),
                        //         ],
                        //       ),
                        //     ),
                        //   ],
                        // ),
                      ),
                    ),
                    Stack(
                      children: [
                        Container(
                          color: Colors.grey[200],
                          height: MediaQuery.of(context).size.height / 35,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 7.0),
                          child: Center(
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.deepPurple[400],
                                  borderRadius: BorderRadius.circular(10)),
                              height: 10,
                              width: 30,
                            ),
                          ),
                        ),
                        //
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: ProdukRekomendasi(),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 7.0, right: 7, top: 20),
                      child: Divider(
                        thickness: 3,
                        color: Colors.grey[200],
                      ),
                    ),
                    ProdukHomeNo700(),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: ProdukCariStore(),
                    ),
                    ProdukHome2No700(),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: ProdukCariMitra(),
                    ),
                    ProdukHome3()
                    // Text('dddddddddddddddd'),
                    // Text('dddddddddddddddd'),
                    // Text('dddddddddddddddd'),
                    // Text('dddddddddddddddd'),
                    // Text('dddddddddddddddd'),
                    // Text('dddddddddddddddd'),
                    // Text('dddddddddddddddd'),
                    // Text('dddddddddddddddd'),
                    // Text('dddddddddddddddd'),
                    // Text('dddddddddddddddd'),
                    // Text('dddddddddddddddd'),
                    // Text('dddddddddddddddd'),
                    // Text('dddddddddddddddd'),
                    // Text('dddddddddddddddd'),
                    // Text('dddddddddddddddd'),
                    // Text('dddddddddddddddd'),
                    // Text('dddddddddddddddd'),
                    // Text('dddddddddddddddd'),
                    // Text('dddddddddddddddd'),
                    // Text('dddddddddddddddd'),
                    // Text('dddddddddddddddd'),
                    // Text('dddddddddddddddd'),
                    // Text('dddddddddddddddd'),
                    // Text('dddddddddddddddd'),
                    // Text('dddddddddddddddd'),
                    // Text('dddddddddddddddd'),
                    // Text('dddddddddddddddd'),
                    // Text('dddddddddddddddd'),
                    // Text('dddddddddddddddd'),
                    // Text('dddddddddddddddd'),
                    // Text('dddddddddddddddd'),
                    // Text('dddddddddddddddd'),
                    // Text('dddddddddddddddd'),
                    // Text('dddddddddddddddd'),
                    // Text('dddddddddddddddd'),
                    // Text('dddddddddddddddd'),
                    // Text('dddddddddddddddd'),
                    // Text('dddddddddddddddd'),
                    // Text('dddddddddddddddd'),
                    // Text('dddddddddddddddd'),
                    // Text('dddddddddddddddd'),
                    // Text('dddddddddddddddd'),
                    // Text('dddddddddddddddd'),
                    // Text('dddddddddddddddd'),
                    // Text('dddddddddddddddd'),
                    // Text('dddddddddddddddd'),
                    // Text('dddddddddddddddd'),
                    // Text('dddddddddddddddd'),
                    // Text('dddddddddddddddd'),
                    // Text('dddddddddddddddd'),
                    // Text('dddddddddddddddd'),
                    // Text('dddddddddddddddd'),
                    // Text('dddddddddddddddd'),
                    // Text('dddddddddddddddd'),
                    // Text('dddddddddddddddd'),
                    // Text('dddddddddddddddd'),
                  ],
                )),
                //dibawah singlechilscroolview masi didalam stack pertama
                //unutk yang jika d scrool maka akan berubah warna(animaation)
                Container(
                  // height: 80,
                  child: AnimatedBuilder(
                    animation: _ColorAnimationController,
                    builder: (context, child) => Container(
                        color: _colorTween.value,
                        margin: EdgeInsets.only(),
                        padding: EdgeInsets.only(
                          left: MediaQuery.of(context).padding.left / 15,
                          right: MediaQuery.of(context).padding.right / 10,
                          top: MediaQuery.of(context).padding.top,
                          // bottom: 5.h,
                        ),
                        height: MediaQuery.of(context).size.height / 14 +
                            MediaQuery.of(context).padding.top,
                        // unutk searcbar na
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: _iconColorTween.value,
                                ),
                                height: MediaQuery.of(context).size.height / 16,
                                width: MediaQuery.of(context).size.width / 1.8,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 3.0),
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: 'Cari masker medis',
                                      border: InputBorder.none,
                                      prefixIcon: Icon(
                                        Icons.search,
                                        color: Colors.blue,
                                      ),
                                    ),
                                    style: TextStyle(
                                        fontSize: 12, fontFamily: 'Comfortaa'),
                                  ),
                                )),
                            Container(
                                height: 20,
                                width: 25,
                                child: Image.asset(
                                  'gambar/images/love_icon.png',
                                  color: _iconColorTween1.value,
                                  fit: BoxFit.contain,
                                )),
                            Container(
                                height: 20,
                                width: 25,
                                child: Image.asset(
                                  'gambar/images/cart_icon.png',
                                  color: _iconColorTween1.value,
                                  fit: BoxFit.contain,
                                )),
                            Container(
                                height: 20,
                                width: 25,
                                child: Image.asset(
                                  'gambar/images/dll_icon.png',
                                  color: _iconColorTween1.value,
                                  fit: BoxFit.contain,
                                ))
                          ],
                        )),
                  ),
                ),
                //
                AnimationFloat()
              ],
            ),
          ),
        ),
      ),
    ));

    // child: AnnotatedRegion<SystemUiOverlayStyle>(
    //   value: SystemUiOverlayStyle(
    //     statusBarColor: Colors.transparent,
    //   ),
    //   child: Container(
    //     height: MediaQuery.of(context).size.height,
    //     width: MediaQuery.of(context).size.width,
    //     color: Colors.red,
    //     child: Scaffold(
    //       backgroundColor: Colors.white,
    //       body: NotificationListener<ScrollNotification>(
    //         onNotification: _scrollListener,
    //         child: Stack(
    //           children: [
    //             SingleChildScrollView(
    //                 child: Column(
    //                 children: [
    //                 Stack(
    //                   children: [
    //                         //unutk banner
    //                     SizedBox(
    //                       height:
    //                           MediaQuery.of(context).size.height / 3,
    //                       child: Carousel(
    //                         // autoplay: true,
    //                         animationCurve: Curves.fastOutSlowIn,
    //                         animationDuration:
    //                             Duration(milliseconds: 500),
    //                         dotSize: 6.0,
    //                         dotIncreasedColor: Colors.white,
    //                         dotBgColor: Colors.transparent,
    //                         dotColor: Colors.grey,
    //                         dotPosition: DotPosition.bottomRight,
    //                         dotVerticalPadding: 30.0,
    //                         showIndicator: true,
    //                         indicatorBgPadding: 7.0,
    //                         images: [
    //                           // RaisedButton(onPressed: (){
    //                           //   getJsonData();
    //                           // }),
    //                           // Center(child: Text('$data1'))

    //                           NetworkImage(
    //                               'https://carinih.ws/uploads/upload_images/banner_banner/$data1'),
    //                           //   Image.network(
    //                           // 'https://carinih.ws/uploads/upload_images/banner_banner/banner_1251991.jpg',fit: BoxFit.fitWidth),
    //                           //   Image.network(
    //                           // 'https://carinih.ws/uploads/upload_images/banner_banner/banner_86d84ad.jpg',fit: BoxFit.fill),
    //                           // NetworkImage(
    //                           //     'https://carinih.ws/uploads/upload_images/banner_banner/${data[index]['image']}'),
    //                           // NetworkImage(
    //                           //     'https://carinih.ws/uploads/upload_images/banner_banner/${data[index]['image']}'),
    //                           //  Image.network('https://carinih.ws/uploads/upload_images/banner_banner/$data'),
    //                         ],

    //                         // TestApi(),
    //                         //   TestApi()
    //                         // NetworkImage(
    //                         //     'https://cdn-images-1.medium.com/max/2000/1*GqdzzfB_BHorv7V2NV7Jgg.jpeg'),
    //                         // NetworkImage(
    //                         //     'https://cdn-images-1.medium.com/max/2000/1*wnIEgP1gNMrK5gZU7QS0-A.jpeg'),
    //                         // NetworkImage(
    //                         //     'https://cdn-images-1.medium.com/max/2000/1*wnIEgP1gNMrK5gZU7QS0-A.jpeg'),
    //                       ),
    //                     ),
    //                     //akhir banner
    //                     //
    //                       Center(
    //                   child: Padding(
    //                     padding: const EdgeInsets.only(top: 240.0),
    //                     child: Container(
    //                         height: MediaQuery.of(context).size.height / 8,
    //                         width: MediaQuery.of(context).size.width / 1.1,
    //                         decoration: BoxDecoration(
    //                             color: Colors.deepPurple[400],
    //                             borderRadius: BorderRadius.circular(10),
    //                             border: Border.all(
    //                                 color: Colors.white, width: 2)),
    //                         child: Row(
    //                           mainAxisAlignment:
    //                               MainAxisAlignment.spaceEvenly,
    //                           children: [
    //                             Row(
    //                               mainAxisAlignment:
    //                                   MainAxisAlignment.spaceAround,
    //                               children: [
    //                                 Container(
    //                                     height: MediaQuery.of(context)
    //                                             .size
    //                                             .height /
    //                                         19,
    //                                     // width: 30,
    //                                     child: GestureDetector(
    //                                       onTap: () {
    //                                         Navigator.push(
    //                                             context,
    //                                             MaterialPageRoute(
    //                                                 builder: (BuildContext
    //                                                         context) =>
    //                                                     TestApi()));
    //                                       },
    //                                       child: Container(
    //                                         child: Image.asset(
    //                                           'gambar/images/hi_icon.png',
    //                                           fit: BoxFit.cover,
    //                                         ),
    //                                       ),
    //                                     )),
    //                                 //
    //                                 Padding(
    //                                   padding: const EdgeInsets.all(8.0),
    //                                   child: Column(
    //                                       mainAxisAlignment:
    //                                           MainAxisAlignment.center,
    //                                       children: [
    //                                         Text(
    //                                           'WELCOME',
    //                                           style: TextStyle(
    //                                               color: Colors.white,
    //                                               fontSize: 14),
    //                                         ),
    //                                         Container(
    //                                             width:
    //                                                 MediaQuery.of(context)
    //                                                         .size
    //                                                         .width /
    //                                                     5,
    //                                             child: Text(
    //                                               'Daftar Pengguna Baru',
    //                                               textAlign: TextAlign.left,
    //                                               style: TextStyle(
    //                                                   color: Colors.white,
    //                                                   fontSize: 12,
    //                                                   fontFamily:
    //                                                       'Comfortaa'),
    //                                             )),
    //                                       ]),
    //                                 ),
    //                               ],
    //                             ),
    //                             //
    //                             Container(
    //                               height:
    //                                   MediaQuery.of(context).size.height /
    //                                       10,
    //                               width: MediaQuery.of(context).size.width /
    //                                   110,
    //                               color: Colors.white,
    //                             ),

    //                             Row(
    //                               mainAxisAlignment:
    //                                   MainAxisAlignment.spaceAround,
    //                               children: [
    //                                 Container(
    //                                     height: MediaQuery.of(context)
    //                                             .size
    //                                             .height /
    //                                         30,
    //                                     // width: 30,
    //                                     child: Image.asset(
    //                                       'gambar/images/voucher_icon.png',
    //                                       fit: BoxFit.cover,
    //                                     )),
    //                                 Padding(
    //                                   padding: const EdgeInsets.all(8.0),
    //                                   child: Column(
    //                                       mainAxisAlignment:
    //                                           MainAxisAlignment.center,
    //                                       children: [
    //                                         Text(
    //                                           'REWARDS',
    //                                           style: TextStyle(
    //                                               color: Colors.white,
    //                                               fontSize: 14),
    //                                         ),
    //                                         Container(
    //                                             //  width: MediaQuery.of(context).size.width/4,
    //                                             child: Text(
    //                                           '10 Voucher',
    //                                           textAlign: TextAlign.left,
    //                                           style: TextStyle(
    //                                               color: Colors.white,
    //                                               fontSize: 12,
    //                                               fontFamily: 'Comfortaa'),
    //                                         )),
    //                                       ]),
    //                                 ),
    //                               ],
    //                             ),
    //                           ],
    //                         )),
    //                   ),
    //                  ),
    //                  //
    //                    Positioned(
    //                   bottom: 110,
    //                   left: 15,
    //                   child: Stack(
    //                     children: [
    //                       Container(
    //                         height: 30,
    //                         child: Padding(
    //                           padding: const EdgeInsets.only(right: 65.0),
    //                           child: Image.asset(
    //                             'gambar/images/icon_promo.png',
    //                             fit: BoxFit.contain,
    //                           ),
    //                         ),
    //                       ),
    //                       Positioned(
    //                         left: 50,
    //                         bottom: 8,
    //                         child: Text('Semua Promo',
    //                             style: TextStyle(
    //                                 color: Colors.white,
    //                                 fontSize: 12,
    //                                 fontFamily: 'Comfortaa')),
    //                       ),
    //                     ],
    //                    ),
    //                     ),
    //                 //

    //                    ],
    //                   ), //akhir stack
    //                  // Positioned(
    //                  //   bottom: 110,
    //                 //   left: 15,
    //                 //   child: Stack(
    //                 //     children: [
    //                 //       Container(
    //                 //         height: 30,
    //                 //         child: Padding(
    //                 //           padding: const EdgeInsets.only(right: 65.0),
    //                 //           child: Image.asset(
    //                 //             'gambar/images/icon_promo.png',
    //                 //             fit: BoxFit.contain,
    //                 //           ),
    //                 //         ),
    //                 //       ),
    //                 //       Positioned(
    //                 //         left: 50,
    //                 //         bottom: 8,
    //                 //         child: Text('Semua Promo',
    //                 //             style: TextStyle(
    //                 //                 color: Colors.white,
    //                 //                 fontSize: 12,
    //                 //                 fontFamily: 'Comfortaa')),
    //                 //       ),
    //                 //     ],
    //                 //   ),
    //                 // ),
    //                 //
    //                 Padding(
    //                   padding: const EdgeInsets.only(left:15.0,right: 15),
    //                   child: Container(
    //                     height: MediaQuery.of(context).size.height / 3,
    //                     width: MediaQuery.of(context).size.width,
    //                     // color: Colors.red,
    //                     child: GridView.builder(
    //                       shrinkWrap: true,
    //                       physics: NeverScrollableScrollPhysics(),
    //                       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //                           crossAxisCount: 5,
    //                         mainAxisSpacing: 0,
    //                          childAspectRatio:1/1.6,
    //                           crossAxisSpacing: 4),
    //                       itemCount: data2 == null ? 0 : data2.length,
    //                       itemBuilder: (BuildContext context, int i) {
    //                         if (data2[i]['image_group'].contains('13')) {
    //                           return  Column(
    //                             mainAxisAlignment: MainAxisAlignment.center,
    //                             crossAxisAlignment: CrossAxisAlignment.center,
    //                             children: [
    //                               Container(
    //                                 width: 60,

    //                                 child: Image.network(
    //                                         'https://carinih.ws/uploads/upload_images/image_image/${data2[i]['image']}',
    //                                         fit: BoxFit.cover,
    //                                       ),
    //                               ),
    //                                     Container(
    //                                       height: 40,
    //                                       width: 75,
    //                                       child: Text(data2[i]['title'],textAlign: TextAlign.center,style: TextStyle(fontSize:8),))
    //                             ],
    //                           );
    //                           // Column(
    //                           //   children: [
    //                           //     Image.network(
    //                           //         'https://carinih.ws/uploads/upload_images/image_image/${data2[i]['image']}',
    //                           //         fit: BoxFit.cover,
    //                           //       ),
    //                           //       Expanded(child: Text(data2[i]['title'],textAlign:TextAlign.center,style: TextStyle(fontSize: 9),))
    //                           //   ],
    //                           // );

    //                           //Container(
    //                           //   child: Image.network(
    //                           //     'https://carinih.ws/uploads/upload_images/image_image/${data2[i]['image']}',
    //                           //     fit: BoxFit.cover,
    //                           //   ),
    //                           // );

    //                           //  ListTile(
    //                           //   title:
    //                           //    Image.network(
    //                           //           'https://carinih.ws/uploads/upload_images/image_image/${data2[i]['image']}'),
    //                           //           subtitle: Text(data2[i]['title']),
    //                           // );
    //                           // Image.network(
    //                           // 'https://carinih.ws/uploads/upload_images/image_image/${data2[i]['image']}');

    //                           // Image.network(
    //                           //     'https://carinih.ws/uploads/upload_images/image_image/${data2[i]['image']}');

    //                         } else {
    //                           print('tidak ada gambar');
    //                         }
    //                       },
    //                     ),
    //                     // Column(
    //                     //   mainAxisAlignment: MainAxisAlignment.start,
    //                     //   children: [
    //                     //     //
    //                     //     Row(
    //                     //       crossAxisAlignment: CrossAxisAlignment.start,
    //                     //       mainAxisAlignment: MainAxisAlignment.spaceAround,
    //                     //       children: [
    //                     //         Column(
    //                     //           crossAxisAlignment: CrossAxisAlignment.start,
    //                     //           mainAxisAlignment:
    //                     //               MainAxisAlignment.spaceAround,
    //                     //           children: [
    //                     //             Container(
    //                     //               height: 45,
    //                     //               width: 45,
    //                     //               decoration: BoxDecoration(
    //                     //                 image: DecorationImage(
    //                     //                     image: AssetImage(
    //                     //                         'gambar/images/kesehatan_icon.png')),
    //                     //                 borderRadius: BorderRadius.circular(5),
    //                     //               ),
    //                     //             ),
    //                     //             Text(
    //                     //               'CARimakan',
    //                     //               style: TextStyle(
    //                     //                   fontSize: 10, fontFamily: 'Comfortaa'),
    //                     //             )
    //                     //           ],
    //                     //         ),
    //                     //         //
    //                     //         Column(
    //                     //           mainAxisAlignment:
    //                     //               MainAxisAlignment.spaceAround,
    //                     //           children: [
    //                     //             Container(
    //                     //               height: 45,
    //                     //               width: 45,
    //                     //               decoration: BoxDecoration(
    //                     //                 image: DecorationImage(
    //                     //                     image: AssetImage(
    //                     //                         'gambar/images/kesehatan_icon.png')),
    //                     //                 borderRadius: BorderRadius.circular(5),
    //                     //               ),
    //                     //             ),
    //                     //             Text(
    //                     //               'CARi \nKesehatan',
    //                     //               style: TextStyle(
    //                     //                   fontSize: 9, fontFamily: 'Comfortaa'),
    //                     //               textAlign: TextAlign.center,
    //                     //             )
    //                     //           ],
    //                     //         ),
    //                     //         Column(
    //                     //           mainAxisAlignment:
    //                     //               MainAxisAlignment.spaceAround,
    //                     //           children: [
    //                     //             Container(
    //                     //               height: 45,
    //                     //               width: 45,
    //                     //               decoration: BoxDecoration(
    //                     //                 image: DecorationImage(
    //                     //                     image: AssetImage(
    //                     //                         'gambar/images/perlengkapan_icon.png')),
    //                     //                 borderRadius: BorderRadius.circular(5),
    //                     //               ),
    //                     //             ),
    //                     //             Text(
    //                     //               'CARi\n Perlengkapan \nAnak',
    //                     //               style: TextStyle(
    //                     //                 fontSize: 9,
    //                     //                 fontFamily: 'Comfortaa',
    //                     //               ),
    //                     //               textAlign: TextAlign.center,
    //                     //             )
    //                     //           ],
    //                     //         ),
    //                     //         Column(
    //                     //           mainAxisAlignment:
    //                     //               MainAxisAlignment.spaceAround,
    //                     //           children: [
    //                     //             Container(
    //                     //               height: 45,
    //                     //               width: 45,
    //                     //               decoration: BoxDecoration(
    //                     //                 image: DecorationImage(
    //                     //                     image: AssetImage(
    //                     //                         'gambar/images/vitamin_icon.png')),
    //                     //                 borderRadius: BorderRadius.circular(5),
    //                     //               ),
    //                     //             ),
    //                     //             Text(
    //                     //               'CARi \nVitamin',
    //                     //               style: TextStyle(
    //                     //                   fontSize: 9, fontFamily: 'Comfortaa'),
    //                     //               textAlign: TextAlign.center,
    //                     //             )
    //                     //           ],
    //                     //         ),
    //                     //         Column(
    //                     //           mainAxisAlignment:
    //                     //               MainAxisAlignment.spaceAround,
    //                     //           children: [
    //                     //             Container(
    //                     //               height: 45,
    //                     //               width: 45,
    //                     //               decoration: BoxDecoration(
    //                     //                 image: DecorationImage(
    //                     //                     image: AssetImage(
    //                     //                         'gambar/images/rumah_tangga_icon.png')),
    //                     //                 borderRadius: BorderRadius.circular(5),
    //                     //               ),
    //                     //             ),
    //                     //             Text(
    //                     //               'CARi \nKebutuhan \nRumah \nTangga',
    //                     //               style: TextStyle(
    //                     //                   fontSize: 9, fontFamily: 'Comfortaa'),
    //                     //               textAlign: TextAlign.center,
    //                     //             )
    //                     //           ],
    //                     //         )
    //                     //       ],
    //                     //     ),
    //                     //     //
    //                     //     SizedBox(height: 55),
    //                     //     Row(
    //                     //       mainAxisAlignment: MainAxisAlignment.spaceAround,
    //                     //       children: [
    //                     //         Column(
    //                     //           mainAxisAlignment:
    //                     //               MainAxisAlignment.spaceAround,
    //                     //           children: [
    //                     //             Container(
    //                     //               height: 45,
    //                     //               width: 45,
    //                     //               decoration: BoxDecoration(
    //                     //                 image: DecorationImage(
    //                     //                     image: AssetImage(
    //                     //                         'gambar/images/project_icon.png')),
    //                     //                 borderRadius: BorderRadius.circular(5),
    //                     //               ),
    //                     //             ),
    //                     //             SizedBox(height: 5),
    //                     //             Text(
    //                     //               'CARi Project',
    //                     //               style: TextStyle(
    //                     //                   fontSize: 9, fontFamily: 'Comfortaa'),
    //                     //             )
    //                     //           ],
    //                     //         ),
    //                     //         //
    //                     //         Column(
    //                     //           mainAxisAlignment:
    //                     //               MainAxisAlignment.spaceAround,
    //                     //           children: [
    //                     //             Container(
    //                     //               height: 45,
    //                     //               width: 45,
    //                     //               decoration: BoxDecoration(
    //                     //                 image: DecorationImage(
    //                     //                     image: AssetImage(
    //                     //                         'gambar/images/kesehatan_icon.png')),
    //                     //                 borderRadius: BorderRadius.circular(5),
    //                     //               ),
    //                     //             ),
    //                     //             SizedBox(height: 5),
    //                     //             Text(
    //                     //               'CARi Farmasi',
    //                     //               style: TextStyle(
    //                     //                   fontSize: 9, fontFamily: 'Comfortaa'),
    //                     //               textAlign: TextAlign.center,
    //                     //             )
    //                     //           ],
    //                     //         ),
    //                     //         Column(
    //                     //           mainAxisAlignment:
    //                     //               MainAxisAlignment.spaceAround,
    //                     //           children: [
    //                     //             Container(
    //                     //               height: 45,
    //                     //               width: 45,
    //                     //               decoration: BoxDecoration(
    //                     //                 image: DecorationImage(
    //                     //                     image: AssetImage(
    //                     //                         'gambar/images/kesehatan_icon.png')),
    //                     //                 borderRadius: BorderRadius.circular(5),
    //                     //               ),
    //                     //             ),
    //                     //             SizedBox(height: 5),
    //                     //             Text(
    //                     //               'CARi Service',
    //                     //               style: TextStyle(
    //                     //                   fontSize: 9, fontFamily: 'Comfortaa'),
    //                     //               textAlign: TextAlign.center,
    //                     //             )
    //                     //           ],
    //                     //         ),
    //                     //         Column(
    //                     //           mainAxisAlignment:
    //                     //               MainAxisAlignment.spaceAround,
    //                     //           children: [
    //                     //             Container(
    //                     //               height: 45,
    //                     //               width: 45,
    //                     //               decoration: BoxDecoration(
    //                     //                 image: DecorationImage(
    //                     //                     image: AssetImage(
    //                     //                         'gambar/images/kesehatan_icon.png')),
    //                     //                 borderRadius: BorderRadius.circular(5),
    //                     //               ),
    //                     //             ),
    //                     //             SizedBox(height: 5),
    //                     //             Text(
    //                     //               'CARi Event',
    //                     //               style: TextStyle(
    //                     //                   fontSize: 9, fontFamily: 'Comfortaa'),
    //                     //               textAlign: TextAlign.center,
    //                     //             )
    //                     //           ],
    //                     //         ),
    //                     //         Column(
    //                     //           mainAxisAlignment:
    //                     //               MainAxisAlignment.spaceAround,
    //                     //           children: [
    //                     //             Container(
    //                     //               height: 45,
    //                     //               width: 45,
    //                     //               decoration: BoxDecoration(
    //                     //                 image: DecorationImage(
    //                     //                     image: AssetImage(
    //                     //                         'gambar/images/kesehatan_icon.png')),
    //                     //                 borderRadius: BorderRadius.circular(5),
    //                     //               ),
    //                     //             ),
    //                     //             SizedBox(height: 5),
    //                     //             Text(
    //                     //               'Flash Sale',
    //                     //               style: TextStyle(
    //                     //                   fontSize: 9, fontFamily: 'Comfortaa'),
    //                     //               textAlign: TextAlign.center,
    //                     //             )
    //                     //           ],
    //                     //         ),
    //                     //       ],
    //                     //     ),
    //                     //   ],
    //                     // ),

    //                     // child: GridView.count(
    //                     //   shrinkWrap: true,
    //                     //   physics: ScrollPhysics(),
    //                     //   //  crossAxisSpacing: ,
    //                     // mainAxisSpacing: 50,
    //                     //   crossAxisCount:4,
    //                     //   padding: EdgeInsets.only(bottom: 10),

    //                     //   children: [
    //                     //     Container(
    //                     //       child: Column(
    //                     //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //                     //         children: [
    //                     //           Container(
    //                     //             height: 45.0,
    //                     //             width: 45.0,
    //                     //             decoration: BoxDecoration(
    //                     //               borderRadius: BorderRadius.circular(5.0),
    //                     //               image: DecorationImage(
    //                     //                 image: AssetImage('gambar/images/kesehatan_icon.png'),
    //                     //               ),
    //                     //             ),
    //                     //           ),
    //                     //           // Container(
    //                     //           //   width: 80,
    //                     //           //   // height: 20,

    //                     //           //   child: Text('CARimakan', style: TextStyle(fontSize: 12)
    //                     //           //   ),
    //                     //           //   ),
    //                     //         ],
    //                     //       ),
    //                     //     ),
    //                     //       Container(
    //                     //       child: Column(
    //                     //         mainAxisAlignment: MainAxisAlignment.spaceAround,
    //                     //         children: [
    //                     //           Container(
    //                     //             height: 45.0,
    //                     //             width: 45.0,
    //                     //             decoration: BoxDecoration(
    //                     //               borderRadius: BorderRadius.circular(5.0),
    //                     //               image: DecorationImage(
    //                     //                 image: AssetImage('gambar/images/kesehatan_icon.png'),
    //                     //               ),
    //                     //             ),
    //                     //           ),
    //                     //           // SizedBox(height: 10,),
    //                     //           Container(

    //                     //             child: Text('Cari Kesehatan', style: TextStyle(fontSize: 10,fontFamily: 'Comfortaa'),textAlign: TextAlign.center,)),
    //                     //         ],
    //                     //       ),
    //                     //     ),
    //                     //       Container(
    //                     //       child: Column(
    //                     //         mainAxisAlignment: MainAxisAlignment.spaceAround,
    //                     //         children: [
    //                     //           Container(
    //                     //               height: 45.0,
    //                     //             width: 45.0,
    //                     //             decoration: BoxDecoration(
    //                     //               borderRadius: BorderRadius.circular(5.0),
    //                     //               image: DecorationImage(
    //                     //                 image: AssetImage('gambar/images/perlengkapan_icon.png'),
    //                     //               ),
    //                     //             ),
    //                     //           ),
    //                     //           Container(
    //                     //             // alignment: Alignment.center,
    //                     //             child: Text('Cari Perlengkapan Anak', style: TextStyle(fontSize: 9,fontFamily: 'Comfortaa'),textAlign: TextAlign.center,)),
    //                     //         ],
    //                     //       ),
    //                     //     ),
    //                     //       Container(
    //                     //       child: Column(
    //                     //         mainAxisAlignment: MainAxisAlignment.spaceAround,
    //                     //         children: [
    //                     //           Container(
    //                     //             height: 50.0,
    //                     //             width: 50.0,
    //                     //             decoration: BoxDecoration(
    //                     //               borderRadius: BorderRadius.circular(5.0),
    //                     //               image: DecorationImage(
    //                     //                 image: AssetImage('gambar/images/vitamin_icon.png'),
    //                     //               ),
    //                     //             ),
    //                     //           ),
    //                     //           // Text('Games', style: TextStyle(fontSize: 12)),`
    //                     //         ],
    //                     //       ),
    //                     //     ),
    //                     //       Container(
    //                     //       child: Column(
    //                     //         mainAxisAlignment: MainAxisAlignment.spaceAround,
    //                     //         children: [
    //                     //           Container(
    //                     //              height: 50.0,
    //                     //             width: 50.0,
    //                     //             decoration: BoxDecoration(
    //                     //               borderRadius: BorderRadius.circular(5.0),
    //                     //               image: DecorationImage(
    //                     //                 image: AssetImage('gambar/images/rumah_tangga_icon.png'),
    //                     //               ),
    //                     //             ),
    //                     //           ),
    //                     //           // Text('Games', style: TextStyle(fontSize: 12)),
    //                     //         ],
    //                     //       ),
    //                     //     ),
    //                     //      Container(
    //                     //       child: Column(
    //                     //         mainAxisAlignment: MainAxisAlignment.spaceAround,
    //                     //         children: [
    //                     //           Container(
    //                     //             height: 50.0,
    //                     //             width: 50.0,
    //                     //             decoration: BoxDecoration(
    //                     //               borderRadius: BorderRadius.circular(5.0),
    //                     //               image: DecorationImage(
    //                     //                 image: AssetImage('gambar/images/project_icon.png'),
    //                     //               ),
    //                     //             ),
    //                     //           ),
    //                     //           // Text('Games', style: TextStyle(fontSize: 12)),
    //                     //         ],
    //                     //       ),
    //                     //     ),
    //                     //      Container(
    //                     //       child: Column(
    //                     //         mainAxisAlignment: MainAxisAlignment.spaceAround,
    //                     //         children: [
    //                     //           Container(
    //                     //             height: 50.0,
    //                     //             width: 50.0,
    //                     //             decoration: BoxDecoration(
    //                     //               borderRadius: BorderRadius.circular(5.0),
    //                     //               image: DecorationImage(
    //                     //                 image: AssetImage('gambar/images/rumah_tangga_icon.png'),
    //                     //               ),
    //                     //             ),
    //                     //           ),
    //                     //           // Text('Games', style: TextStyle(fontSize: 12)),
    //                     //         ],
    //                     //       ),
    //                     //     ),
    //                     //      Container(
    //                     //       child: Column(
    //                     //         mainAxisAlignment: MainAxisAlignment.spaceAround,
    //                     //         children: [
    //                     //           Container(
    //                     //             height: 50.0,
    //                     //             width: 50.0,
    //                     //             decoration: BoxDecoration(
    //                     //               borderRadius: BorderRadius.circular(5.0),
    //                     //               image: DecorationImage(
    //                     //                 image: AssetImage('gambar/images/rumah_tangga_icon.png'),
    //                     //               ),
    //                     //             ),
    //                     //           ),
    //                     //           // Text('Games', style: TextStyle(fontSize: 12)),
    //                     //         ],
    //                     //       ),
    //                     //     ),
    //                     //      Container(
    //                     //       child: Column(
    //                     //         mainAxisAlignment: MainAxisAlignment.spaceAround,
    //                     //         children: [
    //                     //           Container(
    //                     //             height: 50.0,
    //                     //             width: 50.0,
    //                     //             decoration: BoxDecoration(
    //                     //               borderRadius: BorderRadius.circular(5.0),
    //                     //               image: DecorationImage(
    //                     //                 image: AssetImage('gambar/images/rumah_tangga_icon.png'),
    //                     //               ),
    //                     //             ),
    //                     //           ),
    //                     //           // Text('Games', style: TextStyle(fontSize: 12)),
    //                     //         ],
    //                     //       ),
    //                     //     ),
    //                     //      Container(
    //                     //       child: Column(
    //                     //         mainAxisAlignment: MainAxisAlignment.spaceAround,
    //                     //         children: [
    //                     //           Container(
    //                     //             height: 50.0,
    //                     //             width: 50.0,
    //                     //             decoration: BoxDecoration(
    //                     //               borderRadius: BorderRadius.circular(5.0),
    //                     //               image: DecorationImage(
    //                     //                 image: AssetImage('gambar/images/rumah_tangga_icon.png'),
    //                     //               ),
    //                     //             ),
    //                     //           ),
    //                     //           // Text('Games', style: TextStyle(fontSize: 12)),
    //                     //         ],
    //                     //       ),
    //                     //     ),
    //                     //   ],
    //                     // ),
    //                   ),
    //                 ),
    //                 Stack(
    //                   children: [
    //                     Container(
    //                       color: Colors.grey[200],
    //                       height: MediaQuery.of(context).size.height / 35,
    //                     ),
    //                     Padding(
    //                       padding: const EdgeInsets.only(top: 7.0),
    //                       child: Center(
    //                         child: Container(
    //                           decoration: BoxDecoration(
    //                               color: Colors.deepPurple[400],
    //                               borderRadius: BorderRadius.circular(10)),
    //                           height: 10,
    //                           width: 30,
    //                         ),
    //                       ),
    //                     ),
    //                     //
    //                   ],
    //                 ),
    //                 Padding(
    //                   padding: const EdgeInsets.only(top: 20.0),
    //                   child: ProdukRekomendasi(),
    //                 ),
    //                 Padding(
    //                   padding:
    //                       const EdgeInsets.only(left: 7.0, right: 7, top: 20),
    //                   child: Divider(
    //                     thickness: 3,
    //                     color: Colors.grey[200],
    //                   ),
    //                 ),
    //                 ProdukHome(),
    //                 Padding(
    //                   padding: const EdgeInsets.only(top: 20.0),
    //                   child: ProdukCariStore(),
    //                 ),
    //                 ProdukHome2(),
    //                 Padding(
    //                   padding: const EdgeInsets.only(top: 20.0),
    //                   child: ProdukCariMitra(),
    //                 ),
    //                 ProdukHome3()
    //                 // Text('dddddddddddddddd'),
    //                 // Text('dddddddddddddddd'),
    //                 // Text('dddddddddddddddd'),
    //                 // Text('dddddddddddddddd'),
    //                 // Text('dddddddddddddddd'),
    //                 // Text('dddddddddddddddd'),
    //                 // Text('dddddddddddddddd'),
    //                 // Text('dddddddddddddddd'),
    //                 // Text('dddddddddddddddd'),
    //                 // Text('dddddddddddddddd'),
    //                 // Text('dddddddddddddddd'),
    //                 // Text('dddddddddddddddd'),
    //                 // Text('dddddddddddddddd'),
    //                 // Text('dddddddddddddddd'),
    //                 // Text('dddddddddddddddd'),
    //                 // Text('dddddddddddddddd'),
    //                 // Text('dddddddddddddddd'),
    //                 // Text('dddddddddddddddd'),
    //                 // Text('dddddddddddddddd'),
    //                 // Text('dddddddddddddddd'),
    //                 // Text('dddddddddddddddd'),
    //                 // Text('dddddddddddddddd'),
    //                 // Text('dddddddddddddddd'),
    //                 // Text('dddddddddddddddd'),
    //                 // Text('dddddddddddddddd'),
    //                 // Text('dddddddddddddddd'),
    //                 // Text('dddddddddddddddd'),
    //                 // Text('dddddddddddddddd'),
    //                 // Text('dddddddddddddddd'),
    //                 // Text('dddddddddddddddd'),
    //                 // Text('dddddddddddddddd'),
    //                 // Text('dddddddddddddddd'),
    //                 // Text('dddddddddddddddd'),
    //                 // Text('dddddddddddddddd'),
    //                 // Text('dddddddddddddddd'),
    //                 // Text('dddddddddddddddd'),
    //                 // Text('dddddddddddddddd'),
    //                 // Text('dddddddddddddddd'),
    //                 // Text('dddddddddddddddd'),
    //                 // Text('dddddddddddddddd'),
    //                 // Text('dddddddddddddddd'),
    //                 // Text('dddddddddddddddd'),
    //                 // Text('dddddddddddddddd'),
    //                 // Text('dddddddddddddddd'),
    //                 // Text('dddddddddddddddd'),
    //                 // Text('dddddddddddddddd'),
    //                 // Text('dddddddddddddddd'),
    //                 // Text('dddddddddddddddd'),
    //                 // Text('dddddddddddddddd'),
    //                 // Text('dddddddddddddddd'),
    //                 // Text('dddddddddddddddd'),
    //                 // Text('dddddddddddddddd'),
    //                 // Text('dddddddddddddddd'),
    //                 // Text('dddddddddddddddd'),
    //                 // Text('dddddddddddddddd'),
    //                 // Text('dddddddddddddddd'),
    //               ],
    //             )),
    //             //dibawah singlechilscroolview masi didalam stack pertama
    //             //unutk yang jika d scrool maka akan berubah warna(animaation)
    //             Container(
    //               // height: 80,
    //               child: AnimatedBuilder(
    //                 animation: _ColorAnimationController,
    //                 builder: (context, child) => Container(
    //                     color: _colorTween.value,
    //                     margin: EdgeInsets.only(),
    //                     padding: EdgeInsets.only(
    //                       left: MediaQuery.of(context).padding.left / 15,
    //                       right: MediaQuery.of(context).padding.right / 10,
    //                       top: MediaQuery.of(context).padding.top,
    //                       // bottom: 5.h,
    //                     ),
    //                     height: MediaQuery.of(context).size.height / 14 +
    //                         MediaQuery.of(context).padding.top,
    //                     // unutk searcbar na
    //                     child: Row(
    //                       mainAxisAlignment: MainAxisAlignment.spaceAround,
    //                       children: [
    //                         Container(
    //                             decoration: BoxDecoration(
    //                               borderRadius: BorderRadius.circular(8),
    //                               color: _iconColorTween.value,
    //                             ),
    //                             height: MediaQuery.of(context).size.height / 16,
    //                             width: MediaQuery.of(context).size.width / 1.8,
    //                             child: Padding(
    //                               padding: const EdgeInsets.only(top: 3.0),
    //                               child: TextField(
    //                                 decoration: InputDecoration(
    //                                   hintText: 'Cari masker medis',
    //                                   border: InputBorder.none,
    //                                   prefixIcon: Icon(
    //                                     Icons.search,
    //                                     color: Colors.blue,
    //                                   ),
    //                                 ),
    //                                 style: TextStyle(
    //                                     fontSize: 12, fontFamily: 'Comfortaa'),
    //                               ),
    //                             )),
    //                         Container(
    //                             height: 20,
    //                             width: 25,
    //                             child: Image.asset(
    //                               'gambar/images/love_icon.png',
    //                               color: _iconColorTween1.value,
    //                               fit: BoxFit.contain,
    //                             )),
    //                         Container(
    //                             height: 20,
    //                             width: 25,
    //                             child: Image.asset(
    //                               'gambar/images/cart_icon.png',
    //                               color: _iconColorTween1.value,
    //                               fit: BoxFit.contain,
    //                             )),
    //                         Container(
    //                             height: 20,
    //                             width: 25,
    //                             child: Image.asset(
    //                               'gambar/images/dll_icon.png',
    //                               color: _iconColorTween1.value,
    //                               fit: BoxFit.contain,
    //                             ))
    //                       ],
    //                     )),
    //               ),
    //             ),
    //             //
    //             AnimationFloat()
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    // ),
  }
}
