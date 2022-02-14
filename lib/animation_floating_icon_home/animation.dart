import 'dart:convert';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:circular_menu/circular_menu.dart';
import 'package:flutter/material.dart';

class AnimationFloat extends StatefulWidget {
  const AnimationFloat({Key key}) : super(key: key);

  @override
  _AnimationFloatState createState() => _AnimationFloatState();
}

class _AnimationFloatState extends State<AnimationFloat>
    with SingleTickerProviderStateMixin {
  //
  final String url = "https://gopump.id/api/icon_home";
  String data1;
  String data2;
  String data3;
  String data4;
  String data5;
  // ignore: missing_return
  Future<String> getJsonData() async {
    http.Response response = await http.get(Uri.parse(Uri.encodeFull(url)),
        headers: {"Accept": "application/json"});
    if (kDebugMode) {
      print(response.body);
    }

    Map<String, dynamic> data = json.decode(response.body);
    setState(() {
      data1 = data['data'][10]['image'];
      data2 = data['data'][11]['image'];
      data3 = data['data'][12]['image'];
      data4 = data['data'][13]['image'];
      data5 = data['data'][14]['image'];
    });

    if (kDebugMode) {
      print('$data1');
    }
  }

  //
  bool opened = true;
  //
  AnimationController _controller;
  Animation _animation;

  @override
  void initState() {
    getJsonData();
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 350),
      reverseDuration: Duration(milliseconds: 275),
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
      reverseCurve: Curves.easeIn,
    );
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  //
  Alignment alignment1 = Alignment(-0.1, 0.7);
  Alignment alignment2 = Alignment(-0.1, 0.7);
  Alignment alignment3 = Alignment(-0.1, 0.8);
  Alignment alignment4 = Alignment(-0.1, 0.7);
  Alignment alignment5 = Alignment(-0.1, 0.7);
  Alignment home = Alignment(-0.1, 0.8);
  Alignment official = Alignment(0.0, 0.7);
  Alignment notifikasi = Alignment(-0.1, 0.6);
  Alignment keranjang = Alignment(-0.1, 0.8);
  Alignment account = Alignment(-0.1, 0.8);
  double size1 = 50.0;
  double size2 = 50.0;
  double size3 = 50.0;
  double size4 = 50.0;
  double size5 = 50.0;
  //
  @override
  Widget build(BuildContext context) {
    // GlobalKey<CircularMenuState> key = GlobalKey<CircularMenuState>();

    return Stack(
      children: [
        //unutk container yang ditengah tengah
        opened
            ? SizedBox()
            : Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: MediaQuery.of(context).size.height / 3,
                    width: MediaQuery.of(context).size.width / 1.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.black45,
                    ),
                  ),
                ),
              ),
        //unutk animasi
        Stack(
          children: [
            AnimatedAlign(
              duration: opened
                  ? Duration(milliseconds: 275)
                  : Duration(milliseconds: 875),
              alignment: alignment1,
              curve: opened ? Curves.easeIn : Curves.elasticOut,
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Transform.rotate(
                  angle: opened
                      ? _animation.value * pi * (2 / 4)
                      : _animation.value * pi * (8 / 4),
                  child: AnimatedContainer(
                      duration: Duration(milliseconds: 275),
                      curve: opened ? Curves.easeOut : Curves.easeIn,
                      // curve: opened?Curves.easeIn:Curves.easeOut,
                      height: 40,
                      width: 40,
                      // decoration: BoxDecoration(
                      //   color: Colors.deepPurple[400],
                      //   borderRadius: BorderRadius.circular(40),
                      // ),
                      child: Image(
                        image: NetworkImage(
                            'https://carinih.ws/uploads/upload_images/image_image/$data1'),
                      )),
                ),
              ),
            ),
            //
            AnimatedAlign(
              duration: opened
                  ? Duration(milliseconds: 275)
                  : Duration(milliseconds: 875),
              alignment: home,
              curve: opened ? Curves.easeIn : Curves.elasticOut,
              child: Transform.rotate(
                angle: opened
                    ? _animation.value * pi * (2 / 4)
                    : _animation.value * pi * (8 / 4),
                child: AnimatedContainer(
                    duration: Duration(milliseconds: 275),
                    curve: opened ? Curves.easeOut : Curves.easeIn,
                    // curve: opened?Curves.easeIn:Curves.easeOut,
                    // height: 50,
                    // width: 50,
                    // decoration: BoxDecoration(
                    //   color: Colors.deepPurple[400],
                    //   borderRadius: BorderRadius.circular(40),
                    // ),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 16.0, left: 3),
                      child: Text(
                        'Home',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Comfortaa',
                            fontSize: 10,
                            color: Colors.white),
                      ),
                    )),
              ),
            ),
          ],
        ),
        // AnimatedAlign(
        //   duration: opened?Duration(milliseconds: 275):Duration(milliseconds: 875),
        //   alignment: alignment1,
        //   curve: opened? Curves.easeIn:Curves.elasticOut,
        //   child: Transform.rotate(
        //       angle: opened?_animation.value * pi * (2 /4 ):_animation.value * pi * ( 8/4 ),
        //     child: Padding(
        //       padding: const EdgeInsets.all(5.0),
        //       child: AnimatedContainer(
        //         duration:Duration(milliseconds: 275),
        //         curve: opened?Curves.easeOut:Curves.easeIn,
        //         // curve: opened?Curves.easeIn:Curves.easeOut,
        //         height: 40,
        //         width: 40,
        //         // decoration: BoxDecoration(
        //         //   color: Colors.deepPurple[400],
        //         //   borderRadius: BorderRadius.circular(40),
        //         // ),
        //         child:Image(image: AssetImage('gambar/images/basket_icon.png'),)
        //         ),
        //     ),
        //   ),
        // ),

        //
        Stack(
          children: [
            //       AnimatedAlign(
            //       duration: opened?Duration(milliseconds: 275):Duration(milliseconds: 875),
            //       alignment: alignment2,
            //       curve: opened? Curves.easeIn:Curves.elasticOut,
            //       child: Transform.rotate(
            //           angle: opened?_animation.value * pi * (2 /4 ):_animation.value * pi * ( 8/4 ),
            //         child: AnimatedContainer(
            //           duration:Duration(milliseconds: 275),
            //           curve: opened?Curves.easeIn:Curves.easeOut,
            //           height: size2,
            //           width: size2,
            //           decoration: BoxDecoration(
            //             color: Colors.deepPurple[400],
            //             borderRadius: BorderRadius.circular(40),
            //           ),
            //           // child: Icon(Icons.ac_unit,color: Colors.white,),
            //           ),
            //       ),
            // ),
            //
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: AnimatedAlign(
                duration: opened
                    ? Duration(milliseconds: 275)
                    : Duration(milliseconds: 875),
                alignment: alignment2,
                curve: opened ? Curves.easeIn : Curves.elasticOut,
                child: Transform.rotate(
                  angle: opened
                      ? _animation.value * pi * (2 / 4)
                      : _animation.value * pi * (8 / 4),
                  child: AnimatedContainer(
                      duration: Duration(milliseconds: 275),
                      curve: opened ? Curves.easeIn : Curves.easeOut,
                      height: 40,
                      width: 40,
                      // decoration: BoxDecoration(
                      //   color: Colors.deepPurple[400],
                      //   borderRadius: BorderRadius.circular(40),
                      // ),
                      child: Image(
                        image: NetworkImage(
                            'https://carinih.ws/uploads/upload_images/image_image/$data2'),
                      )),
                ),
              ),
            ),
            //
            AnimatedAlign(
              duration: opened
                  ? Duration(milliseconds: 275)
                  : Duration(milliseconds: 875),
              alignment: official,
              curve: opened ? Curves.easeIn : Curves.elasticOut,
              child: Transform.rotate(
                angle: opened
                    ? _animation.value * pi * (2 / 4)
                    : _animation.value * pi * (8 / 4),
                child: AnimatedContainer(
                    duration: Duration(milliseconds: 275),
                    curve: opened ? Curves.easeOut : Curves.easeIn,
                    // curve: opened?Curves.easeIn:Curves.easeOut,
                    // height: 50,
                    // width: 50,
                    // decoration: BoxDecoration(
                    //   color: Colors.deepPurple[400],
                    //   borderRadius: BorderRadius.circular(40),
                    // ),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 24.0, left: 6),
                      child: Text(
                        'Official Store',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Comfortaa',
                            fontSize: 10,
                            color: Colors.white),
                      ),
                    )),
              ),
            ),
          ],
        ),
        // //
        Stack(
          children: [
            //      AnimatedAlign(
            //       duration: opened?Duration(milliseconds: 275):Duration(milliseconds: 875),
            //       alignment: alignment3,
            //       curve: opened? Curves.easeIn:Curves.elasticOut,
            //       child: AnimatedContainer(
            //         duration:Duration(milliseconds: 275),
            //         curve: opened?Curves.easeIn:Curves.easeOut,
            //         height: size3,
            //         width: size3,
            //         decoration: BoxDecoration(
            //        color: Colors.deepPurple[400],
            //           borderRadius: BorderRadius.circular(40),
            //         ),
            //         // child: Icon(Icons.message,color: Colors.white,),
            //         ),
            // ),
            Padding(
              padding: const EdgeInsets.only(bottom: 35.0),
              child: AnimatedAlign(
                duration: opened
                    ? Duration(milliseconds: 275)
                    : Duration(milliseconds: 875),
                alignment: alignment3,
                curve: opened ? Curves.easeIn : Curves.elasticOut,
                child: Transform.rotate(
                  angle: opened
                      ? _animation.value * pi * (2 / 4)
                      : _animation.value * pi * (8 / 4),
                  child: AnimatedContainer(
                      duration: Duration(milliseconds: 275),
                      curve: opened ? Curves.easeIn : Curves.easeOut,
                      height: 40,
                      width: 40,
                      //   decoration: BoxDecoration(
                      //  color: Colors.deepPurple[400],
                      //     borderRadius: BorderRadius.circular(40),
                      //   ),
                      child: Image(
                        image: NetworkImage(
                            'https://carinih.ws/uploads/upload_images/image_image/$data3'),
                      )),
                ),
              ),
            ),
            //
            AnimatedAlign(
              duration: opened
                  ? Duration(milliseconds: 275)
                  : Duration(milliseconds: 875),
              alignment: notifikasi,
              curve: opened ? Curves.easeIn : Curves.elasticOut,
              child: Transform.rotate(
                angle: opened
                    ? _animation.value * pi * (2 / 4)
                    : _animation.value * pi * (8 / 4),
                child: AnimatedContainer(
                    duration: Duration(milliseconds: 275),
                    curve: opened ? Curves.easeOut : Curves.easeIn,
                    // curve: opened?Curves.easeIn:Curves.easeOut,
                    // height: 50,
                    // width: 50,
                    // decoration: BoxDecoration(
                    //   color: Colors.deepPurple[400],
                    //   borderRadius: BorderRadius.circular(40),
                    // ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5.0, left: 3),
                      child: Text(
                        'Notifikasi',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Comfortaa',
                            fontSize: 10,
                            color: Colors.white),
                      ),
                    )),
              ),
            ),
          ],
        ),
        // // //
        Stack(
          children: [
            //      AnimatedAlign(
            //       duration: opened?Duration(milliseconds: 275):Duration(milliseconds: 875),
            //       alignment: alignment4,
            //       curve: opened? Curves.easeIn:Curves.elasticOut,
            //       child: Transform.rotate(
            //           angle: opened?_animation.value * pi * (2 /4 ):_animation.value * pi * ( 8/4 ),
            //         child: AnimatedContainer(
            //           duration:Duration(milliseconds: 275),
            //           curve: opened?Curves.easeIn:Curves.easeOut,
            //           height: size4,
            //           width: size4,
            //           decoration: BoxDecoration(
            //             color:Colors.deepPurple[400],
            //             borderRadius: BorderRadius.circular(40),
            //           ),
            //           // child: Icon(Icons.message,color: Colors.white,),
            //           ),
            //       ),
            // ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: AnimatedAlign(
                duration: opened
                    ? Duration(milliseconds: 275)
                    : Duration(milliseconds: 875),
                alignment: alignment4,
                curve: opened ? Curves.easeIn : Curves.elasticOut,
                child: Transform.rotate(
                  angle: opened
                      ? _animation.value * pi * (2 / 4)
                      : _animation.value * pi * (8 / 4),
                  child: AnimatedContainer(
                      duration: Duration(milliseconds: 275),
                      curve: opened ? Curves.easeIn : Curves.easeOut,
                      height: 40,
                      width: 40,
                      // decoration: BoxDecoration(
                      //   color:Colors.deepPurple[400],
                      //   borderRadius: BorderRadius.circular(40),
                      // ),
                      child: Image(
                        image: NetworkImage(
                            'https://carinih.ws/uploads/upload_images/image_image/$data4'),
                      )),
                ),
              ),
            ),
            //
            AnimatedAlign(
              duration: opened
                  ? Duration(milliseconds: 275)
                  : Duration(milliseconds: 875),
              alignment: keranjang,
              curve: opened ? Curves.easeIn : Curves.elasticOut,
              child: Transform.rotate(
                angle: opened
                    ? _animation.value * pi * (2 / 4)
                    : _animation.value * pi * (8 / 4),
                child: AnimatedContainer(
                    duration: Duration(milliseconds: 275),
                    curve: opened ? Curves.easeOut : Curves.easeIn,
                    // curve: opened?Curves.easeIn:Curves.easeOut,
                    // height: 50,
                    // width: 50,
                    // decoration: BoxDecoration(
                    //   color: Colors.deepPurple[400],
                    //   borderRadius: BorderRadius.circular(40),
                    // ),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 25, left: 10),
                      child: Text(
                        'Keranjang',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Comfortaa',
                            fontSize: 10,
                            color: Colors.white),
                      ),
                    )),
              ),
            ),
          ],
        ),
        // //
        Stack(
          children: [
            //      AnimatedAlign(
            //       duration: opened?Duration(milliseconds: 275):Duration(milliseconds: 875),
            //       alignment: alignment3,
            //       curve: opened? Curves.easeIn:Curves.elasticOut,
            //       child: AnimatedContainer(
            //         duration:Duration(milliseconds: 275),
            //         curve: opened?Curves.easeIn:Curves.easeOut,
            //         height: size3,
            //         width: size3,
            //         decoration: BoxDecoration(
            //        color: Colors.deepPurple[400],
            //           borderRadius: BorderRadius.circular(40),
            //         ),
            //         // child: Icon(Icons.message,color: Colors.white,),
            //         ),
            // ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: AnimatedAlign(
                duration: opened
                    ? Duration(milliseconds: 275)
                    : Duration(milliseconds: 875),
                alignment: alignment5,
                curve: opened ? Curves.easeIn : Curves.elasticOut,
                child: Transform.rotate(
                  angle: opened
                      ? _animation.value * pi * (2 / 4)
                      : _animation.value * pi * (8 / 4),
                  child: AnimatedContainer(
                      duration: Duration(milliseconds: 275),
                      curve: opened ? Curves.easeIn : Curves.easeOut,
                      height: 40,
                      width: 40,
                      //   decoration: BoxDecoration(
                      //  color: Colors.deepPurple[400],
                      //     borderRadius: BorderRadius.circular(40),
                      //   ),
                      child: Image(
                        image: NetworkImage(
                            'https://carinih.ws/uploads/upload_images/image_image/$data5'),
                      )),
                ),
              ),
            ),
            //
            AnimatedAlign(
              duration: opened
                  ? Duration(milliseconds: 275)
                  : Duration(milliseconds: 875),
              alignment: account,
              curve: opened ? Curves.easeIn : Curves.elasticOut,
              child: Transform.rotate(
                angle: opened
                    ? _animation.value * pi * (2 / 4)
                    : _animation.value * pi * (8 / 4),
                child: AnimatedContainer(
                    duration: Duration(milliseconds: 275),
                    curve: opened ? Curves.easeOut : Curves.easeIn,
                    // curve: opened?Curves.easeIn:Curves.easeOut,
                    // height: 50,
                    // width: 50,
                    // decoration: BoxDecoration(
                    //   color: Colors.deepPurple[400],
                    //   borderRadius: BorderRadius.circular(40),
                    // ),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 16.0, left: 5),
                      child: Text(
                        'Account',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Comfortaa',
                            fontSize: 10,
                            color: Colors.white),
                      ),
                    )),
              ),
            ),
          ],
        ),
        //  Padding(
        //    padding: const EdgeInsets.only(bottom: 6,left:2),
        //    child: AnimatedAlign(
        //     duration: opened?Duration(milliseconds: 275):Duration(milliseconds: 875),
        //     alignment: alignment5,
        //     curve: opened? Curves.easeIn:Curves.elasticOut,
        //     child: AnimatedContainer(
        //       duration:Duration(milliseconds: 275),
        //       curve: opened?Curves.easeIn:Curves.easeOut,
        //       // height: 20,
        //       // width:60,
        //       color: Colors.grey[350],
        //       // decoration: BoxDecoration(
        //       //   color: Colors.black87,
        //       //   borderRadius: BorderRadius.circular(40),
        //       // ),
        //       child: Text('Basket'),
        //       ),
        // ),
        //  ),
        //  //
        //   Padding(
        //     padding: const EdgeInsets.only(bottom:5.0),
        //     child: AnimatedAlign(
        //      duration: opened?Duration(milliseconds: 275):Duration(milliseconds: 875),
        //      alignment: alignment6,
        //      curve: opened? Curves.easeIn:Curves.elasticOut,
        //      child: Transform.rotate(
        //          angle: opened?_animation.value * pi * (2 /4 ):_animation.value * pi * ( 8/4 ),
        //        child: AnimatedContainer(
        //          duration:Duration(milliseconds: 275),
        //          curve: opened?Curves.easeIn:Curves.easeOut,
        //          // height: 20,
        //          // width:60,
        //          color: Colors.grey[350],
        //          // decoration: BoxDecoration(
        //          //   color: Colors.black87,
        //          //   borderRadius: BorderRadius.circular(40),
        //          // ),
        //          child: Text('Notifikasi'),
        //          ),
        //      ),
        // ),
        //   ),
        //   //
        //      Padding(
        //     padding: const EdgeInsets.only(bottom: 6,left:2),
        //     child: AnimatedAlign(
        //      duration: opened?Duration(milliseconds: 275):Duration(milliseconds: 875),
        //      alignment: alignment8,
        //      curve: opened? Curves.easeIn:Curves.elasticOut,
        //      child: Transform.rotate(
        //          angle: opened?_animation.value * pi * (2 /4 ):_animation.value * pi * ( 8/4 ),
        //        child: AnimatedContainer(
        //          duration:Duration(milliseconds: 275),
        //          curve: opened?Curves.easeIn:Curves.easeOut,
        //          // height: 20,
        //          // width:60,
        //          color: Colors.grey[350],
        //          // decoration: BoxDecoration(
        //          //   color: Colors.black87,
        //          //   borderRadius: BorderRadius.circular(40),
        //          // ),
        //          child: Text('Account'),
        //          ),
        //      ),
        // ),
        //   ),
        //

        // Padding(
        //   padding: const EdgeInsets.only(bottom:14),
        //   child: Align(
        //     alignment: Alignment.bottomCenter,
        //     child: Container(
        //      height: MediaQuery.of(context).size.height/3.2,
        //      width: MediaQuery.of(context).size.width/1.3,
        //      color: Colors.black26,
        //     ),
        //   ),
        // ),
        Padding(
          padding: const EdgeInsets.only(bottom: 80.0),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Transform.rotate(
              angle: _animation.value * pi * (0 / 9),
              child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeOut,
                  height: opened ? 100 : 80,
                  width: opened ? 100 : 80,
                  decoration: BoxDecoration(
                      color: Colors.deepPurple[400],
                      borderRadius: BorderRadius.circular(60)),
                  child: Material(
                      color: Colors.transparent,
                      child: IconButton(
                          onPressed: () {
                            setState(() {
                              if (opened) {
                                opened = !opened;
                                _controller.forward();
                                Future.delayed(Duration(milliseconds: 10), () {
                                  alignment1 = Alignment(
                                      -0.5, 0.8); //(x =samping ,y = atas bawah)
                                });
                                Future.delayed(Duration(milliseconds: 10), () {
                                  alignment2 = Alignment(-0.5, 0.6);
                                });
                                Future.delayed(Duration(milliseconds: 10), () {
                                  alignment3 = Alignment(0.0, 0.5);
                                });
                                Future.delayed(Duration(milliseconds: 10), () {
                                  alignment4 = Alignment(0.5, 0.6);
                                });
                                Future.delayed(Duration(milliseconds: 10), () {
                                  alignment5 = Alignment(0.5, 0.8);
                                });
                                Future.delayed(Duration(milliseconds: 10), () {
                                  home = Alignment(-0.5, 0.9);
                                });
                                Future.delayed(Duration(milliseconds: 10), () {
                                  official = Alignment(-0.6, 0.7);
                                });
                                Future.delayed(Duration(milliseconds: 10), () {
                                  notifikasi = Alignment(0.0, 0.5);
                                });
                                Future.delayed(Duration(milliseconds: 10), () {
                                  keranjang = Alignment(0.5, 0.7);
                                });
                                Future.delayed(Duration(milliseconds: 10), () {
                                  account = Alignment(0.5, 0.9);
                                });
                                //   // Future.delayed(Duration(milliseconds: 10),(){
                                //   // alignment = Alignment(-0.5, 0.8);
                                // });
                              } else {
                                opened = !opened;
                                _controller.reverse();
                                alignment1 = Alignment(-0.1, 0.7);
                                alignment2 = Alignment(-0.1, 0.7);
                                alignment3 = Alignment(-0.1, 0.8);
                                alignment4 = Alignment(-0.1, 0.7);
                                alignment5 = Alignment(-0.1, 0.7);
                                home = Alignment(-0.1, 0.7);
                                official = Alignment(0.0, 0.7);
                                notifikasi = Alignment(-0.1, 0.6);
                                keranjang = Alignment(-0.1, 0.7);
                                account = Alignment(-0.1, 0.7);
                              }
                            });
                          },
                          icon:
                              Image(image: AssetImage('gambar/C_icon.png'))))),
            ),
          ),
        )
      ],
      //     children: [
      //       AnimatedPositioned(
      //         duration: Duration(milliseconds: 300),
      //         left: opened? MediaQuery.of(context).size.width/2 - 40.0
      //         : MediaQuery.of(context).size.width/2 - 150.0,
      //         top:(MediaQuery.of(context).size.height/1.1) -10,
      //         child:_buildOption(Icon(Icons.home,color: Colors.black,),Colors.purple),
      //       ),
      //       //   AnimatedPositioned(
      //       //   duration: Duration(milliseconds: 300),
      //       //   left: opened? MediaQuery.of(context).size.width/2 - 40.0
      //       //   : MediaQuery.of(context).size.width/2 - 120.0,
      //       //   top:opened?(MediaQuery.of(context).size.height/1.1) -20
      //       //   : (MediaQuery.of(context).size.height/1.1)-100,
      //       //   child:_buildOption(Icon(Icons.home,color: Colors.black,),Colors.purple),
      //       // ),
      //       Align(
      //        alignment: Alignment(0, 1),
      //         child:AnimatedSwitcher(
      //           duration: Duration(milliseconds: 200),
      //           transitionBuilder:
      //           (Widget child,Animation<double>animation){
      //             return ScaleTransition(
      //               child:child,scale:animation
      //             );
      //           },
      //             child:opened ? InkWell(
      //               key: UniqueKey(),
      //               child:Padding(
      //                 padding: EdgeInsets.all(8),
      //                 child:Container(
      //                   height: 80,
      //                   width: 80,
      //                   decoration: BoxDecoration(
      //                     borderRadius: BorderRadius.circular(40),
      //                     color: Colors.blue
      //                   ),
      //                   child:Center(
      //                     child:Icon(Icons.home,color: Colors.white,)
      //                   )
      //                 )
      //               ),
      //               onTap: (){
      //                 setState(() {
      //                   opened = false;
      //                 });
      //               },
      //             ):InkWell(
      //               key: UniqueKey(),
      //               child:Padding(
      //                 padding: EdgeInsets.all(8),
      //                 child:Container(
      //                   height: 80,
      //                   width: 80,
      //                   decoration: BoxDecoration(
      //                     borderRadius: BorderRadius.circular(40),
      //                     color: Colors.red
      //                   ),
      //                   child:Center(
      //                     child:Icon(Icons.close,color: Colors.white,)
      //                   )
      //                 )
      //               ),
      //               onTap: (){
      //                 setState(() {
      //                   opened = true;
      //                 });
      //               },
      //             )
      //         )
      //       )
      //       // Positioned(
      //       //   bottom: 80,
      //       //   top: 0,
      //       //   left: 0,
      //       //   right: 0,
      //       //   child: GestureDetector(
      //       //     // onTap: () {
      //       //     //  key.currentState.forwardAnimation();
      //       //     //   key.currentState.reverseAnimation();

      //       //     // },
      //       //     child: Container(
      //       //       child: Center(
      //       //         child: Image(
      //       //           height: 65,
      //       //           width: 65,
      //       //           image: AssetImage('gambar/C_icon.png'),
      //       //         ),
      //       //       ),
      //       //     ),
      //       //   ),
      //       // ),
      //       //          CircularMenu(
      //       //   alignment: Alignment.bottomCenter,
      //       //   startingAngleInRadian: 1.25 * pi,
      //       //   endingAngleInRadian: 1.75 * pi,
      //       //   backgroundWidget: Center(
      //       //     // child: Row(
      //       //     //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //       //     //   children: <Widget>[
      //       //     //     MaterialButton(
      //       //     //       onPressed: () {
      //       //     //         key.currentState.forwardAnimation();
      //       //     //       },
      //       //     //       color: Colors.pink,
      //       //     //       shape: RoundedRectangleBorder(
      //       //     //           borderRadius: BorderRadius.circular(15)),
      //       //     //       padding: const EdgeInsets.all(15),
      //       //     //       child: Text(
      //       //     //         'forward',
      //       //     //         style: TextStyle(
      //       //     //           color: Colors.white,
      //       //     //           fontSize: 24,
      //       //     //         ),
      //       //     //       ),
      //       //     //     ),
      //       //     //     MaterialButton(
      //       //     //       onPressed: () {
      //       //     //         key.currentState.reverseAnimation();
      //       //     //       },
      //       //     //       shape: RoundedRectangleBorder(
      //       //     //           borderRadius: BorderRadius.circular(15)),
      //       //     //       padding: const EdgeInsets.all(15),
      //       //     //       color: Colors.pink,
      //       //     //       child: Text(
      //       //     //         'reverse',
      //       //     //         style: TextStyle(
      //       //     //           color: Colors.white,
      //       //     //           fontSize: 24,
      //       //     //         ),
      //       //     //       ),
      //       //     //     ),
      //       //     //   ],
      //       //     // ),
      //       //   ),
      //       //   key: key,
      //       //   items: [
      //       //     CircularMenuItem(
      //       //       icon: Icons.home,
      //       //       onTap: () {},
      //       //       color: Colors.green,
      //       //       iconColor: Colors.white,
      //       //     ),
      //       //     CircularMenuItem(
      //       //       icon: Icons.search,
      //       //       onTap: () {},
      //       //       color: Colors.orange,
      //       //       iconColor: Colors.white,
      //       //     ),
      //       //     CircularMenuItem(
      //       //       icon: Icons.settings,
      //       //       onTap: () {},
      //       //       color: Colors.deepPurple,
      //       //       iconColor: Colors.white,
      //       //     ),
      //       //   ],
      //       // ),
      //     ],
      //   );
      // }
      // //
      // Widget _buildOption(Icon icon,Color iconColor){
      //   return AnimatedSwitcher(
      //     duration: Duration(milliseconds: 500),
      //     transitionBuilder:(Widget child,Animation<double>animation){
      //       return RotationTransition(
      //         child:child,
      //         turns:animation
      //       ) ;
      //     },
      //     child: InkWell(
      //       key:UniqueKey(),
      //       child:Padding(
      //         padding:EdgeInsets.all(8),
      //         child:Column(
      //           children: [
      //             Container(
      //               height:50,
      //               width:50,
      //               decoration:BoxDecoration(
      //                 color: Colors.red,
      //                 borderRadius:BorderRadius.circular(25.0),
      //               ),
      //               child:Center(
      //                 child:icon,
      //               ),
      //             ),
      //             Text('fffffff'),
      //           ],
      //         ),
      //       ),
      // onTap: (){
      //   setState(() {
      //     opened = false;
      //   });
      // },
      //     )
    );
  }
}
