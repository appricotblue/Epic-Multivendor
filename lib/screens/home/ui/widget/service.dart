import 'package:cached_network_image/cached_network_image.dart';
import 'package:epic_multivendor/helper/model/user_model.dart';
import 'package:epic_multivendor/screens/home/ui/widget/search_services.dart';
import 'package:epic_multivendor/screens/service/service_details/service_details.dart';
import 'package:epic_multivendor/screens/wishlist/wishlist_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../../apis/api_endpoints.dart';
import '../../../../helper/helper_color.dart';
import '../../../../helper/helper_images.dart';
import '../../../../helper/helper_shimmer.dart';
import '../../../../helper/widgets/common_search_bar.dart';
import '../../../../helper/widgets/common_service_list.dart';
import '../../../service/category_service/category_service.dart';
import '../../home_provider.dart';

class ServiceList extends StatefulWidget {
  const ServiceList({super.key});

  @override
  State<ServiceList> createState() => _ServiceListState();
}

class _ServiceListState extends State<ServiceList> {
  var userModel = Get.find<UserModel>();
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    HomeProvider homeProvider = context.watch<HomeProvider>();
    return  homeProvider.isLoading
        ? ShimmerLoader().shimmerService(context)
        : Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 5,
          ),
          // CommonSearchBar(
          //   hintText: "Search Services",
          //   controller: controller,
          //   onPressed: (){
          //           Future.microtask(() {
          //       context.read<HomeProvider>().homeSearchServiceFUNC(
          //           userId: userModel.userId,
          //           lat: userModel.lat,
          //           lng: userModel.lng,
          //           location: userModel.placeName,
          //           searchKey: controller.text
          //           );
          //     });
          //   },
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
                  controller: controller,
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
            height: 10,
          ),
          homeProvider.homeServiceListModel?.serviceBanners?.length == 0 ||
              homeProvider.homeServiceListModel?.serviceBanners?.length == null?Container():
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: CachedNetworkImage(
              imageUrl: "${ApiEndPoints.imageBaseURL}${homeProvider.homeServiceListModel?.serviceBanners?[0].imageName}",
              width: double.infinity,
              height: 150,
              fit: BoxFit.fill,
              placeholder: (context, url) => ShimmerLoader().shimmerImageProduct(
                context,
                width: double.infinity,
              ),
              errorWidget: (context, url, error) => Image.asset(
                AppAssetsImages.noProduct1,
                color: AppColors.primaryBlue,
                height: 150,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
            child: Text(
              "Top Categories",
              style: Theme.of(context).textTheme.bodyText1?.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    height: 1.445,
                    color: AppColors.primaryBlue,
                  ),
            ),
          ),
          homeProvider.homeServiceListModel?.serviceCategories?.length == 0 ||
              homeProvider.homeServiceListModel?.serviceCategories?.length == null ?
         Center(child: Image.asset(AppAssetsImages.noService1),):
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Container(
              padding: const EdgeInsets.fromLTRB(5, 20, 2, 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                              mainAxisExtent: 140.0,
                  mainAxisSpacing: 1,
                  crossAxisSpacing: 10,
                ),
                itemCount: homeProvider.homeServiceListModel?.serviceCategories?.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, i) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 3),
                    child: InkWell(
                      onTap: () {
                        userModel.updateWith(
                          serviceCategoryId: homeProvider.homeServiceListModel?.serviceCategories?[i].id.toString(),
                          serviceCategoryName: homeProvider.homeServiceListModel?.serviceCategories?[i].types,
                          serviceCategoryImage:  "${ApiEndPoints.imageBaseURL}${homeProvider.homeServiceListModel?.serviceCategories?[i].imageName}"
                        );
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const CateroryService(),));
                      },
                      child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 20),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(7),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0x26000000),
                                  offset: Offset(0, 0),
                                  blurRadius: 4,
                                ),
                              ],
                            ),
                            child: Center(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: CachedNetworkImage(
                                  imageUrl: "${ApiEndPoints.imageBaseURL}${homeProvider.homeServiceListModel?.serviceCategories?[i].imageName}",
                                  width: double.infinity,
                                  height: 40,
                                  fit: BoxFit.fill,
                                  placeholder: (context, url) => ShimmerLoader()
                                      .shimmerImageService(context, width: 58.25),
                                  errorWidget: (context, url, error) =>
                                      Image.asset(
                                    AppAssetsImages.noService1,
                                    height: 70,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                              homeProvider.homeServiceListModel?.serviceCategories?[i].types ?? "",
                            style:
                                Theme.of(context).textTheme.bodyText1?.copyWith(
                                                fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      height: 1.445,
                                      color: const Color(0xff444444),
                                      
                                    ),
                                          textAlign: TextAlign.center
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
            child: Text(
              'Top Services',
              style: Theme.of(context).textTheme.bodyText1?.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    height: 1.445,
                    color: AppColors.primaryBlue,
                  ),
            ),
          ),
          homeProvider.homeServiceListModel?.services?.length == 0 ||
              homeProvider.homeServiceListModel?.services?.length == null ?
          Center(child: Image.asset(AppAssetsImages.noService1),):
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 225.0,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
            ),
            itemCount:  homeProvider.homeServiceListModel?.services?.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, i) {
              return CommonListServiceWidget(
                image:  "${ApiEndPoints.imageBaseURL}${homeProvider.homeServiceListModel?.services?[i].image}",
                title: homeProvider.homeServiceListModel?.services?[i].title ?? "",
                type: homeProvider.homeServiceListModel?.services?[i].serviceType,
                location: homeProvider.homeServiceListModel?.services?[i].shopLocation,
                ratingViews: "2.4k",
                price: homeProvider.homeServiceListModel?.services?[i].price ?? "0",
                iconData:homeProvider.homeServiceListModel?.services?[i].isWishlist == false?
                InkWell(
                  onTap: (){
                    Provider.of<WishListProvider>(context,listen: false).addServiceWishList(
                      context,
                      userId: userModel.userId,
                      serviceId: homeProvider.homeServiceListModel?.services?[i].id
                    ).then((value) =>  Future.microtask(() {
                      context.read<HomeProvider>().homeService(
                          userId: userModel.userId,
                          lat: userModel.lat,
                          lng:userModel.lng,
                          location:userModel.placeName);
                    }));
                  },
                  child: Icon(
                    Icons.favorite_border,
                    color: AppColors.primaryBlue,
                  ),
                ):
                    InkWell(
                      onTap: (){
                        Provider.of<WishListProvider>(context,listen: false).removeServiceWishList(
                          context,
                            userId: userModel.userId,
                            serviceId: homeProvider.homeServiceListModel?.services?[i].id
                        ).then((value) =>  Future.microtask(() {
                          context.read<HomeProvider>().homeService(
                              userId: userModel.userId,
                              lat: userModel.lat,
                              lng:userModel.lng,
                              location:userModel.placeName);
                        }));
                      },
                      child:
                      Icon(
                        Icons.favorite,
                        color: AppColors.primaryBlue,
                      ),
                    ),
                onTap: () {
                  userModel.updateWith(
                      serviceId: homeProvider.homeServiceListModel?.services?[i].id.toString()
                  );
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ServiceDetails(),));
                },
              );
            },
          )
        ],
      ),
    );
  }
}
