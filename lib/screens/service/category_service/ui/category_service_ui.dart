import 'package:cached_network_image/cached_network_image.dart';
import 'package:epic_multivendor/apis/api_endpoints.dart';
import 'package:epic_multivendor/helper/helper_color.dart';
import 'package:epic_multivendor/helper/widgets/common_search_bar.dart';
import 'package:epic_multivendor/helper/widgets/common_view_all.dart';
import 'package:epic_multivendor/screens/home/ui/widget/search_services.dart';
import 'package:epic_multivendor/screens/service/branded_service/branded_service.dart';
import 'package:epic_multivendor/screens/service/service_details/service_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../../helper/helper_images.dart';
import '../../../../helper/helper_shimmer.dart';
import '../../../../helper/model/user_model.dart';
import '../../../../helper/widgets/common_service_details.dart';
import '../../../../helper/widgets/common_service_list.dart';
import '../../../../helper/widgets/common_top_brand.dart';
import '../../../home/home_provider.dart';
import '../../../wishlist/wishlist_provider.dart';
import '../../service_provider.dart';

class CategoryServiceUI extends StatefulWidget {
  const CategoryServiceUI({super.key});

  @override
  State<CategoryServiceUI> createState() => _CategoryServiceUIState();
}

class _CategoryServiceUIState extends State<CategoryServiceUI> {
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
      body:serviceProvider.isLoading?
          ShimmerLoader().shimmerService(context):
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
                    color: AppColors.primaryBlue),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(10),
                          topLeft: Radius.circular(10)),
                      child: CachedNetworkImage(
                        imageUrl: userModel.serviceCategoryImage.toString(),
                        width: 50,
                        height: 50,
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
                      width: 5,
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
                            text: userModel.serviceCategoryName ?? "",
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
                height: 7,
              ),
              // CommonSearchBar(
              //   hintText: "Search Service",
              // ),
              InkWell(
                onTap: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context) => const SearchServices()));
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
                      // controller: controller,
                      decoration: InputDecoration(
                      hintText: "Search Services",
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
              const SizedBox(
                height: 5,
              ),
              CommonViewAllWithTitle(
                title: "Top Brand",
                viewAll: "View All",
                color: AppColors.primaryBlue,
              ),
              const SizedBox(
                height: 5,
              ),
              serviceProvider.categoryServiceModel?.brands?.length == 0 ||
                  serviceProvider.categoryServiceModel?.brands?.length == null?
                  Center(child: Image.asset(AppAssetsImages.noService1),):
              SizedBox(
                height: 170,
                child: ListView.builder(
                  itemCount: serviceProvider.categoryServiceModel?.brands?.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return CommonTopBrandServices(
                      image: "${ApiEndPoints.imageBaseURL}${serviceProvider.categoryServiceModel?.brands?[index].image}",
                      title:serviceProvider.categoryServiceModel?.brands?[index].brandName ?? "",
                      ratingViews: "2.4k",
                      iconData: Icon(
                        Icons.favorite,
                        color: AppColors.primaryBlue,
                      ),
                      onTap: () {
                        userModel.updateWith(
                          serviceBrandId: serviceProvider.categoryServiceModel?.brands?[index].id.toString()
                        );
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const BrandedService(),));
                      },
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              CommonViewAllWithTitle(
                title: "Featured Services",
                viewAll: "View All",
                color: AppColors.primaryBlue,
              ),
              const SizedBox(
                height: 5,
              ),
              serviceProvider.categoryServiceModel?.services?.length == 0 ||
                  serviceProvider.categoryServiceModel?.services?.length == null?
              Center(child: Image.asset(AppAssetsImages.noService1),):
              GridView.builder(
                padding: const EdgeInsets.only(top: 10),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 225.0,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                ),
                itemCount: serviceProvider.categoryServiceModel?.services?.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, i) {
                  return CommonListServiceWidget(
                    image: "${ApiEndPoints.imageBaseURL}${serviceProvider.categoryServiceModel?.services?[i].image}",
                    title:serviceProvider.categoryServiceModel?.services?[i].title ?? "",
                    type: serviceProvider.categoryServiceModel?.services?[i].serviceType ?? "",
                    location: serviceProvider.categoryServiceModel?.services?[i].shopLocation ?? "",
                    ratingViews: "2.4k",
                    price: serviceProvider.categoryServiceModel?.services?[i].price ?? "",
                    iconData: serviceProvider.categoryServiceModel?.services?[i].isWishlist ==
                        false
                        ? InkWell(
                      onTap: () {
                        Provider.of<WishListProvider>(context,
                            listen: false)
                            .addServiceWishList(
                              context,
                            userId: userModel.userId,
                            serviceId: serviceProvider.categoryServiceModel?.services?[i].id)
                            .then((value) => Future.microtask(() {
                          context.read<ServiceProvider>().categoryServiceFUNC(
                              userId: userModel.userId,
                              categoryId: userModel.serviceCategoryId
                            // categoryId:
                          );
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
                            .removeServiceWishList(
                              context,
                            userId: userModel.userId,
                            serviceId: serviceProvider.categoryServiceModel?.services?[i].id)
                            .then((value) => Future.microtask(() {
                          context.read<ServiceProvider>().categoryServiceFUNC(
                              userId: userModel.userId,
                              categoryId: userModel.serviceCategoryId
                            // categoryId:
                          );
                        }));
                      },
                      child: Icon(
                        Icons.favorite,
                        color: AppColors.primaryBlue,
                      ),
                    ),
                    onTap: () {
                      userModel.updateWith(
                          serviceId: serviceProvider.categoryServiceModel?.services?[i].id.toString()
                      );
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const ServiceDetails(),));
                    },
                  );
                },
              ),
              const SizedBox(
                height: 5,
              ),
              // CommonViewAllWithTitle(
              //   title: "WithinKm Services",
              //   viewAll: "View All",
              //   color: AppColors.primaryBlue,
              // ),
              // const SizedBox(
              //   height: 5,
              // ),
              // GridView.builder(
              //   padding: const EdgeInsets.only(top: 10),
              //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              //     crossAxisCount: 2,
              //     mainAxisExtent: 225.0,
              //     mainAxisSpacing: 5,
              //     crossAxisSpacing: 5,
              //   ),
              //   itemCount: 4,
              //   shrinkWrap: true,
              //   physics: const NeverScrollableScrollPhysics(),
              //   itemBuilder: (context, i) {
              //     return CommonListServiceWidget(
              //       image: "",
              //       title: "titile",
              //       type: "kakkanad",
              //       ratingViews: "2.4k",
              //       price: "900",
              //       iconData: Icon(
              //         Icons.favorite,
              //         color: AppColors.primaryBlue,
              //       ),
              //       onTap: () {
              //         Navigator.push(context, MaterialPageRoute(builder: (context) => const ServiceDetails(),));
              //       },
              //     );
              //   },
              // )
            ],
          ),
        ),
      ),
    );
  }
  @override
  void initState() {
    Future.microtask(() {
      context.read<ServiceProvider>().categoryServiceFUNC(
          userId: userModel.userId,
          categoryId: userModel.serviceCategoryId
          // categoryId:
      );
    });
    super.initState();
  }
}
