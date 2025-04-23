import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eapp/common_widget.dart/bg_Widget.dart';
import 'package:eapp/common_widget.dart/our_Button.dart';
import 'package:eapp/consts/consts.dart';
import 'package:eapp/controller/cart_controller.dart';
import 'package:eapp/controller/products_controller.dart';
import 'package:eapp/services/firestore_services.dart';
import 'package:get/get.dart';
class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller=Get.find<ProductsController>();
    var  cartController=Get.put(CartController());
    return bgWidget(Scaffold(
      backgroundColor: whiteColor,
   appBar: AppBar(
    automaticallyImplyLeading: false,
    title:"Shopping Cart".text.color(darkFontGrey).fontFamily(semibold).make()
   ),

      body:StreamBuilder(
        stream: FirestoreServices.getCart(currentuser!.uid),
         builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshots){
      if(!snapshots.hasData){
return Center(child: CircularProgressIndicator(),);
      }else if(snapshots.data!.docs.isEmpty){
        return Center(
          child: "is empty".text.color(darkFontGrey).make()
        );
      }else{
        var data=snapshots.data!.docs;
        cartController.calculate(data);
        return  Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (BuildContext context,index){
                   return ListTile(
                    leading: Image.network(data[index]["img"]),
                    title: "${data[index]["title"]+ " X["+data[index]["qty"].toString()+"]"}".text.fontFamily(semibold).make(),
                    subtitle: "${data[index]["tprice"]}".numCurrencyWithLocale().text.color(redColor).make(),
                   trailing: InkWell(
                    onTap: (){
                    cartController.deleteCart(data[index].id);
                    },
                    child: Icon(Icons.delete_outline,color: redColor,)),
                  
                   );
                }),
             
              ),
            ),
            10.heightBox,
            Obx(()=>
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  "total price".text.fontFamily(semibold).color(darkFontGrey).make(),
                  "${cartController.totalp}".numCurrencyWithLocale().text.fontFamily(semibold).color(redColor).make(),
                  
                ],
              ).box.padding(EdgeInsets.all(12)).width(context.screenWidth-60).color(lightgolden).rounded.make(),
            ),
            10.heightBox,
            SizedBox(width: context.screenWidth-60,
            
            child: ourButton((){}, redColor, whiteColor, "Proceed to Shipping"),)
          ],
        ),
      );
      }

      })
    ));
  }
}