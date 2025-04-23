import 'dart:convert';
import 'package:eapp/consts/consts.dart';
import 'package:eapp/models/categories_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

// Make sure this is the correct import path

class ProductsController extends GetxController {
  var quantity=0.obs;
  var colorindex=0.obs;
 var subCat =<String> [].obs;
 var totatlPrice=0.obs;
 
getSubCategories(String title)async{
  
  var data=await rootBundle.loadString("assets/categoriesmodel.json");
 
  var decoded=CategoriesModel.fromJson(jsonDecode(data));
  subCat.clear();
  for(var i in decoded.categories!){
          if(i.name==title){
         
            subCat.addAll(i.subcategories as Iterable<String>);
          }

     

  }
}
changeColorindex(index){
  colorindex.value=index ;
}
increaseQuantity(totalavailable){
  if(quantity.value<totalavailable){
     quantity.value++;
  }
 
}
decreaseQuantity(){
  if(quantity.value>0){
    quantity.value--;
  }
  
}
calculatetotalPrice(price){
totatlPrice.value=price *quantity.value;
}


addToCart({title,img,sellername,color,qty,price,context,}){
  var newdoc=firestore.collection(cartCollection).doc();

  var docid=newdoc.id;
  newdoc.set({ "title":title,
    "img":img,
    "sellername":sellername,
    "color":color,
    "qty":qty,
    "tprice":price,
    "addedby":currentuser!.uid,
    "docid":docid})
  .catchError((error){
    VxToast.show(context, msg: error.toString());
  });
}
resetValue(){
  totatlPrice.value=0;
  quantity.value=0;
  colorindex.value=0;
  
}




}
