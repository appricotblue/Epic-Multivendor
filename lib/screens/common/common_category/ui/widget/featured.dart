import 'package:epic_multivendor/screens/common/common_shopProduct/common_shopProduct.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../../../../apis/api_endpoints.dart';
import '../../../../../helper/helper_images.dart';
import '../../../../../helper/model/user_model.dart';
import '../../../../../helper/widgets/common_list.dart';
import '../../../../../helper/widgets/common_view_all.dart';
import '../../../../shops/shop_category/shop_category_provider.dart';

class CommonFeaturedUI extends StatefulWidget {
  const CommonFeaturedUI({super.key});

  @override
  State<CommonFeaturedUI> createState() => _CommonFeaturedUIState();
}

class _CommonFeaturedUIState extends State<CommonFeaturedUI> {
  var userModel = Get.find<UserModel>();
  @override
  Widget build(BuildContext context) {
    ShopCategoryProvider shopCategoryProvider = context.watch<ShopCategoryProvider>();
    return Column(
      children: [
        CommonViewAllWithTitle(
          title: "Featured ${userModel?.shopCategoryType}",
          viewAll: "View All",
          onTap: () {},
        ),
        const SizedBox(
          height: 5,
        ),
        shopCategoryProvider.shopCategoryModel?.shopData?.length == 0 ||
            shopCategoryProvider.shopCategoryModel?.shopData?.length == null ?
        Center(child: Image.asset(AppAssetsImages.noProduct1)):
        GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 240.0,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
          ),
          itemCount: shopCategoryProvider.shopCategoryModel?.shopData?.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, i) {
            return CommonListWidget(
              image: "${ApiEndPoints.imageBaseURL}${shopCategoryProvider.shopCategoryModel?.shopData?[i].image}",
              title: shopCategoryProvider.shopCategoryModel?.shopData?[i].name ?? "",
              type:shopCategoryProvider.shopCategoryModel?.shopData?[i].shopType ?? "",
              location:shopCategoryProvider.shopCategoryModel?.shopData?[i].location ?? "",
              ratingViews: "2.4k",
              onTap: (){
                userModel.updateWith(shopId: "${shopCategoryProvider.shopCategoryModel?.shopData?[i].id}");
                userModel.updateWith(shopName: "${shopCategoryProvider.shopCategoryModel?.shopData?[i].name}");
                Navigator.push(context, MaterialPageRoute(builder: (context) => const CommonShopProduct(),));
              },
            );
          },
        ),
        const SizedBox(
          height: 5,
        ),
      ],
    );
  }
}
