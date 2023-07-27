import 'package:cached_network_image/cached_network_image.dart';
import 'package:epic_multivendor/apis/api_endpoints.dart';
import 'package:epic_multivendor/helper/widgets/common_search_bar.dart';
import 'package:epic_multivendor/screens/common/common_category/common_category.dart';
import 'package:epic_multivendor/screens/fashion/fashion_category/fashion_category.dart';
import 'package:epic_multivendor/screens/home/home_provider.dart';
import 'package:epic_multivendor/screens/home/ui/widget/search_shops.dart';
import 'package:epic_multivendor/screens/service/service_details/service_details.dart';
import 'package:epic_multivendor/screens/shops/shop_category/shop_category.dart';
import 'package:epic_multivendor/screens/shops/shop_details/shop_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../../../helper/helper_color.dart';
import '../../../../helper/helper_images.dart';
import '../../../../helper/helper_shimmer.dart';
import '../../../../helper/model/user_model.dart';
import '../../../../helper/widgets/common_list.dart';
import '../../../shops/shop_products/shop_product.dart';

class ShopList extends StatefulWidget {
  const ShopList({super.key});

  @override
  State<ShopList> createState() => _ShopListState();
}

class _ShopListState extends State<ShopList> {
  String? selectedValue;
  var userModel = Get.find<UserModel>();
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    HomeProvider homeProvider = context.watch<HomeProvider>();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 5,
          ),

          InkWell(
            onTap: (){
               Navigator.push(context,MaterialPageRoute(builder: (context) => SearchShop()));
            },
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              decoration: BoxDecoration(
                color: AppColors.white, 
                borderRadius: BorderRadius.circular(10)
              ),
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
                onPressed: (){
          
                }, 
                icon: const Icon(Icons.search)),
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none),
              ),
            )),
          ),
          // CommonSearchBar(
          //   hintText: "Search Shops",
          //   controller: controller,
          //   onPressed: () {
          //     Future.microtask(() {
          //       context.read<HomeProvider>().homeSearchShopFUNC(
          //           userId: userModel.userId,
          //           lat: userModel.lat,
          //           lng: userModel.lng,
          //           location: userModel.placeName,
          //           searchKey: controller.text
          //           );
          //     });
          //   },
          // ),
          const SizedBox(
            height: 10,
          ),
          homeProvider.homeShopListModel?.shopBanners?.length == 0 ||
                  homeProvider.homeShopListModel?.shopBanners?.length == null
              ? Container()
              : ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: CachedNetworkImage(
                    imageUrl:
                        "${ApiEndPoints.imageBaseURL}${homeProvider.homeShopListModel?.shopBanners?[0]}",
                    width: double.infinity,
                    height: 150,
                    fit: BoxFit.fill,
                    placeholder: (context, url) =>
                        ShimmerLoader().shimmerImageProduct(
                      context,
                      width: double.infinity,
                    ),
                    errorWidget: (context, url, error) => Image.asset(
                      AppAssetsImages.noProduct1,
                      color: AppColors.primaryGreen,
                      height: 150,
                    ),
                  ),
                ),
          const SizedBox(
            height: 5,
          ),
          homeProvider.homeShopListModel?.shopTypes?.length == null ||
                  homeProvider.homeShopListModel?.shopTypes?.length == 0
              ? Container()
              : Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                  child: Text(
                    "Top Categories",
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          height: 1.445,
                          color: const Color(0xff272727),
                        ),
                  ),
                ),
          homeProvider.homeShopListModel?.shopTypes?.length == null ||
                  homeProvider.homeShopListModel?.shopTypes?.length == 0
              ? Container()
              : Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(5, 10, 2, 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        // mainAxisExtent: 100.0,
                        mainAxisExtent: 140.0,
                        mainAxisSpacing: 1,
                        crossAxisSpacing: 1,
                      ),
                      itemCount:
                          homeProvider.homeShopListModel?.shopTypes?.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, i) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 3),
                          child: InkWell(
                            onTap: () {
                              userModel.updateWith(
                                  categoryTypeId:
                                      "${homeProvider.homeShopListModel?.shopTypes?[i].id}");
                              userModel.updateWith(
                                  categoryType:
                                      "${homeProvider.homeShopListModel?.shopTypes?[i].type}");
                              userModel.updateWith(
                                  categoryTypeImage:
                                      "${ApiEndPoints.imageBaseURL}${homeProvider.homeShopListModel?.shopTypes?[i].imageName}");
                              if (homeProvider
                                      .homeShopListModel?.shopTypes?[i].type ==
                                  "Restaurants") {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const ShopCategory(),
                                    ));
                              }
                              else if (homeProvider
                                      .homeShopListModel?.shopTypes?[i].type ==
                                  "Fashion") {
                                     Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const FashionCategory(),
                                    ));
                                  }
                               else {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const CommonCategory(),
                                    ));
                              }
                            },
                            child: SizedBox(
                              width: 100,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 60,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColors.secondaryGreen,
                                      image: DecorationImage(
                                        image: NetworkImage("${ApiEndPoints.imageBaseURL}${homeProvider.homeShopListModel?.shopTypes?[i].imageName}")
                                      )
                                    ),
                                    
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    homeProvider.homeShopListModel
                                            ?.shopTypes?[i].type ??
                                        "",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        ?.copyWith(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          height: 1.445,
                                          color: const Color(0xff444444),
                                        ),
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
            child: Row(
              children: [
                Text(
                  'Popular ',
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        height: 1.445,
                        color: const Color(0xff272727),
                      ),
                ),
                const SizedBox(width: 15.0),

                /// DROP-DOWN
                // Container(
                //   height: 40,
                //   padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                //   decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(10),
                //       border: Border.all(
                //         color: const Color(0xff272727),
                //       )),
                //   child: DropdownButton<String>(
                //     hint: const Text("Select an option"),
                //     underline: Container(
                //       color: AppColors.white,
                //     ),
                //     value: selectedValue,
                //     onChanged: (newValue) {
                //       setState(() {
                //         selectedValue = newValue;
                //       });
                //     },
                //     items: <String>['Optionssssss 1', 'Option 2', 'Option 3']
                //         .map<DropdownMenuItem<String>>((String value) {
                //       return DropdownMenuItem<String>(
                //         value: value,
                //         child: Text(
                //           value,
                //           style:
                //               Theme.of(context).textTheme.bodyText1?.copyWith(
                //                     fontSize: 16,
                //                     fontWeight: FontWeight.w400,
                //                     height: 1.445,
                //                     color: const Color(0xff018636),
                //                   ),
                //         ),
                //       );
                //     }).toList(),
                //   ),
                // ),
              ],
            ),
          ),
          homeProvider.homeShopListModel?.shopData?.length == null ||
                  homeProvider.homeShopListModel?.shopData?.length == 0
              ? Center(child: Image.asset(AppAssetsImages.noProduct1))
              : GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 220.0,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                  ),
                  itemCount: homeProvider.homeShopListModel?.shopData?.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, i) {
                    return CommonListWidget(
                      image:
                          "${ApiEndPoints.imageBaseURL}${homeProvider.homeShopListModel?.shopData?[i].image}",
                      title:
                          homeProvider.homeShopListModel?.shopData?[i].name ??
                              "",
                      type: homeProvider
                              .homeShopListModel?.shopData?[i].shopType ??
                          "",
                      location: homeProvider
                              .homeShopListModel?.shopData?[i].location ??
                          "",
                      ratingViews: "2.4k",
                      onTap: () {
                        userModel.updateWith(
                            shopId:
                                "${homeProvider.homeShopListModel?.shopData?[i].id}");
                                
                        userModel.updateWith(
                            shopName:
                                "${homeProvider.homeShopListModel?.shopData?[i].name}");
                        userModel.updateWith(
                            categoryType:
                                "${homeProvider.homeShopListModel?.shopData?[i].shopType}");
                                
                        userModel.updateWith(
                            shopImage:
                                "${ApiEndPoints.imageBaseURL}${homeProvider.homeShopListModel?.shopData?[i].image}");
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ShopProduct(),
                            ));
                      },
                    );
                  },
                )
        ],
      ),
    );
  }
}
