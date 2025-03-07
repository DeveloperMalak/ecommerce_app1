import 'package:eapp/common_widget.dart/bg_Widget.dart';
import 'package:eapp/consts/consts.dart';
import 'package:eapp/consts/lists.dart';
import 'package:eapp/controller/products_controller.dart';
import 'package:eapp/views/category_screen/itemsDetails.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
 class Categoriesdetails extends StatelessWidget {
  String title;
   Categoriesdetails( this.title);

  @override
  Widget build(BuildContext context) {
    var controller=Get.find<ProductsController>();
    return bgWidget(Scaffold(
      appBar: AppBar(
        title: title.text.fontFamily(bold).white.make(),
      ),

      body:Column(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: 
                  List.generate(controller.subCat.length,
                  (index)=>
                  controller.subCat[index].text.fontFamily(semibold).size(12).color(darkFontGrey).makeCentered().box.white.size(120,60).margin(EdgeInsets.symmetric(horizontal: 4)).rounded.make())
                
              ),
            ),
          
          ),
          20.heightBox,
          Expanded(child: GridView.builder(
            physics: BouncingScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:3,mainAxisSpacing: 8,crossAxisSpacing: 8,mainAxisExtent: 250), itemBuilder: (BuildContext context, index){
         return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                                   Image.asset(imgP5,width: 200,height: 150,fit: BoxFit.cover,),
                                     
                                     "Laptop 4GB/64GB".text.fontFamily(semibold).color(darkFontGrey).make(),
                                     10.heightBox,
                                     "\$600".text.color(redColor).fontFamily(bold).size(16).make()
                        ],).box.white.margin(EdgeInsets.symmetric(horizontal: 4))
                        .roundedSM.outerShadow.padding(EdgeInsets.all(12)).make()
                        .onTap((){
                          controller.getSubCategories(categoriesList[index].toString());
                        Get.to(()=>Itemsdetails(title: "Dummies List"));});

          }))
        ],
      ),
    ));
  }
}