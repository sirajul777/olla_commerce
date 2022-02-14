import 'package:flutter/material.dart';

class Change extends StatefulWidget {
  const Change({Key key}) : super(key: key);

  @override
  _ChangeState createState() => _ChangeState();
}

class _ChangeState extends State<Change> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: const Text('oke'),
      ),
    );
  }
}
