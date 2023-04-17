import 'package:epic_multivendor/helper/model/user_model.dart';
import 'package:epic_multivendor/screens/cart/cart_provider.dart';
import 'package:epic_multivendor/screens/splash/splash_provider.dart';
import 'package:epic_multivendor/screens/wishlist/wishlist_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'screens/splash/splash.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => WishListProvider(),
    ),
     ChangeNotifierProvider(
      create: (context) => CartProvider(),
    ),
     ChangeNotifierProvider(
      create: (context) => SplashProvider(),
    )
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final userModel = Get.put(UserModel());

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}
