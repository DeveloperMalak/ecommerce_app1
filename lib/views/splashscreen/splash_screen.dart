import 'package:eapp/common_widget.dart/applogo.dart';
import 'package:eapp/consts/colors.dart';

import 'package:flutter/material.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: redColor,
      body: Column(children: [
        appLogoWidget()
      ],),
    );
  }
}