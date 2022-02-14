import 'package:flutter/cupertino.dart';
import 'package:product/DEVICE/device_screen.dart';

class SizingInformation{
  final Orientation orientation;
  final DeviceScreenType deviceScreenType;
  final Size screenSize;
  final Size localWidgetSize;

  SizingInformation({
    this.orientation,
    this.deviceScreenType,
    this.screenSize,
    this.localWidgetSize
  });

  @override
  String toString(){
    return 'Orientation:$orientation DeviceType:$deviceScreenType';
    
  }
}