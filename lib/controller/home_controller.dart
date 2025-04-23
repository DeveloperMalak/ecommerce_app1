import 'package:eapp/consts/consts.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{

  @override
  void onInit(){
getUserName();
super.onInit();

  }
  var currentNavIndex=0.obs;
   var username=''.obs;

   getUserName()async{
     var n= await firestore.collection(userCollection).where("id",isEqualTo: currentuser!.uid).get().then((value){

      if(value.docs.isNotEmpty){
        return value.docs.first["name"];
      }

     });
     username.value=n.toString();
   
   }


}