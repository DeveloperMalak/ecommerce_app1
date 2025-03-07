

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eapp/consts/consts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
class ProfileController extends GetxController{
var profileImagepath="".obs;
var isplaying=false.obs;
void changeImage(context)async{
try{
final img=await ImagePicker().pickImage(source: ImageSource.gallery,imageQuality: 70);
if(img==null){
  return;
}else{
  profileImagepath.value=img.path;
}
}on PlatformException catch(e){
 VxToast.show(context, msg: e.toString());
}

}

updateProfile(String name,String password)async{
  var store=await firestore.collection(userCollection).doc(currentuser!.uid).set({
    "name":name,
    "password":password
    },SetOptions(merge: true));
}

  changeAuthPassword({ required String email,required String password,required String newpassword})async{
  final cred=EmailAuthProvider.credential(email: email, password: password,);
  await currentuser!.reauthenticateWithCredential(cred).then((value)async{
   await  currentuser!.updatePassword(newpassword);
  }).catchError((error){
    print(error.toString());
  });
}

}