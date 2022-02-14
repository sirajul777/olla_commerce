import 'package:flutter/material.dart';

class PenawaranLainnya extends StatefulWidget {
  @override
  _PenawaranLainnyaState createState() => _PenawaranLainnyaState();
}

class _PenawaranLainnyaState extends State<PenawaranLainnya> {
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
            child: Text('Penawaran Lainnya'),
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
            padding: const EdgeInsets.only(top:20.0,left:10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 20,
                  width: 25,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('gambar/images/voucher_icon.png'),
                          )),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 13),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('CARI Rewards'),
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
