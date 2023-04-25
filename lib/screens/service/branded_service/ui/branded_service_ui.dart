import 'package:cached_network_image/cached_network_image.dart';
import 'package:epic_multivendor/apis/api_endpoints.dart';
import 'package:epic_multivendor/helper/helper_color.dart';
import 'package:epic_multivendor/helper/widgets/common_search_bar.dart';
import 'package:epic_multivendor/helper/widgets/common_view_all.dart';
import 'package:epic_multivendor/screens/service/service_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../../helper/helper_images.dart';
import '../../../../helper/helper_shimmer.dart';
import '../../../../helper/helper_style.dart';
import '../../../../helper/model/user_model.dart';
import '../../../../helper/widgets/common_service_list.dart';
import '../../../wishlist/wishlist_provider.dart';
import '../../service_details/service_details.dart';

class BrandedServicesUI extends StatefulWidget {
  const BrandedServicesUI({super.key});

  @override
  State<BrandedServicesUI> createState() => _BrandedServicesUIState();
}

class _BrandedServicesUIState extends State<BrandedServicesUI> {
  var userModel = Get.find<UserModel>();
  @override
  Widget build(BuildContext context) {
    ServiceProvider serviceProvider = context.watch<ServiceProvider>();
    return Scaffold(
      backgroundColor: AppColors.scaffoldBlue,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: AppColors.primaryBlue,
            )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 5,
              ),
              Container(
                color: AppColors.white,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(10),
                                topLeft: Radius.circular(10)),
                            child: CachedNetworkImage(
                              imageUrl: "",
                              width: double.infinity,
                              height: 200,
                              fit: BoxFit.fill,
                              placeholder: (context, url) => ShimmerLoader()
                                  .shimmerImageService(context, width: 200.0),
                              errorWidget: (context, url, error) => Image.asset(
                                AppAssetsImages.noService1,
                                height: 200,
                              ),
                            ),
                          ),
                          Positioned(
                              right: 20,
                              child: Card(
                                elevation: 10,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                child: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Icon(
                                      Icons.favorite_outline,
                                      color: AppColors.primaryBlue,
                                    )),
                              ))
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Text(
                                "Women Embroidered Pink Kurta",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5
                                    ?.copyWith(
                                        height: 1.445,
                                        overflow: TextOverflow.ellipsis,
                                        fontWeight: FontWeight.bold),
                              ),
                            ),
                            Text(
                              "Kalhara",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                      height: 1.445,
                                      overflow: TextOverflow.ellipsis,
                                      color: AppColors.lightGrey),
                            ),
                            Row(
                              children: [
                                Text(
                                  '$rupees 300',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      ?.copyWith(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w900,
                                          height: 1.445,
                                          color: AppColors.primaryGreen),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'MRP $rupees 300',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        height: 1.445,
                                        decoration: TextDecoration.lineThrough,
                                        color: const Color(0xff7a7a7a),
                                        decorationColor:
                                            const Color(0xff7a7a7a),
                                      ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            // Row(
                            //   children: [
                            //     RatingBar.builder(
                            //       initialRating: 3,
                            //       minRating: 1,
                            //       itemSize: 14,
                            //       direction: Axis.horizontal,
                            //       allowHalfRating: true,
                            //       itemCount: 5,
                            //       itemPadding: const EdgeInsets.symmetric(
                            //           horizontal: 1.0),
                            //       itemBuilder: (context, _) => const Icon(
                            //         Icons.star,
                            //         size: 10,
                            //         color: Colors.amber,
                            //       ),
                            //       onRatingUpdate: (rating) {},
                            //     ),
                            //     const SizedBox(
                            //       height: 3,
                            //     ),
                            //     Text(
                            //       "520 Rating",
                            //       style: Theme.of(context)
                            //           .textTheme
                            //           .bodySmall
                            //           ?.copyWith(color: AppColors.primaryGreen),
                            //     ),
                            //   ],
                            // ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // const SizedBox(
              //   height: 5,
              // ),
              // CommonSearchBar(
              //   hintText: "Search Service",
              // ),
              
              const SizedBox(
                height: 5,
              ),
              CommonViewAllWithTitle(
                title: "All Services",
                color: AppColors.primaryBlue,
                viewAll: "",
              ),
              const SizedBox(
                height: 5,
              ),
              serviceProvider.brandedServiceModel?.services?.length == 0 ||
                      serviceProvider.brandedServiceModel?.services?.length ==
                          null
                  ? Center(
                      child: Image.asset(AppAssetsImages.noService1),
                    )
                  : GridView.builder(
                      padding: const EdgeInsets.only(top: 10),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 225.0,
                        mainAxisSpacing: 5,
                        crossAxisSpacing: 5,
                      ),
                      itemCount:
                          serviceProvider.brandedServiceModel?.services?.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, i) {
                        return CommonListServiceWidget(
                          image:
                              "${ApiEndPoints.imageBaseURL}${serviceProvider.brandedServiceModel?.services?[i].image}",
                          title: serviceProvider
                                  .brandedServiceModel?.services?[i].title ??
                              "",
                          type: "kakkanad",
                          ratingViews: "2.4k",
                          price: serviceProvider
                                  .brandedServiceModel?.services?[i].price ??
                              "",
                          iconData: serviceProvider.brandedServiceModel
                                      ?.services?[i].isWishlist ==
                                  false
                              ? InkWell(
                                  onTap: () {
                                    Provider.of<WishListProvider>(context,
                                            listen: false)
                                        .addServiceWishList(context,
                                            userId: userModel.userId,
                                            serviceId: serviceProvider
                                                .brandedServiceModel
                                                ?.services?[i]
                                                .id)
                                        .then((value) => Future.microtask(() {
                                              context
                                                  .read<ServiceProvider>()
                                                  .brandServiceFUNC(
                                                      userId: userModel.userId,
                                                      brandedId: userModel
                                                          .serviceBrandId);
                                            }));
                                  },
                                  child: Icon(
                                    Icons.favorite_outline,
                                    color: AppColors.primaryBlue,
                                  ),
                                )
                              : InkWell(
                                  onTap: () {
                                    Provider.of<WishListProvider>(context,
                                            listen: false)
                                        .removeServiceWishList(context,
                                            userId: userModel.userId,
                                            serviceId: serviceProvider
                                                .brandedServiceModel
                                                ?.services?[i]
                                                .id)
                                        .then((value) => Future.microtask(() {
                                              context
                                                  .read<ServiceProvider>()
                                                  .brandServiceFUNC(
                                                      userId: userModel.userId,
                                                      brandedId: userModel
                                                          .serviceBrandId);
                                            }));
                                  },
                                  child: Icon(
                                    Icons.favorite,
                                    color: AppColors.primaryBlue,
                                  ),
                                ),
                          onTap: () {
                            userModel.updateWith(
                                serviceId: serviceProvider
                                    .brandedServiceModel?.services?[i].id
                                    .toString());
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ServiceDetails(),
                                ));
                          },
                        );
                      },
                    )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    Future.microtask(() {
      context.read<ServiceProvider>().brandServiceFUNC(
          userId: userModel.userId, brandedId: userModel.serviceBrandId);
    });
    super.initState();
  }
}
