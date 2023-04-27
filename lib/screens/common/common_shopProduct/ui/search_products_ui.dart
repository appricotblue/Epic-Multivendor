import 'package:epic_multivendor/apis/api_endpoints.dart';
import 'package:epic_multivendor/helper/helper_color.dart';
import 'package:epic_multivendor/helper/helper_images.dart';
import 'package:epic_multivendor/helper/model/user_model.dart';
import 'package:epic_multivendor/helper/widgets/common_list.dart';
import 'package:epic_multivendor/helper/widgets/common_screen_product_list.dart';
import 'package:epic_multivendor/helper/widgets/common_search_bar.dart';
import 'package:epic_multivendor/screens/common/common_details/common_details.dart';
import 'package:epic_multivendor/screens/home/home_provider.dart';
import 'package:epic_multivendor/screens/shops/shop_products/shop_product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class SearchProductUI extends StatefulWidget {
  const SearchProductUI({super.key});

  @override
  State<SearchProductUI> createState() => _SearchProductUIState();
}

class _SearchProductUIState extends State<SearchProductUI> {
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
              hintText: "Search Products",
              controller: controller,
              onPressed: () {
                Future.microtask(() {
                  context.read<HomeProvider>().searchProductFUNC(
                      userId: userModel.userId,
                      shopId: userModel.shopId,
                      searchKey: controller.text,
                      categoryId: userModel.shopCategoryTypeId
                  );
                });
              },
            ),
            const SizedBox(
              height: 20,
            ),
           homeProvider.searchProductModel?.products?.length == 0 ||
            homeProvider.searchProductModel?.products?.length == null ?
            Center(
              child: Image.asset(AppAssetsImages.noProduct1),
            ):
            GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 260.0,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
              ),
              itemCount: homeProvider.searchProductModel?.products?.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, i) {
                return CommonScreenProductList(
                  image: "${ApiEndPoints.imageBaseURL}${homeProvider.searchProductModel?.products?[i].featuredImageName}",
                  title:homeProvider.searchProductModel?.products?[i].name ?? "",
                  type: "kakkanad",
                  price: homeProvider.searchProductModel?.products?[i].salePrice.toString() ?? "",
                  strikedPrice: homeProvider.searchProductModel?.products?[i].price.toString() ?? "",
                  onTap: (){
                    userModel.updateWith(shopProductId: homeProvider.searchProductModel?.products?[i].id.toString());
                    userModel.updateWith(shopProductTitle: homeProvider.searchProductModel?.products?[i].name.toString());
                    userModel.updateWith(shopProductPrice: homeProvider.searchProductModel?.products?[i].price.toString());
                    userModel.updateWith(shopProductImage: "${ApiEndPoints.imageBaseURL}${homeProvider.searchProductModel?.products?[i].featuredImageName}");
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const CommonProductDetails(),));
                  },
                );
              },
            ),
          ]),
        )
      ),
    );
  }
}