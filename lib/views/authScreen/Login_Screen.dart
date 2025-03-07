
import 'package:eapp/common_widget.dart/applogo.dart';
import 'package:eapp/common_widget.dart/bg_Widget.dart';
import 'package:eapp/common_widget.dart/custom_text_field.dart';
import 'package:eapp/common_widget.dart/our_Button.dart';
import 'package:eapp/consts/consts.dart';
import 'package:eapp/consts/lists.dart';
import 'package:eapp/controller/auth_controller.dart';
import 'package:eapp/views/authScreen/signup_screen.dart';
import 'package:eapp/views/home/home.dart';
import 'package:get/get.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
   var controller=Get.put(AuthController());
    var emailController=TextEditingController();
    var passwordController=TextEditingController();
    bool isPlaying=false;
  @override
 
  Widget build(BuildContext context) { 
   
    return bgWidget(Scaffold(
resizeToAvoidBottomInset: false,
      body: Center(child: Column(children: [
   (context.screenHeight*0.1).heightBox,
   appLogoWidget(),
   10.heightBox,
   "Login to $appname".text.fontFamily(bold).white.size(18).make(),
   10.heightBox,
   
      Column(
      children: [
        customTextField(email, emailHint,controller.emailController),
        customTextField(password, passwordHint ,controller.passwordController),
         Align(alignment:Alignment.centerRight,
      child: TextButton(
        onPressed: (){},
         child:forgetPassword.text.make()
      ),),
      5.heightBox,
      ourButton(
      
         ()async{
         setState((){
            isPlaying=true;
          });
       await controller.loginMethod(context).then((value){
          setState((){
            isPlaying=false;
          });
          if(value!=null){
          VxToast.show(context, msg:loggedin);
          Get.offAll(()=>Home());
          }
       }).onError((error,StackTrace){
          VxToast.show(context, msg: error.toString());
       });
      
      }, redColor,
     
      whiteColor,login, isplaying: isPlaying).box.width(context.screenWidth-50).rounded.make()
       ,
       5.heightBox,
        createNewAccount.text.color(fontGrey).make(),
        5.heightBox,
        ourButton(
           (){
          Get.to(()=>SignupScreen());
        }, lightgolden,redColor,signup,).box.width(context.screenWidth-50).rounded.make()
       ,10.heightBox,
       loginWith.text.color(fontGrey).make(),
       5.heightBox,
       Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:List.generate(3, (index)=>Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: lightGrey,
            radius: 25,
            child: Image.asset(socialIconList[index],width: 30,),
          ),
        ))
       )
        ],
     ).box.white.rounded.padding(EdgeInsets.all(16)).
     width(context.screenWidth -70).shadowSm.make(),
   
    5.heightBox,
     
      ],),)
    ));
  }
} 