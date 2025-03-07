import 'package:eapp/consts/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
Widget bgWidget(Widget? child){
  return Container(
    decoration: BoxDecoration(image: DecorationImage(image: AssetImage(imgBackground),fit:BoxFit.fill)),
 child: child,
  );
}