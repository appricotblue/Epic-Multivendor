import 'package:epic_multivendor/screens/splash/splash_provider.dart';
import 'package:epic_multivendor/screens/splash/ui/splash.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
       create: (context) => SplashProvider(),
       child:const  SplashUI(),
    );
  }
}