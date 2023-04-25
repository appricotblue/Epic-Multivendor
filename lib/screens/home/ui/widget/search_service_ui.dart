import 'package:epic_multivendor/apis/api_endpoints.dart';
import 'package:epic_multivendor/helper/helper_color.dart';
import 'package:epic_multivendor/helper/helper_images.dart';
import 'package:epic_multivendor/helper/model/user_model.dart';
import 'package:epic_multivendor/helper/widgets/common_list.dart';
import 'package:epic_multivendor/helper/widgets/common_search_bar.dart';
import 'package:epic_multivendor/helper/widgets/common_service_list.dart';
import 'package:epic_multivendor/screens/home/home_provider.dart';
import 'package:epic_multivendor/screens/service/service_details/service_details.dart';
import 'package:epic_multivendor/screens/wishlist/wishlist_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class SearchServiceUI extends StatefulWidget {
  const SearchServiceUI({super.key});

  @override
  State<SearchServiceUI> createState() => _SearchServiceUIState();
}

class _SearchServiceUIState extends State<SearchServiceUI> {
  var userModel = Get.find<UserModel>();
  TextEditingController controller = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    HomeProvider homeProvider = context.watch<HomeProvider>();
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
            color: AppColors.secondaryBlue,
          )
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            CommonSearchBar(
              hintText: "Search Service",
              controller: controller,
              onPressed: () {
                Future.microtask(() {
                  context.read<HomeProvider>().searchServiceFUNC(
                      userId: userModel.userId,
                      lat: userModel.lat,
                      lng: userModel.lng,
                      location: userModel.placeName,
                      searchKey: controller.text,
                      categoryId: userModel.serviceCategoryId
                  );
                });
              },
            ),
            const SizedBox(
              height: 20,
            ),
            homeProvider.searchServiceModel?.services?.length == null ||
            homeProvider.searchServiceModel?.services?.length == 0 ?
            Center(child: Image.asset(AppAssetsImages.noService1)):
            GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 220.0,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
              ),
              itemCount: homeProvider.searchServiceModel?.services?.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, i) {
                return CommonListServiceWidget(
                  image:"${ApiEndPoints.imageBaseURL}${homeProvider.searchServiceModel?.services?[i].image}",
                  title:homeProvider.searchServiceModel?.services?[i].title ??"",
                  type: homeProvider.searchServiceModel?.services?[i].serviceType ??"",
                  location: homeProvider.searchServiceModel?.services?[i].shopLocation ??"",
                  iconData:homeProvider.searchServiceModel?.services?[i].isWishlist == false?
                  InkWell(
                    onTap: (){
                      Provider.of<WishListProvider>(context,listen: false).addServiceWishList(
                        context,
                        userId: userModel.userId,
                        serviceId: homeProvider.searchServiceModel?.services?[i].id
                      ).then((value) =>  Future.microtask(() {
                        context.read<HomeProvider>().searchServiceFUNC(
                          userId: userModel.userId,
                          lat: userModel.lat,
                          lng: userModel.lng,
                          location: userModel.placeName,
                          searchKey: controller.text,
                          categoryId: userModel.serviceCategoryId
                        );
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
                          serviceId: homeProvider.searchServiceModel?.services?[i].id
                      ).then((value) =>  Future.microtask(() {
                        context.read<HomeProvider>().searchServiceFUNC(
                          userId: userModel.userId,
                          lat: userModel.lat,
                          lng: userModel.lng,
                          location: userModel.placeName,
                          searchKey: controller.text,
                          categoryId: userModel.serviceCategoryId
                        );
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
                      serviceId: homeProvider.searchServiceModel?.services?[i].id.toString()
                    );
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const ServiceDetails(),));
                  },
                );
              }
            )
          ]),
        )
      ),
    );
  }
}