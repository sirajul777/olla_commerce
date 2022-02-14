import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class IconDLL extends StatefulWidget {
  @override
  _IconDLLState createState() => _IconDLLState();
}

class _IconDLLState extends State<IconDLL> {
  final String myUrl = "https://carinih.ws/api/icon_home";
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
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 15),
            child: Row(
              children: [
                Text(
                  'CARI',
                  style: TextStyle(
                      color: Colors.deepPurple[400], fontFamily: 'Comfortaa'),
                ),
                SizedBox(height: 10),
                Text(
                  'Menu',
                  style: TextStyle(
                      color: Colors.yellow[800], fontFamily: 'Comfortaa'),
                ),
              ],
            ),
          ),
          Stack(
            children: [
              ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: data == null ? 0 : data.length,
                  itemBuilder: (BuildContext context, int i) {
                    return data[i]['image_group'].contains('12')
                        ? Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10.0, top: 15),
                                child: Container(
                                  height: 30,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              ('http://carinih.ws/uploads/upload_images/image_image/${data[i]['image']}')))),
                                ),
                              ),
                              Expanded(
                                  child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 10.0, top: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(data[i]['title']),
                                    SizedBox(height: 10),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 10.0),
                                      child: Container(
                                        color: Colors.grey[300],
                                        width: double.infinity,
                                        height: 1,
                                      ),
                                    )
                                  ],
                                ),
                              ))
                            ],
                          )
                        : SizedBox();
                  }),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 15),
                child: Text('Navigasi Menu'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
