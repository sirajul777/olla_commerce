import 'package:flutter/material.dart';

class LayananCARInih extends StatefulWidget {
  @override
  _LayananCARInihState createState() => _LayananCARInihState();
}

class _LayananCARInihState extends State<LayananCARInih> {
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
            child: Text('Layanan CARInih'),
          ),
          Padding(
            padding: const EdgeInsets.only(top:15.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 30,
                  width: 45,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('gambar/images/cari_donasi.png'),
                          fit: BoxFit.cover)),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 3),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('CARI Donasi'),
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
            padding: const EdgeInsets.only(top:10.0,left:10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 45,
                  width: 30,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('gambar/images/cari_informasi.png'),fit: BoxFit.cover
                          )),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 8,top:10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('CARI Informasi'),
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
            padding: const EdgeInsets.only(top:10.0,left:10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 45,
                  width: 30,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('gambar/images/cari_service.png'),fit: BoxFit.cover
                          )),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 8,top:10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('CARI Service'),
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
