import 'package:flutter/material.dart';

class ProdukMitra extends StatefulWidget {
  @override
  _ProdukMitraState createState() => _ProdukMitraState();
}

class _ProdukMitraState extends State<ProdukMitra> {
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
                'Produk',
                style: TextStyle(
                    color: Colors.deepPurple[400], fontFamily: 'Comfortaa',fontWeight: FontWeight.bold),
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
              style: TextStyle(fontFamily: 'Comfortaa', fontSize: 12),
            ),
            Icon(Icons.arrow_forward_ios_rounded, size: 12)
          ],
        ),
      ],
    );
  }
}
