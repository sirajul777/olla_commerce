import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: avoid_unnecessary_containers
      body: Container(
        child: const Text('profile'),
      ),
    );
  }
}
