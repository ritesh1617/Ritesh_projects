import 'package:f2c/Provider/Productprovider.dart';
import 'package:f2c/Screens/Auth/Login.dart';
import 'package:f2c/Screens/Auth/home2.dart';
import 'package:f2c/Screens/Auth/signup.dart';
import 'package:f2c/Screens/HomeScreen.dart';
import 'package:f2c/Screens/Splash/splash.dart';
import 'package:f2c/widgets/Gridview.dart';
import 'package:f2c/widgets/Productaddscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Ensures the binding is initialized

  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductProvider(),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: SignupPage(),
      ),
    );
  }
}
