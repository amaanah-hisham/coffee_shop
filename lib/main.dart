
import 'package:coffee_shop/pages/cart_page.dart';
import 'package:coffee_shop/pages/home_page.dart';
import 'package:coffee_shop/pages/profile_page.dart';
import 'package:coffee_shop/pages/promotions_page.dart';
import 'package:coffee_shop/pages/register_page.dart';
import 'package:coffee_shop/pages/settings_page.dart';
import 'package:coffee_shop/pages/home_content_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/cart.dart';
import 'pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (Context)=> Cart(),
      builder: (context, child)=> MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      routes: {
        '/login_page': (context) => LoginPage(),
        '/homepage': (context) => HomePage(),
        '/homecontenet': (context) => HomeContentPage(),
        '/registerpage': (context) => RegisterPage(),
        '/cartpage': (context) => CartPage(),
        '/settingspage': (context) => SettingsPage(),
        '/profilepage': (context) => ProfilePage(),
        '/promotionspage': (context) => PromotionsPage(),

      },
    ),
    );
  }
}