import 'package:eapp/common_widget.dart/bg_Widget.dart';
import 'package:eapp/consts/consts.dart';
import 'package:eapp/consts/lists.dart';
import 'package:eapp/controller/products_controller.dart';
import 'package:eapp/views/category_screen/categoriesDetails.dart';
import 'package:get/get.dart';
class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller=Get.put(ProductsController());
    return bgWidget(Scaffold(
      appBar: AppBar(centerTitle: true,title:Category.text.white.make()),
      body: Column(children: [
       
           GridView.builder(
            itemCount: 9,
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,mainAxisSpacing: 8,crossAxisSpacing: 8,mainAxisExtent: 200,), itemBuilder: (BuildContext context,index){
           return 
              
                Column(
                children: [
                  Image.asset(
                  height: 120,width: 200,
                fit: BoxFit.cover,
                             
                    categoryImages[index]),
                    10.heightBox,
                    categoriesList[index].text.semiBold.color(darkFontGrey).align(TextAlign.center).make()
                ],
                             ).box.white.rounded.clip(Clip.antiAlias).
                             outerShadowSm.make().onTap((){
                controller.getSubCategories(categoriesList[index]);
                    Get.to(()=>Categoriesdetails(categoriesList[index].toString()));
                
                       
                             }
                           
              );
          }),
        
      ],),
    ));
  }
}