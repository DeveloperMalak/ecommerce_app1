import 'package:eapp/views/splashscreen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'consts/consts.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: appname,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.transparent,
        appBarTheme: const AppBarTheme(backgroundColor:Colors.transparent),
        fontFamily: regular
      ),
      home: SplashScreen(),
    );
  }
}
