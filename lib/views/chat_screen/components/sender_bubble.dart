import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eapp/consts/consts.dart';
import 'package:intl/intl.dart';


Widget senderBubble(DocumentSnapshot data){
  var t=data["created_on"]==null?DateTime.now():data["created_on"].toDate();
  var time=DateFormat("h:mma").format(t);
  return Container(
    padding: EdgeInsets.all(8),
    margin: EdgeInsets.only(bottom: 8),
                decoration: BoxDecoration(color:data["uid"]==currentuser!.uid? redColor:Colors.blue,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20),
                  bottomRight:Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                  topRight: Radius.circular(20))
                ),
                child: Column(children: [
                  "${data["last_msg"]}".text.white.size(16).make(),
                  10.heightBox,
                  "${time}".text.color(whiteColor.withOpacity(0.5)).make()
                ],),
              );
}