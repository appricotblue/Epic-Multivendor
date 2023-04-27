import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:epic_multivendor/apis/api_endpoints.dart';
import 'package:epic_multivendor/helper/helper_color.dart';
import 'package:epic_multivendor/helper/widgets/common_search_bar.dart';
import 'package:epic_multivendor/helper/widgets/common_view_all.dart';
import 'package:epic_multivendor/screens/category/category_product.dart';
import 'package:epic_multivendor/screens/common/common_shopProduct/ui/search_products.dart';
import 'package:epic_multivendor/screens/common/common_shopProduct/ui/widget/new_collection.dart';
import 'package:epic_multivendor/screens/common/common_shopProduct/ui/widget/popular_collection.dart';
import 'package:epic_multivendor/screens/common/common_shopProduct/ui/widget/product_for_you.dart';
import 'package:epic_multivendor/screens/shops/shop_products/shop_product_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../../helper/helper_images.dart';
import '../../../../helper/helper_shimmer.dart';
import '../../../../helper/model/user_model.dart';
import '../../../../helper/widgets/common_screen_product_list.dart';



class FashionShopProductUI extends StatefulWidget {
  const FashionShopProductUI({super.key});

  @override
  State<FashionShopProductUI> createState() => _CommonShopProductUIState();
}

class _CommonShopProductUIState extends State<FashionShopProductUI> {
  var userModel = Get.find<UserModel>();
  TextEditingController controller = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    ShopProductProvider shopProductProvider = context.watch<ShopProductProvider>();
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
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              userModel.shopName ?? "",
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(color: AppColors.primaryGreen),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              userModel.shopCategoryType ?? "",
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: AppColors.primaryGreen),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // RatingBar.builder(
                //   initialRating: 3,
                //   minRating: 1,
                //   itemSize: 14,
                //   direction: Axis.horizontal,
                //   allowHalfRating: true,
                //   itemCount: 5,
                //   itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                //   itemBuilder: (context, _) => const Icon(
                //     Icons.star,
                //     size: 10,
                //     color: Colors.amber,
                //   ),
                //   onRatingUpdate: (rating) {},
                // ),
                // const SizedBox(
                //   height: 3,
                // ),
                // Text(
                //   "520 Rating",
                //   style: Theme.of(context)
                //       .textTheme
                //       .bodySmall
                //       ?.copyWith(color: AppColors.primaryGreen),
                // ),
              ],
            ),
          )
        ],
      ),
      body:shopProductProvider.isLoading?ShimmerLoader().shimmerProduct(context):
      SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              // CommonSearchBar(
              //   hintText: "Search Products",
              // ),

              InkWell(
                onTap: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context) => SearchProducts()));
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
                      hintText: "Search Products",
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
                height: 10,
              ),

              shopProductProvider.shopProductListModel?.categories?.length == 0 ||
                  shopProductProvider.shopProductListModel?.categories?.length == null ?
              Center(
                child: Image.asset(AppAssetsImages.noProduct1),
              ):
              SizedBox(
                height: 140,
                child: ListView.builder(
                  itemCount:  shopProductProvider.shopProductListModel?.categories?.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: (){
                                  userModel.updateWith(catgeoryId:shopProductProvider.shopProductListModel?.categories?[index].id.toString());
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => const CategoryProduct(),));
                                },
                              child: Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.white,
                                 image: DecorationImage(
                                  image: NetworkImage("${ApiEndPoints.imageBaseURL}${shopProductProvider.shopProductListModel?.categories?[index].imageName}"),
                                  fit: BoxFit.fill,
                            
                                 )
                                ),
                               
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              shopProductProvider.shopProductListModel?.categories?[index].category ?? "",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(color: AppColors.primaryGreen),
                            ),
                          ],
                        ),
                      )),
              ),
            
              const SizedBox(
                height: 5,
              ),

              carousel(
                  shopProductProvider.shopProductListModel?.banners?.map((e) =>
                  e.image == null? carouselSliderImage(
                    "https://www.freeiconspng.com/thumbs/no-image-icon/no-image-icon-6.png"):
                    carouselSliderImage("${ApiEndPoints.imageBaseURL}${e.image}")).toList()
              ),
              
              const SizedBox(
                height: 5,
              ),
             
              
             const CommonNewCollection(),
            //  const CommonPopularCollection(),
             // const CommonProductForYouCollection()
            ],
          ),
        ),
      ),
    );
  }
  @override
  void initState() {
    Future.microtask(() {
      context.read<ShopProductProvider>().shopProductList(
          userId: userModel.userId,
          shopId:userModel.shopId
      );
    });
    super.initState();
  }

  Widget carousel(items) {
    return CarouselSlider(
      items: items,
      options: CarouselOptions(
          height: 175,
          
          enlargeCenterPage: true,
          autoPlay: true,
          aspectRatio: 3 / 20,
          autoPlayCurve: Curves.fastOutSlowIn,
          enableInfiniteScroll: true,
          autoPlayAnimationDuration: Duration(milliseconds: 800)),
    );
  }

  Widget carouselSliderImage(networkImage) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(20),
    child: Container(
  
      margin: const EdgeInsets.all(6),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          
          image: DecorationImage(
              image: NetworkImage(networkImage), fit: BoxFit.fill)),
    ),
  );
}

}
