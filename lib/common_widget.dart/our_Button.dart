import 'package:eapp/consts/consts.dart';
Widget ourButton(onPressed, Color color,Color textColor, String title, {bool isplaying=false}){
  return ElevatedButton(
  onPressed: onPressed,
  style: ElevatedButton.styleFrom(
    iconColor:redColor,
    backgroundColor:color,
     padding: EdgeInsets.all(12)
  ),
  child: isplaying?Center(child: Center(child: CircularProgressIndicator(color: whiteColor,))):title.text.white.fontFamily(bold).make()
  
  );
}