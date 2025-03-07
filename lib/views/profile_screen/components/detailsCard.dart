import 'package:eapp/consts/consts.dart';

Widget  CardDetails(String? title,String count, double? width){
  return   Column(children: [
            count.text.fontFamily(bold).color(darkFontGrey).size(16).make(),
            5.heightBox,
            title!.text.color(darkFontGrey).make()
          ],).box.rounded.white.width(width!).height(80).padding(EdgeInsets.all(4)).make();
}