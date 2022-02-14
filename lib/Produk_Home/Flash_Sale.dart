import 'package:flutter/material.dart';

class FlasSale extends StatefulWidget {
  @override
  _FlasSaleState createState() => _FlasSaleState();
}

class _FlasSaleState extends State<FlasSale> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right:50),
              child: Text(
                'FLASH',
                style: TextStyle(
                    color: Colors.deepPurple[400], fontFamily: 'Comfortaa'),
              ),
            ),
            Text(
              'SALES',
              style:
                  TextStyle(color: Colors.yellow[800], fontFamily: 'Comfortaa'),
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
