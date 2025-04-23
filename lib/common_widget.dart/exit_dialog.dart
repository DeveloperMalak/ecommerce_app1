import 'package:eapp/common_widget.dart/our_Button.dart';
import 'package:eapp/consts/consts.dart';
import 'package:flutter/services.dart';

Widget exitDialog(context){
  return Dialog(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        "confirm".text.fontFamily(bold).size(18).color(darkFontGrey).make(),
        Divider(),
        10.heightBox,
        "Are you sure you want to exit".text.size(16).color(darkFontGrey).make(),
        10.heightBox,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          ourButton((){
            SystemNavigator.pop();
          }, redColor, whiteColor, "yes"),
           ourButton((){
            Navigator.pop(context);
           }, redColor, whiteColor, "no")
        ],)
      ],
    ).box.roundedSM.color(lightGrey).padding(EdgeInsets.all(12)).make(),
  );
}