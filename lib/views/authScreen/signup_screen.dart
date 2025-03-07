

import 'package:eapp/common_widget.dart/applogo.dart';
import 'package:eapp/common_widget.dart/bg_Widget.dart';
import 'package:eapp/common_widget.dart/custom_text_field.dart';
import 'package:eapp/common_widget.dart/our_Button.dart';
import 'package:eapp/consts/consts.dart';

import 'package:eapp/controller/auth_controller.dart';
import 'package:eapp/views/home/home.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool? isCheck=false;
  var controller=Get.put(AuthController());//create a instance oF aith contolele and store it in getx dependencies
 //text controllers
 var nameController=TextEditingController();
  var emailController=TextEditingController();
   var passwordController=TextEditingController();
   var retypepasswordController=TextEditingController();
   bool isPlaying=false;
  @override
  Widget build(BuildContext context) {
    return bgWidget(Scaffold(
resizeToAvoidBottomInset: false,
      body: Center(child: Column(children: [
   (context.screenHeight*0.1).heightBox,
   appLogoWidget(),
   10.heightBox,
   "Join the $appname".text.fontFamily(bold).white.size(18).make(),
   10.heightBox,
   Column(
    children: [
      customTextField(name, nameHint,nameController),
      customTextField(email, emailHint,emailController),
      customTextField(password, passwordHint ,passwordController),
      customTextField(retypePassword, retypePassword,retypepasswordController),
       Align(alignment:Alignment.centerRight,
    child: TextButton(
      onPressed: (){},
       child:forgetPassword.text.make()
    ),),
    5.heightBox,
   Row(children: [
    Checkbox(
      checkColor: redColor,
      value: isCheck, onChanged:(newValue){
        setState(() {
           isCheck=newValue;
        });
      
    }),
    10.widthBox,
    Expanded(
      child: RichText(text: TextSpan(
        children: [
          TextSpan(
            text: "I agree to the",
            style: TextStyle(
              fontFamily:regular ,
              color: fontGrey
            )
          ),
           TextSpan(
            text:termAndCond,
            style: TextStyle(
              fontFamily:regular ,
              color: redColor
            )),
             TextSpan(
            text:"&",
            style: TextStyle(
              fontFamily:regular ,
              color: fontGrey
            )),
             TextSpan(
            text:  privacypolicy,
            style: TextStyle(
              fontFamily:regular ,
              color: redColor
            ))
      
        ]
      )),
    )
   ],),
     5.heightBox,
      ourButton( ()async{
        if(isCheck!=false){
          try{
            setState(() {
              isPlaying=true;
            });
               await controller.signupMethod(emailController.text.toString(), 
               passwordController.text.toString(), context).then((value){
                VxToast.show(context, msg: loggedin);
               setState(() {
              isPlaying=false;
            });
                return controller.storeuserData(nameController.text.toString(),
                 passwordController.text.toString(), emailController.text.toString()).then((value){
                 VxToast.show(context, msg: loggedin);
                  Get.offAll(Home());
                }); });
          }catch(e){
             setState(() {
              isPlaying=false;
            });
         auth.signOut();
         VxToast.show(context, msg:e.toString());
          }
        }
      }, 
      
      isCheck==true?redColor:lightgolden,redColor,signup,isplaying: isPlaying)
      .box.width(context.screenWidth-50).rounded.make()
     ,10.heightBox,
    RichText(text: TextSpan(
      children: [
        TextSpan(
          text: alreadyHaveAcc,
          style: TextStyle(
            color: fontGrey,
            fontFamily: regular
          ),
          
        ),
        TextSpan(
          text: login,
          style: TextStyle(
            color: redColor,
            fontFamily: regular
          ))
      ]
    )).onTap((){
      Get.back();
    }),
     5.heightBox,
    
      ],
   ).box.white.rounded.padding(EdgeInsets.all(16))
   .width(context.screenWidth -70).shadowSm.make(),
    5.heightBox,
     
      ],),)
    ));
  }
} 