import 'package:flutter/material.dart';

class ProdukCariStore extends StatefulWidget {
  @override
  _ProdukCariStoreState createState() => _ProdukCariStoreState();
}

class _ProdukCariStoreState extends State<ProdukCariStore> {
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
              'CARIstore',
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
