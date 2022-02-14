import 'package:product/DEVICE/size_informaton.dart';
import 'package:flutter/material.dart';

class BaseWidget extends StatelessWidget{
  final Widget Function(
    BuildContext context,SizingInformation sizingInformation) builder;
    const BaseWidget({
      Key key,this.builder
    }):super(key: key);
  @override
  Widget build(BuildContext context){
    var sizinginformation = SizingInformation();
return builder(context,sizinginformation);
  }
}