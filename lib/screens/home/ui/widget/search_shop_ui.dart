import 'package:epic_multivendor/apis/api_endpoints.dart';
import 'package:epic_multivendor/helper/helper_color.dart';
import 'package:epic_multivendor/helper/helper_images.dart';
import 'package:epic_multivendor/helper/model/user_model.dart';
import 'package:epic_multivendor/helper/widgets/common_list.dart';
import 'package:epic_multivendor/helper/widgets/common_search_bar.dart';
import 'package:epic_multivendor/screens/home/home_provider.dart';
import 'package:epic_multivendor/screens/shops/shop_products/shop_product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class SearchShopUI extends StatefulWidget {
  const SearchShopUI({super.key});

  @override
  State<SearchShopUI> createState() => _SearchShopUIState();
}

class _SearchShopUIState extends State<SearchShopUI> {
  var userModel = Get.find<UserModel>();
  TextEditingController controller = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    HomeProvider homeProvider = context.watch<HomeProvider>();
    return Scaffold(
      backgroundColor: AppColors.scaffoldGreen,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.primaryGreen,
          )
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            CommonSearchBar(
              hintText: "Search Shops",
              controller: controller,
              onPressed: () {
                Future.microtask(() {
                  context.read<HomeProvider>().searchShopFUNC(
                      userId: userModel.userId,
                      lat: userModel.lat,
                      lng: userModel.lng,
                      location: userModel.placeName,
                      searchKey: controller.text
                      );
                });
              },
            ),
            const SizedBox(
              height: 20,
            ),
            homeProvider.searchShopModel?.shopData?.length == null ||
            homeProvider.searchShopModel?.shopData?.length == 0 ?
            Center(child: Image.asset(AppAssetsImages.noProduct1)):
            GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 220.0,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
              ),
              itemCount: homeProvider.searchShopModel?.shopData?.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, i) {
                return CommonListWidget(
                  image:"${ApiEndPoints.imageBaseURL}${homeProvider.searchShopModel?.shopData?[i].image}",
                  title:homeProvider.searchShopModel?.shopData?[i].name ??"",
                  type: homeProvider.searchShopModel?.shopData?[i].shopType ??"",
                  location: homeProvider.searchShopModel?.shopData?[i].location ??"",

                  onTap: () {
                    userModel.updateWith(
                        shopId:
                            "${homeProvider.searchShopModel?.shopData?[i].id}");
                            
                    userModel.updateWith(
                        shopName:
                            "${homeProvider.searchShopModel?.shopData?[i].name}");
                    userModel.updateWith(
                        categoryType:
                            "${homeProvider.searchShopModel?.shopData?[i].shopType}");
                            
                    userModel.updateWith(
                        shopImage:
                            "${ApiEndPoints.imageBaseURL}${homeProvider.searchShopModel?.shopData?[i].image}");
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ShopProduct(),
                        ));
                  },
                );
              }
            )
          ]),
        )
      ),
    );
  }
}