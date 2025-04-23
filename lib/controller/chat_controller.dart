import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eapp/consts/consts.dart';
import 'package:eapp/controller/home_controller.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
@override
  void onInit(){
    getChatId();
    super.onInit();
  }
  var chat=firestore.collection(chatCollection);
  var friendName=Get.arguments[0];
  var friendId=Get.arguments[1];

  var senderName=Get.put(HomeController().username);
  var currentid=currentuser!.uid;
  var msgcontroller=TextEditingController();
 var isloading=false.obs;
   var  chatDocId = ''.obs;
   getChatId()async{
   isloading.value=true;
    await  chat.where("users",isEqualTo: {
      friendId:null,
      currentid:null}
    ).limit(1).get().then((QuerySnapshot snapshot){
      if(snapshot.docs.isNotEmpty){
         chatDocId.value=snapshot.docs.first.id;
      }else{
         chat.add({
          "created_on":null,
          "last_msg":"",
          "users":{friendId:null,currentid:null},
          "toId":"",
          "fromId":"",
          "friend_ame":friendName,
          "sender_name":senderName

         }).then((value){
          chatDocId.value=value.id.toString();
         });
isloading.value=false;
      }
    });
    
   }

 sendMsg(String msg)async{
 if(msg.trim().isNotEmpty){
  await chat.doc(chatDocId.value.toString()).update({
    "created_on":FieldValue.serverTimestamp(),
    "last_msg":msg,
    "toId":friendId,
    "fromId":currentid
  });

  await chat.doc(chatDocId.value.toString()).collection(messagesCollection).doc().set({
    "created_on":FieldValue.serverTimestamp(),
    "last_msg":msg,
    "uid":currentid

  });
 }
 }  
}