import 'package:eapp/consts/consts.dart';
Widget customTextField(String title,String hint,TextEditingController? controller){
  return Column(children: [
    title.text.color(redColor).fontFamily(semibold).make(),
    5.heightBox,
    TextFormField(
     controller: controller,
      decoration: InputDecoration(
        fillColor: lightGrey,
        filled: true,
        isDense: false,
        hintText: hint,
        hintStyle: TextStyle(fontFamily: semibold,
      color: textfieldGrey,
      ),
        border: InputBorder.none,
        focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color:redColor)
        )
              ),
    )
  ],);
}