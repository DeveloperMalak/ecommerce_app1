import 'package:eapp/consts/consts.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:get/get.dart';

class AuthController extends GetxController{
//login method
var  emailController=TextEditingController();
var passwordController=TextEditingController();
  Future<UserCredential?> loginMethod(context)async{
    UserCredential? userCredential;
    try{
 userCredential= await auth.signInWithEmailAndPassword(
  email: emailController.text.toString(),
  password: passwordController.text.toString());

    }on FirebaseAuthException catch(e){
       VxToast.show(context,msg: e.toString());
    }
    return userCredential;
  }

  //signup methods
   Future<UserCredential?> signupMethod( String email,String password,context)async{
    UserCredential? userCredential;
    try{
 userCredential= await auth.createUserWithEmailAndPassword(email: email, password: password);

    }on FirebaseAuthException catch(e){
       VxToast.show(context,msg: e.toString());
      
    }
    return userCredential;
  }

  //storing data methods
 storeuserData(String name,String password,String email)async{
  final store=firestore.collection(userCollection).doc(currentuser!.uid);
  store.set(
    {
"name":name,
"password":password,
"email":email,
"image":"",
"id":currentuser?.uid,
"cart_count":"00",
"order_count":"00",
"wishlist_count":"00"
    }
  );
 }
  //signout method
  signoutMethod(context)async{
   try{
      await auth.signOut();
   }catch(e){
      VxToast.show(context,msg:e.toString());
   }
  }
}