import 'dart:developer';

import 'package:epic_multivendor/helper/helper_images.dart';
import 'package:epic_multivendor/screens/bottom/bottom_nav.dart';
import 'package:epic_multivendor/screens/login/login.dart';
import 'package:epic_multivendor/screens/otp/otp.dart';
import 'package:epic_multivendor/screens/splash/splash_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../helper/model/user_model.dart';
import '../../profile/profile_provider.dart';

class SplashUI extends StatefulWidget {
  const SplashUI({super.key});

  @override
  State<SplashUI> createState() => _SplashUIState();
}

class _SplashUIState extends State<SplashUI> {
  var userModel = Get.find<UserModel>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AppAssetsImages.splash), fit: BoxFit.fill)),
        child: Center(
          child: SvgImage(AppSvgImages.epic, context, size: 100.0),
        ),
      ),
    );
  }

  _sharedValueForLocation() async {
    final pref = await SharedPreferences.getInstance();
    setState(() {
      userModel.updateWith(
          userId: pref.getString("userId"),
          placeName: pref.getString("placeName"),
          lat: pref.getString("lat"),
          lng: pref.getString("lng"));
    });
    log("USERID ###############  ${userModel.userId}");
    if (userModel.userId != null) {
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const BottomBarScreen(),));
      });
    } else {
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const Login(),));
      });
    }
  }

  @override
  void initState() {
    _sharedValueForLocation();
     Future.microtask(() {
      context.read<SplashProvider>().mySettingsFUNC(userModel.userId);
    });
    super.initState();
  }
}
