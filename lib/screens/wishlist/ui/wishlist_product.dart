import 'package:cached_network_image/cached_network_image.dart';
import 'package:epic_multivendor/apis/api_endpoints.dart';
import 'package:epic_multivendor/helper/helper_style.dart';
import 'package:epic_multivendor/screens/common/common_details/common_details.dart';
import 'package:epic_multivendor/screens/wishlist/wishlist_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../../helper/helper_color.dart';
import '../../../helper/helper_images.dart';
import '../../../helper/helper_shimmer.dart';
import '../../../helper/model/user_model.dart';

class WishListProduct extends StatefulWidget {
  const WishListProduct({super.key});

  @override
  State<WishListProduct> createState() => _WishListProductState();
}

class _WishListProductState extends State<WishListProduct> {
  var userModel = Get.find<UserModel>();
  
  @override
  Widget build(BuildContext context) {
    WishListProvider value = context.watch<WishListProvider>();
    return value.isLoading
        ? Center(
            child: CupertinoActivityIndicator(color: AppColors.primaryGreen),
          )
        : SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${value.productWishlistModel?.wishListData?.length ?? 0} Items",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(color: AppColors.lightGrey),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  value.productWishlistModel?.wishListData?.length == 0 ||
                          value.productWishlistModel?.wishListData?.length ==
                              null
                      ? Center(
                          child: Image.asset(AppAssetsImages.noProduct1),
                        )
                      : ListView.builder(
                          itemCount:
                              value.productWishlistModel?.wishListData?.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.only(bottom: 5.0),
                                child: InkWell(
                                  onTap: (){
                                    userModel.updateWith(shopProductId: value.productWishlistModel?.wishListData?[index].id.toString());
                                    userModel.updateWith(shopProductTitle: value.productWishlistModel?.wishListData?[index].title.toString());
                                    userModel.updateWith(shopProductPrice:value.productWishlistModel?.wishListData?[index].price.toString());
                                    userModel.updateWith(shopProductImage: "${ApiEndPoints.imageBaseURL}${value.productWishlistModel?.wishListData?[index].featuredImageUrl}");
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => const CommonProductDetails(),));
                                  },
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: AppColors.white),
                                    child: Row(
                                      children: [
                                        ClipRRect(
                                          borderRadius: const BorderRadius.only(
                                              topRight: Radius.circular(10),
                                              topLeft: Radius.circular(10)),
                                          child: CachedNetworkImage(
                                            imageUrl:
                                                "${ApiEndPoints.imageBaseURL}${value.productWishlistModel?.wishListData?[index].featuredImageUrl}",
                                            width: 70,
                                            height: 70,
                                            fit: BoxFit.fill,
                                            placeholder: (context, url) =>
                                                ShimmerLoader()
                                                    .shimmerImageProduct(context,
                                                        width: 70.0),
                                            errorWidget: (context, url, error) =>
                                                Image.asset(
                                              AppAssetsImages.noService1,
                                              height: 70,
                                              color: AppColors.secondaryGreen,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              width: 230,
                                              child: Text(
                                                value
                                                        .productWishlistModel
                                                        ?.wishListData?[index]
                                                        .title ??
                                                    "",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline6
                                                    ?.copyWith(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        height: 1.445,
                                                        color: const Color(
                                                            0xff333333),
                                                        overflow: TextOverflow
                                                            .ellipsis),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 2,
                                            ),
                                            Text(
                                              "Product Id : #0000000${value.productWishlistModel?.wishListData?[index].id}",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall
                                                  ?.copyWith(
                                                      fontSize: 13,
                                                      fontWeight: FontWeight.w300,
                                                      height: 1.445,
                                                      color:
                                                          const Color(0x99363636),
                                                      overflow:
                                                          TextOverflow.ellipsis),
                                            ),
                                            const SizedBox(
                                              height: 2,
                                            ),
                                            Text(
                                              "$rupees${value.productWishlistModel?.wishListData?[index].price ?? ""}",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall
                                                  ?.copyWith(
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.w600,
                                                      height: 1.445,
                                                      color:
                                                          AppColors.primaryGreen,
                                                      overflow:
                                                          TextOverflow.ellipsis),
                                            ),
                                          ],
                                        ),
                                        const Spacer(),
                                        IconButton(
                                            onPressed: () {
                                              value.removeProductWishList(context,
                                                userId: userModel.userId,
                                                productId: value.productWishlistModel?.wishListData?[index].id
                                              );
                                                
                                              setState(() {
                                                context.read<WishListProvider>().wishListProduct(userId: userModel.userId);
                                              });
                                            },
                                            icon: Container(
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                        color:
                                                            AppColors.lightGrey)),
                                                child: Icon(
                                                  Icons.close_rounded,
                                                  size: 15,
                                                  color: AppColors.lightGrey,
                                                )))
                                      ],
                                    ),
                                  ),
                                ),
                              ))
                ],
              ),
            ),
          );
  }
}
