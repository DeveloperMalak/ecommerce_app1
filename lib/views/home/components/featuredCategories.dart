import 'package:eapp/consts/consts.dart';

Widget featuredButton(String title, String icon ){
  return Row(children: [
Image.asset(icon,width: 60,fit: BoxFit.fill,),
10.widthBox,
title.text.fontFamily(semibold).color(darkFontGrey).make()
  ],).box.white.width(200).padding(EdgeInsets.all(4)).roundedSM.outerShadowSm.make();
}