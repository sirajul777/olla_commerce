import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class  ProdukCarinih extends StatefulWidget {
  @override
  _ProdukCarinihState createState() => _ProdukCarinihState();
}

class _ProdukCarinihState extends State<ProdukCarinih> {
  //
   final String url = "https://carinih.ws/api/icon_home";
  String data1;
  String data2;
  String data3;
  String data4;
  String data5;
  String title1;
  String title2;
  String title3;
  String title4;
  String title5;
  String title6;
  Future<String> getJsonData() async {
    http.Response response = await http.get(Uri.parse(Uri.encodeFull(url)),
        headers: {"Accept": "application/json"});
    print(response.body);

    Map<String, dynamic> data = json.decode(response.body);
    setState(() {
      data1 = data['data'][0]['image'];
      data2 = data['data'][1]['image'];
      data3 = data['data'][2]['image'];
      data4 = data['data'][3]['image'];
      data5 = data['data'][4]['image'];
     //
     title1 = data['data'][0]['title'];
     title2 = data['data'][1]['title'];
     title3 = data['data'][2]['title'];
     title4 = data['data'][3]['title'];
     title5 = data['data'][4]['title'];
    });

    print('$data1');
  }

  @override
  void initState(){
    getJsonData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: ListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: Text('Produk CARInih'),
          ),
          Padding(
            padding: const EdgeInsets.only(top:15.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 30,
                  width: 42,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage('http://carinih.ws/uploads/upload_images/image_image/$data1'),
                          )),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 3),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('$title1'),
                         Container(
                           margin: EdgeInsets.only(top:10,right:10),
                           height: 1,
                           color: Colors.grey[300],
                         )
                         ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          //
            Padding(
            padding: const EdgeInsets.only(top:15.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 30,
                  width: 42,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage('http://carinih.ws/uploads/upload_images/image_image/$data2'),
                          )),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 3),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('$title2'),
                         Container(
                           margin: EdgeInsets.only(top:10,right:10),
                           height: 1,
                           color: Colors.grey[300],
                         )
                         ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          //
          Padding(
            padding: const EdgeInsets.only(top:15.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 30,
                  width: 42,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage('http://carinih.ws/uploads/upload_images/image_image/$data3'),
                          )),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 3),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('$title3'),
                         Container(
                           margin: EdgeInsets.only(top:10,right:10),
                           height: 1,
                           color: Colors.grey[300],
                         )
                         ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          //
          Padding(
            padding: const EdgeInsets.only(top:15.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 30,
                  width: 42,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage('http://carinih.ws/uploads/upload_images/image_image/$data4'),
                          )),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 3),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('$title4'),
                         Container(
                           margin: EdgeInsets.only(top:10,right:10),
                           height: 1,
                           color: Colors.grey[300],
                         )
                         ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          //
          Padding(
            padding: const EdgeInsets.only(top:15.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 30,
                  width: 42,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage('http://carinih.ws/uploads/upload_images/image_image/$data5'),
                          )),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 3),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('$title5'),
                         Container(
                           margin: EdgeInsets.only(top:10,right:10),
                           height: 1,
                           color: Colors.grey[300],
                         )
                         ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//tumis kates, gulai tahu udang, tauco ikan
