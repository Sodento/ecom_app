import 'package:ecomm_app/consts/consts.dart';
import 'package:ecomm_app/views/splash_screen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // we are using getX so we have to change this material app into getmaterialapp
    return GetMaterialApp(
      title: appname,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.transparent,
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: darkFontGrey),
          //to set app bar icons color
          backgroundColor: Colors.transparent,
          //set elevation to 0
          elevation: 0.0,
        ),
        fontFamily: regular,
      ),
      home: const SplashScreen(),
    );
  }
}
