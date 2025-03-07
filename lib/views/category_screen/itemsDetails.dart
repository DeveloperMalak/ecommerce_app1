import 'package:eapp/common_widget.dart/our_Button.dart';
import 'package:eapp/consts/consts.dart';
import 'package:eapp/consts/lists.dart';
import 'package:eapp/controller/products_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Itemsdetails extends StatelessWidget {
  final String? title;
  const Itemsdetails({required this.title});

  @override
  Widget build(BuildContext context) {
    var controller=Get.find<ProductsController>();
    return Scaffold(
        backgroundColor: lightGrey,
        appBar: AppBar(
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
                          itemCount: 3,
                          itemBuilder: (BuildContext context, index) {
                            return Image.asset(
                              imgFc5,
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
                        onRatingUpdate: (value) {},
                        normalColor: textfieldGrey,
                        selectionColor: golden,
                        count: 5,
                        size: 25,
                        stepInt: true,
                      ),
                      10.heightBox,
                      "\$30,000"
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
                              "In House Brands"
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
                          )
                        ],
                      )
                          .box
                          .color(textfieldGrey)
                          .height(60)
                          .padding(EdgeInsets.symmetric(horizontal: 16))
                          .make(),
                      20.heightBox,
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
                                    3,
                                    (index) => VxBox()
                                        .size(
                                          40,
                                          40,
                                        )
                                        .roundedFull
                                        .margin(
                                            EdgeInsets.symmetric(horizontal: 4))
                                        .color(Vx.randomPrimaryColor)
                                        .make()),
                              ),
                               
                            ],
                          ).box.padding(EdgeInsets.all(8)).make(),
                          Row(
                            children: [
                              SizedBox(
                                width: 100,
                                child:
                                    "Color:".text.color(textfieldGrey).make(),
                              ),
                              Row(
                                children: [IconButton(onPressed: (){}, icon:Icon(Icons.remove)),
                                "0".text.size(16).color(darkFontGrey).fontFamily(bold).make(),
                                IconButton(onPressed: (){}, icon: Icon(Icons.add)),
                                10.widthBox,
                                "(0 available)".text.color(fontGrey).make()
                                ],
                              ),
                              
                        ],
                      ).box.white.shadowSm.make(),
                      Row(
                            children: [
                              SizedBox(
                                width: 100,
                                child:
                                    "Total:".text.color(textfieldGrey).make(),
                              ),
                             "\$0.00".text.fontFamily(bold).size(16).color(redColor).make()
                              
                        ],
                      ).box.white.shadowSm.make(),
                        ]).box.white.shadowSm.make(),
                    10.heightBox,
                "Description".text.color(darkFontGrey).fontFamily(semibold).make(),
                  10.heightBox,
            "This is Dummy item and this is very good item very short in market kjsdj k ksd kjsk kjsklsd kjlsjlk ".text.color( darkFontGrey).fontFamily(semibold).make()
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
              child: ourButton(() {}, redColor, whiteColor, "Add to Cart",),
            )
          ]
          )
          );
  }
}
