import 'package:epic_multivendor/helper/helper_shimmer.dart';
import 'package:epic_multivendor/helper/model/user_model.dart';
import 'package:epic_multivendor/screens/home/home_provider.dart';
import 'package:epic_multivendor/screens/home/ui/widget/animation.dart';
import 'package:epic_multivendor/screens/home/ui/widget/service.dart';
import 'package:epic_multivendor/screens/home/ui/widget/shop_ui.dart';
import 'package:epic_multivendor/screens/map/map.dart';
import 'package:epic_multivendor/screens/prime/prime.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:upgrader/upgrader.dart';
import '../../../helper/helper_color.dart';
import '../../../helper/helper_images.dart';
import '../../../helper/widgets/common_alerts.dart';

class HomeUI extends StatefulWidget {
  const HomeUI({super.key});

  @override
  State<HomeUI> createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  bool isSelected = false;
  bool isFirstTab = false;
  bool isSecondTab = false;
  int selectedIndex = 0;
  var userModel = Get.find<UserModel>();
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  

  @override
  Widget build(BuildContext context) {
    HomeProvider homeProvider = context.watch<HomeProvider>();
    print(homeProvider.placeName);
    if (homeProvider.placeName == "null" || homeProvider.lat == "") {
      return const AlertForLocationMissing();
    } else {
      return WillPopScope(
         onWillPop: () async {
         await SystemNavigator.pop();
         return true;
      },
        child: UpgradeAlert(
          upgrader: Upgrader(dialogStyle: UpgradeDialogStyle.material),
          child: Scaffold(
            backgroundColor:
                isSelected ? AppColors.scaffoldBlue : AppColors.scaffoldGreen,
            appBar: AppBar(
              backgroundColor: AppColors.white,
              elevation: 0,
              actions: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        width: 5,
                      ),
                      SvgImageGreen(AppSvgImages.greenEpic, context,
                          size: 30.0),
                      const SizedBox(
                        width: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const MapPage(),
                                ));
                          },
                          child: Container(
                            width: 200,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: const Color(0xfff6f6f6),
                            ),
                            child: TextField(
                              enabled: false,
                              decoration: InputDecoration(
                                  hintText: homeProvider.placeName ?? "",
                                  hintStyle: Theme.of(context)
                                      .textTheme
                                      .subtitle1
                                      ?.copyWith(
                                          overflow: TextOverflow.ellipsis,
                                          color: AppColors.black),
                                  prefixIcon: Icon(
                                    Icons.place,
                                    color: AppColors.primaryGreen,
                                    size: 17,
                                  ),
                                  suffixIcon: Icon(
                                    Icons.arrow_drop_down,
                                    color: AppColors.primaryGreen,
                                  ),
                                  disabledBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Prime(),
                              ));
                        },
                        child: SvgImageGreen(AppSvgImages.prime, context,
                            size: 30.0),
                      ),
                      // const SizedBox(
                      //   width: 5,
                      // ),
                      // InkWell(
                      //   onTap: () {},
                      //   child: SvgImageGreen(AppSvgImages.notification, context,
                      //       size: 30.0),
                      // ),
                      const SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
                )
              ],
            ),
            body: homeProvider.isLoading
                ? ShimmerLoader().shimmerProduct(context)
                : SingleChildScrollView(
                    child: SafeArea(
                      child: Stack(
                        children: [
                          AnimatedTab(
                            isSelected: isSelected,
                            isFirstTab: isFirstTab,
                            isSecondTab: isSecondTab,
                            firstTabTap: () {
                              setState(() {
                                isSelected = !isSelected;
                                isSecondTab = true;
                                isFirstTab = false;
                              });
                            },
                            secondTabTaP: () {
                              setState(() {
                                isSelected = !isSelected;
                                isFirstTab = true;
                                isSecondTab = false;
                              });
                              Future.microtask(() {
                                context.read<HomeProvider>().homeService(
                                    userId: userModel.userId,
                                    lat: userModel.lat,
                                    lng: userModel.lng,
                                    location: userModel.placeName);
                              });
                            },
                          ),
                          animatedRoundContainer(),
                          Padding(
                            padding: const EdgeInsets.only(top: 68.0),
                            child: isSelected
                                ? const ServiceList()
                                : const ShopList(),
                          )
                        ],
                      ),
                    ),
                  ),
          ),
        ),
      );
    }
  }

  AnimatedPositioned animatedRoundContainer() {
    return AnimatedPositioned(
      left: isSelected ? MediaQuery.of(context).size.width - 160 : 40,
      top: 17,
      duration: const Duration(milliseconds: 500),
      child: Container(
        height: 30,
        width: 30,
        decoration:
            BoxDecoration(shape: BoxShape.circle, color: AppColors.white),
        child: Center(
            child: isSelected
                ? Image.asset(AppAssetsImages.service.toString())
                : Image.asset(AppAssetsImages.product.toString())),
      ),
    );
  }

  @override
  void initState() {
    _sharedValueForLocation();
    Future.microtask(() {
      context.read<HomeProvider>().homeShop(
          userId: userModel.userId,
          lat: userModel.lat,
          lng: userModel.lng,
          location:userModel.placeName);
    });
    pushFCMtoken();
    super.initState();
  }

   void pushFCMtoken() async {
    HomeProvider provider = HomeProvider();
    String? token = await messaging.getToken();
    provider.updateDeviceToken(userId: userModel.userId,deviceToken: token);
  }

  _sharedValueForLocation() async {
    final pref = await SharedPreferences.getInstance();
      setState(() {
      userModel.updateWith(
          userId:  userModel.userId,
          placeName: pref.getString("placeName"),
          lat: pref.getString("lat"),
          lng: pref.getString("lng"));
    });
    Provider.of<HomeProvider>(context, listen: false)
        .addPlaceName(pref.getString("placeName").toString());
    Provider.of<HomeProvider>(context, listen: false)
        .addLat(pref.getString("lat").toString());
    Provider.of<HomeProvider>(context, listen: false)
        .addLng(pref.getString("lng").toString());
  }
}
