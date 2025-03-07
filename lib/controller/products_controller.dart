import 'dart:convert';

import 'package:eapp/models/categories_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ProductsController extends GetxController{
  var subCat=[];
getSubCategories(String title) async{
  var data= await rootBundle.loadString("lib/services/categoriesmodel.json");
  var decodeddata=jsonDecode(data);
  var decoded=CatergoriesModel.fromJson(decodeddata);
  late var s=decoded.categories!.where((e){
    return e.name==title;}).toList();
  for(var i in s[0].subcategoreis.){
    subCat.add(i);
  }
}
 

}