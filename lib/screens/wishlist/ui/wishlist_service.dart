import 'package:cached_network_image/cached_network_image.dart';
import 'package:epic_multivendor/apis/api_endpoints.dart';
import 'package:epic_multivendor/screens/service/service_details/service_details.dart';
import 'package:epic_multivendor/screens/wishlist/wishlist_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../../helper/helper_color.dart';
import '../../../helper/helper_images.dart';
import '../../../helper/helper_shimmer.dart';
import '../../../helper/helper_style.dart';
import '../../../helper/model/user_model.dart';

class WishListService extends StatefulWidget {
  const WishListService({super.key});

  @override
  State<WishListService> createState() => _WishListServiceState();
}

class _WishListServiceState extends State<WishListService> {
  var userModel = Get.find<UserModel>();
  @override
  Widget build(BuildContext context) {
    WishListProvider value = context.watch<WishListProvider>();
    return value.isLoading
        ? Center(
            child: CupertinoActivityIndicator(color: AppColors.primaryBlue),
          )
        : SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${value.serviceWishlistModel?.wishListData?.length ?? 0} Items",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(color: AppColors.lightGrey),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  value.serviceWishlistModel?.wishListData?.length == 0 ||
                          value.serviceWishlistModel?.wishListData?.length ==
                              null
                      ? Center(
                          child: Image.asset(AppAssetsImages.noService1),
                        )
                      : ListView.builder(
                          itemCount:
                              value.serviceWishlistModel?.wishListData?.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.only(bottom: 5.0),
                                child: InkWell(
                                  onTap: (){
                                    userModel.updateWith(
                                        serviceId: value.serviceWishlistModel?.wishListData?[index].id.toString()
                                    );
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => const ServiceDetails(),));
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
                                                "${ApiEndPoints.imageBaseURL}${value.serviceWishlistModel?.wishListData?[index].imageUrl}",
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
                                              color: AppColors.secondaryBlue,
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
                                                        .serviceWishlistModel
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
                                              "Service Id : #0000000${value.serviceWishlistModel?.wishListData?[index].id}",
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
                                              "$rupees${value.serviceWishlistModel?.wishListData?[index].price ?? ""}",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall
                                                  ?.copyWith(
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.w600,
                                                      height: 1.445,
                                                      color:
                                                          AppColors.primaryBlue,
                                                      overflow:
                                                          TextOverflow.ellipsis),
                                            ),
                                          ],
                                        ),
                                        const Spacer(),
                                        IconButton(
                                            onPressed: () {
                                              value.removeServiceWishList(context,
                                              userId: userModel.userId,
                                              serviceId: value.serviceWishlistModel?.wishListData?[index].id);
                                              setState(() {
                                                context.read<WishListProvider>().wishListServices(userId: userModel.userId);
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

  @override
  void initState() {
    Future.microtask(() {
      context
          .read<WishListProvider>()
          .wishListServices(userId: userModel.userId);
    });
    super.initState();
  }
}
