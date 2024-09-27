
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:organic_food_app/Provider/Productprovider.dart';
import 'package:organic_food_app/Screens/Auth/signup.dart';
import 'package:organic_food_app/Screens/Splash/splash.dart';
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
        home: Splash_Screen(),
      ),
    );
  }
}
