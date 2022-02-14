// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:product/Utils/utility.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool loading = true;
  @override
  Widget build(BuildContext context) {
    // declare device query
    var DeviceHeight = MediaQuery.of(context).size.height;
    var DeviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        height: DeviceHeight,
        width: DeviceWidth,
        child: SingleChildScrollView(
          child: Column(
            children:[
            Container(
              margin: const EdgeInsets.only(top: 35, bottom: 20),
              padding: const EdgeInsets.only(left: 20,right: 20),
              color: AppColors.theme,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Olla'),
                  
                ],
              ),
            )
            ]
          ),
        ),

      ),
      
    );
  }
}
