import 'package:cached_network_image/cached_network_image.dart';
import 'package:epic_multivendor/screens/fashion/fashion_category/featured_fashion_shop.dart';
import 'package:epic_multivendor/screens/home/ui/widget/search_shops.dart';
import 'package:epic_multivendor/screens/shops/shop_category/shop_category_provider.dart';
import 'package:epic_multivendor/screens/shops/shop_category/ui/widget/featured_shop.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../../../helper/helper_color.dart';
import '../../../../helper/helper_images.dart';
import '../../../../helper/helper_shimmer.dart';
import '../../../../helper/model/user_model.dart';
import '../../../../helper/widgets/common_search_bar.dart';

class FashionCategoryUI extends StatefulWidget {
  const FashionCategoryUI({super.key});

  @override
  State<FashionCategoryUI> createState() => _FashionCategoryUIState();
}

class _FashionCategoryUIState extends State<FashionCategoryUI> {
  var userModel = Get.find<UserModel>();
  @override
  Widget build(BuildContext context) {
    ShopCategoryProvider shopCategoryProvider = context.watch<ShopCategoryProvider>();
    TextEditingController controller = TextEditingController();
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
            )),
        title: Text(
          userModel?.shopCategoryType ?? "",
          style: Theme.of(context)
              .textTheme
              .headline6
              ?.copyWith(color: AppColors.primaryGreen),
        ),
      ),
      body:shopCategoryProvider.isLoading?ShimmerLoader().shimmerProduct(context):
      SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.primaryGreen),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius:  BorderRadius.circular(10),
                      child: CachedNetworkImage(
                        imageUrl: userModel.shopCategoryTypeImage.toString(),
                        width: 40,
                        height: 40,
                        fit: BoxFit.fill,
                        placeholder: (context, url) => ShimmerLoader()
                            .shimmerImageProduct(context, width: 50.0),
                        errorWidget: (context, url, error) => Image.asset(
                          AppAssetsImages.noService1,
                          height: 50,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                 
                    RichText(
                      text: TextSpan(
                        style: Theme.of(context).textTheme.headline6?.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                              height: 1.5,
                              color: AppColors.white,
                            ),
                        children: [
                          const TextSpan(
                            text: 'Shop from ',
                          ),
                          TextSpan(
                            text: userModel?.shopCategoryType ?? "",
                            style:
                                Theme.of(context).textTheme.headline6?.copyWith(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      height: 1.5,
                                      color: AppColors.white,
                                    ),
                          ),
                          const TextSpan(
                            text: ' Around you!',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),

              /// SEARCH BAR
              ///
              ///
              ///
              ///#############################################################################################
              // CommonSearchBar(
              //   hintText: "Search Shops",
              // ),

              InkWell(
                onTap: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context) => SearchShop()));
                },
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  decoration: BoxDecoration(
                    color: AppColors.white, borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: TextField(
                      enabled: false,
                      controller: controller,
                      decoration: InputDecoration(
                      hintText: "Search Shops",
                      border: InputBorder.none,
                      hintStyle: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            height: 1.445,
                            color: const Color(0xffa4a4a4),
                          ),
                        suffixIcon: IconButton(
                            onPressed: (){}, icon: const Icon(Icons.search)),
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none),
                  ),
                )),
              ),
              const SizedBox(
                height: 5,
              ),
              const FashionShopFeaturedUI(),
              // const ShopWithinKMUI(),
              // const ShopMostRatedUI(),
              // const ShopPopularUI(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    Future.microtask(() {
      context.read<ShopCategoryProvider>().shopCategory(
          userId: userModel.userId,
          lat: userModel.lat,
          lng: userModel.lng,
          location: userModel.placeName,
          categoryTypeId: userModel.shopCategoryTypeId,
          // userId: 1,
          // categoryTypeId: "1",
          // location: "Kannur,Kerala,India",
          // lat: "11.8745",
          // lng: "75.3704"
      );
    });
    super.initState();
  }
}
