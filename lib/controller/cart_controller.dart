import 'package:eapp/consts/firebase_consts.dart';
import 'package:get/get.dart';

class CartController extends GetxController{
 
var totalp=0.obs;
  
calculate(data){
  totalp.value=0;
  for(var i=0; i<data.length; i++){
    totalp.value=totalp.value+int.parse(data[i]["tprice"].toString());
  }
}
deleteCart(String docid)async{
 return await firestore.collection(cartCollection).doc(docid).delete();
}

}