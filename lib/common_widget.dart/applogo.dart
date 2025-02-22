import 'dart:ui';

import 'package:eapp/consts/consts.dart';
import 'package:eapp/consts/images.dart';

import 'package:flutter/material.dart';

Widget appLogoWidget(){
  //using a velocity x
  return Image.asset(icAppLogo).box.white.size(70,70).padding(EdgeInsets.all(8)).rounded.make();
}