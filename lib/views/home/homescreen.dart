import 'package:eapp/common_widget.dart/homebuttons.dart';
import 'package:eapp/consts/consts.dart';
import 'package:eapp/consts/lists.dart';
import 'package:eapp/views/home/components/featuredCategories.dart';
class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color:lightGrey,
      padding:const EdgeInsets.all(12),
      height: context.screenHeight,
      width: context.screenWidth,
      child: SafeArea(child: Column(children: [
        Container(
          height: 60,
          alignment: Alignment.center,

          color: lightGrey,
          child: TextFormField(
            decoration: InputDecoration(
              border: InputBorder.none,
              fillColor: whiteColor,
               filled:true,
               suffixIcon: Icon(Icons.search),
               hintText: search,
               hintStyle: TextStyle(color: textfieldGrey)
            ),
          ),
        ),
        10.heightBox,
       Expanded(
         child: SingleChildScrollView(
           child: Column(children: [
             VxSwiper.builder(
              aspectRatio: 16/9,
              autoPlay: true,
              height: 190,
              enlargeCenterPage: true,
              itemCount: brandList.length, itemBuilder: (context,index){
              return  Image.asset(brandList[index],fit:BoxFit.fill)
              .box.rounded.clip(Clip.antiAlias).margin(EdgeInsets.symmetric(horizontal: 8)).make();
            }),
            10.heightBox,
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(2,(index)=> homeButton(
              context.screenHeight*0.15,
              context.screenWidth*0.4, 
              index==0?icTodaysDeal:icFlashDeal,
              index==0?todayDeal:flashSale,
              (){}
              
            )),),
            5.heightBox,
           
             VxSwiper.builder(
              aspectRatio: 16/9,
              autoPlay: true,
              height: 190,
              enlargeCenterPage: true,
              itemCount: secondSliderList.length, itemBuilder: (context,index){
              return  Image.asset(secondSliderList[index],fit:BoxFit.fill)
              .box.rounded.clip(Clip.antiAlias).margin(EdgeInsets.symmetric(horizontal: 8)).make();
              
            }),
            10.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(3,(index)=>homeButton(
              context.screenHeight*0.12, context.screenWidth/3.5,
               index==0?icTopCategories:index==1?icBrands:icTopSeller, 
               index==0?topCategories:index==1?brand:topSellers, (){})),),
               10.heightBox,
           
               Align(
                alignment:Alignment.centerLeft,
                 child:featuredCategories.text.color(darkFontGrey).size(18).fontFamily(semibold).make()),
                  20.heightBox,
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(children: List.generate(3,(index)=> Column(children: [
                      featuredButton(featuredTitle1[index],featuredImage1[index],),
                      10.heightBox,
                      featuredButton(featuredTitle2[index],featuredImage2[index],),
                    
                    ],))),
                  ),
             
//Featured products
             Container( 
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                featuredProducts.text.white.fontFamily(bold).size(18).make(),
                  10.heightBox,
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
                        ],).box.white.margin(EdgeInsets.symmetric(horizontal: 4)).roundedSM.padding(EdgeInsets.all(8)).make()),),
                      )
              ],),
              decoration: BoxDecoration(
                color: redColor,
               
              ),
             ),
             20.heightBox,
             VxSwiper.builder(
              aspectRatio: 16/9,
              autoPlay: true,
              height: 190,
              enlargeCenterPage: true,
              itemCount: secondSliderList.length, itemBuilder: (context,index){
              return  Image.asset(secondSliderList[index],fit:BoxFit.fill)
              .box.rounded.clip(Clip.antiAlias).margin(EdgeInsets.symmetric(horizontal: 8)).make();
              
            }),
            20.heightBox,
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 6,
              gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 8,crossAxisSpacing: 8,mainAxisExtent: 300),itemBuilder: (context,index){
              return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                                   Image.asset(imgP5,width: 200,height: 200,fit: BoxFit.cover,),
                                     const Spacer(),
                                     "Laptop 4GB/64GB".text.fontFamily(semibold).color(darkFontGrey).make(),
                                     10.heightBox,
                                     "\$600".text.color(redColor).fontFamily(bold).size(16).make()
                        ],).box.white.margin(EdgeInsets.symmetric(horizontal: 4)).roundedSM.padding(EdgeInsets.all(12)).make();
            }, )
                 ],
                 ),
         ),
       )
      ],)),
      
      
      );
  }
}