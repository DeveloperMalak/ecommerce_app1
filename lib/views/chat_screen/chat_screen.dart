import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eapp/consts/consts.dart';
import 'package:eapp/controller/chat_controller.dart';
import 'package:eapp/services/firestore_services.dart';
import 'package:eapp/views/chat_screen/components/sender_bubble.dart';
import 'package:get/get.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var chatcontroller=Get.put(ChatController());
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: "${chatcontroller.friendName}".text.color(darkFontGrey).fontFamily(semibold).make(),
      ),
    

    body:Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
         
            // chatcontroller.isloading.value?Center(child: CircularProgressIndicator(),):
             Expanded(
              
              child: Container(
            
            child:Obx(()=>
               chatcontroller.chatDocId.value==null?Center(child: CircularProgressIndicator(),):
               StreamBuilder(stream: FirestoreServices.getAllChat(chatcontroller.chatDocId.value.toString()), 
              builder: (BuildContext context ,AsyncSnapshot<QuerySnapshot> snapshot){
              if(!snapshot.hasData){
               return Center(child: CircularProgressIndicator(),);
              }else if(snapshot.data!.docs.isEmpty){
                return Center(child: "Send a message ...".text.color(darkFontGrey).make(),);
              }else{
                return Expanded(
                  child: ListView(
                    children: snapshot.data!.docs.mapIndexed((currentValue, index){ 
                      var data=snapshot.data!.docs[index];
                      return Align(
                      alignment: data["uid"]==currentuser?.uid?Alignment.centerRight:Alignment.centerLeft,  
                      

                        child: senderBubble(data));}).toList()
                  ),
                );
              }
              }),
            )
          ,)),
         
          10.heightBox,
          Row(children: [
            Expanded(child: TextField(
              controller: chatcontroller.msgcontroller,
              decoration: InputDecoration(
                hintText: "Type your message here",
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: textfieldGrey
                  )
                ),
                border: OutlineInputBorder(
                  
                  borderSide: BorderSide(
                    color: textfieldGrey
                  )
                )
              ),
            )),
            IconButton(onPressed: (){
              chatcontroller.sendMsg(chatcontroller.msgcontroller.text);
              chatcontroller.msgcontroller.clear();
            }, icon: Icon(Icons.send,color: redColor,))
          ],).box.height(80).padding(EdgeInsets.all(12)).margin(EdgeInsets.only(bottom: 8)).make()
        ],
      ),
    ) ,


    );
    
    
    }}