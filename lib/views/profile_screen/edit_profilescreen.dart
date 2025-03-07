import 'dart:io';

import 'package:eapp/common_widget.dart/bg_Widget.dart';
import 'package:eapp/common_widget.dart/custom_text_field.dart';
import 'package:eapp/common_widget.dart/our_Button.dart';
import 'package:eapp/consts/consts.dart';
import 'package:eapp/controller/profile_controller.dart';
import 'package:eapp/views/profile_screen/profile_screen.dart';
import 'package:get/get.dart';
class EditProfileScreen extends StatelessWidget {
  final dynamic data;
  const EditProfileScreen(this.data);
  @override
  Widget build(BuildContext context) {
    var namecontroller=TextEditingController();
    var oldpasswordController=TextEditingController();
    var newpasswordController=TextEditingController();
    var imgController=Get.find<ProfileController>();
   
    namecontroller.text=data["name"];
    // oldpasswordController.text=data["password"];
    return bgWidget(Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(


      ),

      body: SingleChildScrollView(
        child: Center(
          child: Obx(
            ()=> Column(
              mainAxisSize: MainAxisSize.min,
              children: [
             imgController.profileImagepath.isEmpty?Image.asset(imgProfile2,width: 100,fit: BoxFit.cover,).box.clip(Clip.antiAlias).roundedFull.make():
             Image.file(File(imgController.profileImagepath.value),
             width: 100,fit: BoxFit.cover,).box.clip(Clip.antiAlias).roundedFull.make(),
            10.heightBox,
            ourButton((){
                   imgController.changeImage(context);
            }, redColor, whiteColor, "Change"),
            const Divider(),
            20.heightBox,
            customTextField(name, nameHint, namecontroller),
            10.heightBox,
            customTextField(oldPass, passwordHint, oldpasswordController),
            10.heightBox,
            customTextField(newPass, passwordHint, newpasswordController),
                   20.heightBox,
                   SizedBox(
            width: context.screenWidth-40,
            child: Obx(()=>
               ourButton(
                isplaying:imgController.isplaying.value,
                ()async{
               imgController.isplaying.value=true;
                         if(data["password"]==oldpasswordController.text){
             await imgController.changeAuthPassword(email: data["email"].toString(),password:oldpasswordController.text.toString(),
             newpassword: newpasswordController.text.toString() );

              await ProfileController().updateProfile(
                namecontroller.text.toString(),
                newpasswordController.text.toString()).then((value){
                imgController.isplaying.value=false;
                  VxToast.show(context, msg: "updated");
                  Get.to(()=>ProfileScreen());
                });
                         }else{
              imgController.isplaying.value=false;
                        VxToast.show(context, msg: "wrong old password");
                         }
              },
              
               redColor, whiteColor, "Save"),
            ))
            ],).box.white.shadowSm.padding(EdgeInsets.all(16)).margin(EdgeInsets.only(top: 50,left: 12,right: 12)).rounded.make(),
          ),
        ),
      ),
    ));
  }
}