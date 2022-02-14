import 'package:flutter/material.dart';

class PenawaranMenarik extends StatefulWidget {
  @override
  _PenawaranMenarikState createState() => _PenawaranMenarikState();
}

class _PenawaranMenarikState extends State<PenawaranMenarik> {
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
            child: Text('Penawaran Menarik'),
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
                          image: AssetImage('gambar/images/promo_menarik.png'),
                          fit: BoxFit.cover)),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 3),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Promo Menarik'),
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
          )
        ],
      ),
    );
  }
}
