import 'package:eapp/common_widget.dart/applogo.dart';
import 'package:eapp/consts/colors.dart';
import 'package:eapp/consts/consts.dart';
import 'package:eapp/views/authScreen/Login_Screen.dart';
import 'package:eapp/views/home/home.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

changeScreen(){
  Future.delayed(Duration(seconds: 3),(){
     auth.authStateChanges().listen((User? user){
      if(user==null&&mounted){
           Get.to(()=>LoginScreen());
      }else{
         Get.to(()=>Home());
      
      }});
  });
}

void initState(){
  changeScreen();
  super.initState();
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: redColor,
      body: Column(children: [
        Align(
          alignment: Alignment.topLeft,
          child: Image.asset(icSplashBg,width: 300,)),
         20.heightBox,
         appLogoWidget(),
         10.heightBox,
         appname.text.fontFamily( bold).white.size(22).make(),
         5.heightBox,
         appversion.text.white.make(),
         Spacer(),
         "@noorullah Khan".text.white.fontFamily(semibold).make(),
         30.heightBox
      ],),
    );
  }
}