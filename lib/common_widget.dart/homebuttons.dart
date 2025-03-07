import 'package:eapp/consts/consts.dart';
Widget homeButton(double height,double width,icon,String title,onPressed){
  return  Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(icon,width: 26,),
      5.heightBox,
      title.text.fontFamily(semibold).color(darkFontGrey).make()
    ],).box.white.rounded.shadowSm.size(width, height).make();
}