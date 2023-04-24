import 'package:cached_network_image/cached_network_image.dart';
import 'package:epic_multivendor/apis/api_endpoints.dart';
import 'package:epic_multivendor/helper/helper_color.dart';
import 'package:epic_multivendor/helper/helper_images.dart';
import 'package:epic_multivendor/helper/helper_shimmer.dart';
import 'package:epic_multivendor/helper/model/user_model.dart';
import 'package:epic_multivendor/screens/cart/cart.dart';
import 'package:epic_multivendor/screens/shops/shop_products/shop_product_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class CategoryProductUi extends StatefulWidget {
  const CategoryProductUi({super.key});

  @override
  State<CategoryProductUi> createState() => _CategoryProductUiState();
}

class _CategoryProductUiState extends State<CategoryProductUi> {
  var userModel = Get.find<UserModel>();
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
          actions: [
          IconButton(
            onPressed: () {
               Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const Cart(),
                ));
            },
            icon: Icon(
              Icons.shopping_bag,
              color: AppColors.primaryGreen,
            )),
        ],
      ),

      body: shopProductProvider.isLoading
          ? ShimmerLoader().shimmerProduct(context)
          : SingleChildScrollView(
            child: ListView.builder(
              itemCount: shopProductProvider.categoryProductModel?.products?.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => InkWell(
                child: Column(
                 children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    color: AppColors.white,
                    padding:const EdgeInsets.symmetric(
                      horizontal: 5,
                      vertical: 5
                    ),
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius:const BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              topLeft: Radius.circular(10),
                          ),
                          color: AppColors.scaffoldGreen,
                        ),
                        child: CachedNetworkImage(
                          imageUrl: "${ApiEndPoints.imageBaseURL}${shopProductProvider.categoryProductModel?.products?[index].featuredImageName}",
                          width: 100,
                          height: 100,
                          fit: BoxFit.fill,
                          placeholder: (context,
                                  url) =>
                              ShimmerLoader()
                                  .shimmerImageProduct(
                                      context,
                                      width: 100.0),
                          errorWidget: (context,
                                  url, error) =>
                              Image.asset(AppAssetsImages.noService1,
                            height: 100,
                            color: AppColors
                                .secondaryGreen,
                          ),
                        ),
                       ),
                      const SizedBox(
                        width: 4,
                      ),
                      ]
                    )
                  )
                 ],
                )
              )
            ),
          ),
     );
  }

  @override
  void initState() {
    Future.microtask(() {
      context
          .read<ShopProductProvider>()
          .categoryProductList(userId: userModel.userId, categoryId: userModel.catgeoryId);
    });
    super.initState();
  }
}