import 'package:eapp/consts/consts.dart';
import 'package:get/get.dart';

class FirestoreServices {
  static getUser(uid){
          return firestore.collection(userCollection).where("id",isEqualTo:uid).snapshots();
          
  }


  static getProducts(String category){
    return firestore.collection(productsCollection).where('p_category',isEqualTo: category).snapshots();
    
  }

  static getCart(uid){
    return firestore.collection(cartCollection).where("addedby",isEqualTo: uid).snapshots();
  }

  static getAllChat(chatid){
    return firestore.collection(chatCollection).doc(chatid).collection(messagesCollection).orderBy("created_on",descending: false).snapshots();
  }
}


