import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eapp/common_widget.dart/bg_Widget.dart';
import 'package:eapp/consts/consts.dart';
import 'package:eapp/consts/lists.dart';
import 'package:eapp/controller/auth_controller.dart';
import 'package:eapp/controller/profile_controller.dart';
import 'package:eapp/services/firestore_services.dart';
import 'package:eapp/views/authScreen/Login_Screen.dart';
import 'package:eapp/views/profile_screen/components/detailsCard.dart';
import 'package:eapp/views/profile_screen/edit_profilescreen.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
     var controller=Get.put(AuthController());
    var profileController=Get.put(ProfileController());
    return bgWidget(Scaffold(
      body: StreamBuilder(
        stream: FirestoreServices.getUser(currentuser!.uid),
         builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshots){
          if(!snapshots.hasData){
return Center(child:  CircularProgressIndicator(
  valueColor: AlwaysStoppedAnimation(redColor),
),);
          }else{
            var data=snapshots.data!.docs[0];
            return SafeArea(child: Container(
    
        child: Column(children: [
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Align(
              alignment: Alignment.topRight,
              child: Icon(Icons.edit,color: whiteColor,)).onTap((){
               Get.to(()=>EditProfileScreen(data));
              }),
           ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(children: [
              Image.asset(imgProfile2,width: 100,fit: BoxFit.cover,).box.clip(Clip.antiAlias).roundedFull.make(),
                    10.heightBox,
                    Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                     
             
             "${data["name"]}".text.fontFamily(semibold).color(whiteColor).make(),
             "${data["email"]}".text.white.make()
                    ],)),
                    5.widthBox,
                    OutlinedButton(
            style: OutlinedButton.styleFrom(
              side: BorderSide(
                color: whiteColor,
              )
            ),
            onPressed: (){
         setState(() {
           
                controller.signoutMethod(context);
                Future.delayed(Duration(seconds: 2),(){
                  Get.offAll(LoginScreen());
                });
         });
            }, child:"Logout".text.size(4).fontFamily(semibold).white.make())
            ],),
          ),
          10.heightBox,
         Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          CardDetails("in your cart", "${data["cart_count"]}",context.screenWidth/3.4),
          
           CardDetails("in your wishList", "${data["order_count"]}",context.screenWidth/3.4), 
           
           CardDetails("your orders", "${data["wishlist_count"]}",context.screenWidth/3.4),
          
         ],),
         
         ListView.separated(itemBuilder: (BuildContext, int index){
          return ListTile(
            leading: Image.asset(proilesicons[index],width: 22,),
            title: profilesButtonlist[index].text.fontFamily(bold).color(darkFontGrey).make(),
          );
         },
         shrinkWrap: true,
          separatorBuilder: (context,index){
            return const Divider(
            color: lightGrey,
            );
          },
           itemCount: profilesButtonlist.length)
           .box.white.rounded.shadowSm.margin(EdgeInsets.all(12)).
           padding(EdgeInsets.symmetric(horizontal: 16)).make().box.color(redColor).make()
        ],),
      ));
          }
         })
    ));
  }
}