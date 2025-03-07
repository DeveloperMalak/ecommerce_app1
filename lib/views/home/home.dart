import 'package:eapp/consts/consts.dart';
import 'package:eapp/controller/home_controller.dart';
import 'package:eapp/views/cart_screen/cartscreen.dart';
import 'package:eapp/views/category_screen/category_screen.dart';
import 'package:eapp/views/home/homescreen.dart';
import 'package:eapp/views/profile_screen/profile_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var controller=Get.put(HomeController());
    var navbaritem=[
      BottomNavigationBarItem(icon: Image.asset(icHome,width: 26,),label: home),
       BottomNavigationBarItem(icon: Image.asset(icCategories,width: 26,),label: Category),
        BottomNavigationBarItem(icon: Image.asset(icCart,width: 26,),label: cart),
         BottomNavigationBarItem(icon: Image.asset(icProfile,width: 26,),label: account),
    ];

    var navbody=[
      Homescreen(),
      CategoriesScreen(),
      CartScreen(),
      ProfileScreen()
    ];
    return Scaffold(
      body: Column(
        children: [
          Obx(()=> Expanded(child: navbody.elementAt(controller.currentNavIndex.value))),
        ],
      ),
      bottomNavigationBar: Obx(
       ()=>  BottomNavigationBar(items: navbaritem,
        selectedItemColor: redColor,
        currentIndex: controller.currentNavIndex.value,
        selectedLabelStyle:TextStyle(fontFamily: semibold) ,
        type: BottomNavigationBarType.fixed,
        onTap: (value){
          controller.currentNavIndex.value=value;
        },
        backgroundColor: whiteColor,),
      ),
    );
  }
}