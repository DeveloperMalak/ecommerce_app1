import 'package:eapp/common_widget.dart/our_Button.dart';
import 'package:eapp/consts/consts.dart';
import 'package:eapp/consts/lists.dart';
import 'package:eapp/controller/products_controller.dart';
import 'package:eapp/views/chat_screen/chat_screen.dart';
import 'package:get/get.dart';

class Itemsdetails extends StatelessWidget {
  final String? title;
  dynamic data;
  Itemsdetails({required this.title,required this.data});

  @override
  Widget build(BuildContext context) {
    var controller=Get.find<ProductsController>();
   
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: ()async{
        controller.resetValue();
        return true;

      },
      child: Scaffold(
          backgroundColor: lightGrey,
          appBar: AppBar(
            leading: IconButton(onPressed: (){
              controller.resetValue();
              Get.back();
            }, icon: Icon(Icons.arrow_back)),
            title: title!.text.color(darkFontGrey).fontFamily(bold).make(),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.share,
                    color: darkFontGrey,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite_outline,
                    color: darkFontGrey,
                  ))
            ],
          ),
          body: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        VxSwiper.builder(
                            autoPlay: true,
                            height: 350,
                            aspectRatio: 16 / 9,
                            itemCount: data["p_imgs"].length,
                            viewportFraction: 0.8,
                            itemBuilder: (BuildContext context, index){
                              return Image.network(
                                data["p_imgs"][index],
                                width: double.infinity,
                                fit: BoxFit.cover,
                              );
                            }),
                        10.heightBox,
                        title!.text
                            .size(16)
                            .color(darkFontGrey)
                            .fontFamily(semibold)
                            .make(),
                        10.heightBox,
                        VxRating(
                          value: double.parse(data["p_rating"]),
                          onRatingUpdate: (value) {},
                          normalColor: textfieldGrey,
                          selectionColor: golden,
                          count: 5,
                          size: 25,
                          maxRating: 5,
                        ),
                        10.heightBox,
                        "${data["p_price"]}".numCurrencyWithLocale()
                            .text
                            .color(redColor)
                            .fontFamily(bold)
                            .size(18)
                            .make(),
                        10.heightBox,
                        Row(
                          children: [
                            Expanded(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                "Seller".text.white.fontFamily(semibold).make(),
                                5.heightBox,
                                "${data["p_sellers"]}"
                                    .text
                                    .white
                                    .fontFamily(semibold)
                                    .size(16)
                                    .color(darkFontGrey)
                                    .make()
                              ],
                            )),
                            CircleAvatar(
                              backgroundColor: whiteColor,
                              child: Icon(
                                Icons.message_rounded,
                                color: darkFontGrey,
                              ),
                            ).onTap((){
                              // chatcont.getChatId();
                              Get.to(()=>ChatScreen(),
                              
                              arguments: [data["p_sellers"],data["vendor_id"]]);
                            })
                          ],
                        )
                            .box
                            .color(textfieldGrey)
                            .height(60)
                            .padding(EdgeInsets.symmetric(horizontal: 16))
                            .make(),
                        20.heightBox,
                        Obx(()=>
                           Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 100,
                                    child:
                                        "Color:".text.color(textfieldGrey).make(),
                                  ),
                                  Row(
                                    children: List.generate(
                                        data["p_colors"].length,
                                        (index) => Stack(
                                          alignment: Alignment.center,
                                          children:[ VxBox()
                                              .size(
                                                40,
                                                40,
                                              )
                                              .roundedFull
                                              .margin(
                                                  EdgeInsets.symmetric(horizontal: 4))
                                              .color(Color(data["p_colors"][index]))
                                              .make().onTap((){
                                                controller.changeColorindex(index);
                                              }),
                                              Visibility(
                                                visible:index==controller.colorindex.value ,
                                                child: Icon(Icons.check,color: Colors.white,))
                                ])),
                                  ),
                                   
                                ],
                              ).box.padding(EdgeInsets.all(8)).make(),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 100,
                                    child:
                                        "Quantity:".text.color(textfieldGrey).make(),
                                  ),
                                  Obx(()=>
                                     Row(
                                      children: [IconButton(onPressed: (){
                                        controller.decreaseQuantity();
                                        controller.calculatetotalPrice(int.parse(data["p_price"]));
                                      }, icon:Icon(Icons.remove)),
                                      "${controller.quantity.value}".text.size(16).color(darkFontGrey).fontFamily(bold).make(),
                                      IconButton(onPressed: (){
                                         
                                        controller.increaseQuantity(int.parse(data["p_quantity"]));
                                        controller.calculatetotalPrice(int.parse(data["p_price"]));
                                      }, icon: Icon(Icons.add)),
                                      10.widthBox,
                                      "${data["p_quantity"]} available".text.color(fontGrey).make()
                                      ],
                                    ),
                                  ),
                                  
                            ],
                          ).box.white.shadowSm.make(),
                         
                           Obx(()=>
                              Row(
                                    children: [
                                      SizedBox(
                                        width: 100,
                                        child:
                                            "Total:".text.color(textfieldGrey).make(),
                                      ),
                                     "${controller.totatlPrice.value}".numCurrency.text.fontFamily(bold).size(16).color(redColor).make()
                                      
                                ],
                              ).box.white.shadowSm.make(),
                           ),
                          
                            ]).box.white.shadowSm.make(),
                        ),
                      10.heightBox,
                  "Description".text.color(darkFontGrey).fontFamily(semibold).make(),
                    10.heightBox,
              "${data["p_desc"]} ".text.color( darkFontGrey).fontFamily(semibold).make()
             ,
             10.heightBox,
             ListView(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: List.generate(itemsList.length, (index)=>ListTile(
                title: "${itemsList[index]}".text.color(darkFontGrey).fontFamily(semibold).make(),
             trailing: Icon(Icons.arrow_forward),
              )),
             ),
             20.heightBox,
             productyoumaylike.text.size(16).fontFamily(bold).color(darkFontGrey).make(),
             10.heightBox,
             //copied this widget orm home screen.dart
              SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(children: List.generate(3, (index)=>Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                                     Image.asset(imgP1,width: 150,fit: BoxFit.cover,),
                                       10.heightBox,
                                       "Laptop 4GB/64GB".text.fontFamily(semibold).color(darkFontGrey).make(),
                                       10.heightBox,
                                       "\$600".text.color(redColor).fontFamily(bold).size(16).make()
                          ],).box.margin(EdgeInsets.symmetric(horizontal: 4)).roundedSM.padding(EdgeInsets.all(8)).make()),),
                        )
            ],
            )
            )
            )
            ),
       SizedBox(
                width: double.infinity,
                height: 60,
                child: ourButton(() {
                  controller.addToCart(
                     title: data["p_name"],
                       img: data["p_imgs"][0],
                    sellername: data["p_sellers"],
                  color: data["p_colors"][0],
                  qty: controller.quantity.value,
                   price:controller.totatlPrice.value,
                   context:context,
                 
                
                  
                  
                  );
                }, redColor, whiteColor, "Add to Cart",),
              )
            ]
            )
            ),
    );
  }
}
