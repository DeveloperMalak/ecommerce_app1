import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eapp/common_widget.dart/bg_Widget.dart';
import 'package:eapp/consts/consts.dart';
import 'package:eapp/controller/products_controller.dart';
import 'package:eapp/services/firestore_services.dart';
import 'package:eapp/views/category_screen/itemsDetails.dart';
import 'package:get/get.dart';
 class Categoriesdetails extends StatefulWidget {
 final String title;
   const Categoriesdetails( this.title, {super.key});

  @override
  State<Categoriesdetails> createState() => _CategoriesdetailsState();
}

class _CategoriesdetailsState extends State<Categoriesdetails> {

   
  @override
  Widget build(BuildContext context) {
    
 var controller=Get.find<ProductsController>();
    return bgWidget(Scaffold(
    
      appBar: AppBar(
        title: widget.title.text.fontFamily(bold).white.make(),
      ),
      body:StreamBuilder(stream: FirestoreServices.getProducts(widget.title),
       builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshots){
         if(!snapshots.hasData){
            return Center(child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(redColor),
            ),);
         }else if(snapshots.data!.docs.isEmpty){
          return Center(
            child: "no products found".text.color(darkFontGrey).make(),
          );
         }else{
          var data=snapshots.data!.docs;
          return   Column(
            children: [
              Container(
              padding: EdgeInsets.all(12),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child:
                        Row(
                        children: List.generate(
                          controller.subCat.length,
                          (index) => controller.subCat[index].toString()
                              .text
                              .fontFamily(semibold)
                              .size(12)
                              .color(darkFontGrey)
                              .makeCentered()
                              .box
                              .white
                              .size(120, 60)
                              .margin(EdgeInsets.symmetric(horizontal: 4))
                              .rounded
                              .make(),
                        ),
                                           ),
                     ),

                ),
              20.heightBox,
              Expanded(child: GridView.builder(
                physics: BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:3,mainAxisSpacing: 8,crossAxisSpacing: 8,
                  mainAxisExtent: 250),
                  itemCount: data.length,
                   itemBuilder: (BuildContext context, index){
             return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                       Image.network(data[index]["p_imgs"][0],width: 200,height: 150,fit: BoxFit.cover,),
                                         
                                         "${data[index]["p_name"]}".text.fontFamily(semibold).color(darkFontGrey).make(),
                                         10.heightBox,
                                         "${data[index]["p_price"]}".numCurrencyWithLocale().text.color(redColor).fontFamily(bold).size(16).make()
                            ],).box.white.margin(EdgeInsets.symmetric(horizontal: 4))
                            .roundedSM.outerShadow.padding(EdgeInsets.all(12)).make()
                            .onTap((){
                              
                              
                            Get.to(()=>Itemsdetails(title: "${data[index]["p_name"]}",data: data[index],));});
                   
              }))
            ],
                   );
         
         }
       }) 
        
           
      
    ));
  }
}