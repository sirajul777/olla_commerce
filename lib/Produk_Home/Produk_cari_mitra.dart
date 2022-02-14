import 'package:flutter/material.dart';

class ProdukCariMitra extends StatefulWidget {
  @override
  _ProdukCariMitraState createState() => _ProdukCariMitraState();
}

class _ProdukCariMitraState extends State<ProdukCariMitra> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 44.0),
              child: Text(
                'CARI',
                style: TextStyle(
                    color: Colors.deepPurple[400], fontFamily: 'Comfortaa'),
              ),
            ),
            Text(
              'Mitra',
              style:
                  TextStyle(color: Colors.yellow[800], fontFamily: 'Comfortaa',fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Row(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'tampilkan semuanya',
              style: TextStyle(fontFamily: 'Comfortaa', fontSize: 12,fontWeight: FontWeight.bold),
            ),
            Icon(Icons.arrow_forward_ios_rounded, size: 12)
          ],
        ),
      ],
    );
  }
}
