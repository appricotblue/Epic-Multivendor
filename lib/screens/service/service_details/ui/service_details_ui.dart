import 'package:cached_network_image/cached_network_image.dart';
import 'package:epic_multivendor/apis/api_endpoints.dart';
import 'package:epic_multivendor/helper/helper_color.dart';
import 'package:epic_multivendor/helper/model/user_model.dart';
import 'package:epic_multivendor/screens/bottom/bottom_nav.dart';
import 'package:epic_multivendor/screens/service/book_service/book_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../../helper/helper_images.dart';
import '../../../../helper/helper_shimmer.dart';
import '../../../../helper/helper_style.dart';
import '../../../home/home.dart';
import '../../../wishlist/wishlist_provider.dart';
import '../../service_provider.dart';

class ServiceDetailsUI extends StatefulWidget {
  const ServiceDetailsUI({super.key});

  @override
  State<ServiceDetailsUI> createState() => _ServiceDetailsUIState();
}

class _ServiceDetailsUIState extends State<ServiceDetailsUI> {
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
              Navigator.push(context, MaterialPageRoute(builder: (context) => const BottomBarScreen(),));
            },
            icon: Icon(
              Icons.arrow_back,
              color: AppColors.primaryBlue,
            )),
      ),
      body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  imageUrl:
                      "${ApiEndPoints.imageBaseURL}${serviceProvider.serviceDetailsModel?.serviceData?.image}",
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.fill,
                  placeholder: (context, url) => ShimmerLoader()
                      .shimmerImageProduct(context, width: 300.0),
                  errorWidget: (context, url, error) => Image.asset(
                    AppAssetsImages.noProduct1,
                    height: 300,
                    color: AppColors.secondaryBlue,
                  ),
                ),
              ),
            ),
            Positioned(
                right: 20,
                top: 10,
                child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      child:serviceProvider.serviceDetailsModel?.serviceData?.isWishlist == false?
                      InkWell(
                        onTap: (){
                          Provider.of<WishListProvider>(context,
                              listen: false)
                              .addServiceWishList(
                                context,
                              userId: userModel.userId,
                              serviceId: serviceProvider.serviceDetailsModel?.serviceData?.id)
                              .then((value) =>  Future.microtask(() {
                            context.read<ServiceProvider>().serviceDetailsFUNC(
                                userId: userModel.userId,
                                serviceId: userModel.serviceId
                            );
                          }));
                        },
                        child: Icon(
                          Icons.favorite_border,
                          color: AppColors.secondaryBlue,
                        ),
                      ):
                      InkWell(
                        onTap: (){
                          Provider.of<WishListProvider>(context,
                              listen: false)
                              .removeServiceWishList(
                                context,
                              userId: userModel.userId,
                              serviceId: serviceProvider.serviceDetailsModel?.serviceData?.id)
                              .then((value) =>  Future.microtask(() {
                            context.read<ServiceProvider>().serviceDetailsFUNC(
                                userId: userModel.userId,
                                serviceId: userModel.serviceId
                            );
                          }));
                        },
                        child: Icon(
                          Icons.favorite,
                          color: AppColors.secondaryBlue,
                        ),
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
                  serviceProvider.serviceDetailsModel?.serviceData?.title ?? "",
                  style: Theme.of(context).textTheme.headline5?.copyWith(
                      height: 1.445,
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                "Kalhara",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    height: 1.445,
                    overflow: TextOverflow.ellipsis,
                    color: AppColors.lightGrey),
              ),
              Row(
                children: [
                  Text(
                    '$rupees ${serviceProvider.serviceDetailsModel?.serviceData?.price}',
                    style: Theme.of(context).textTheme.headline5?.copyWith(
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
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          height: 1.445,
                          decoration: TextDecoration.lineThrough,
                          color: const Color(0xff7a7a7a),
                          decorationColor: const Color(0xff7a7a7a),
                        ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  RatingBar.builder(
                    initialRating: 3,
                    minRating: 1,
                    itemSize: 14,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      size: 10,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {},
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    "520 Rating",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: AppColors.primaryGreen),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Divider(
                color: AppColors.lightGrey,
              ),
              Text(
                "Details",
                style: Theme.of(context).textTheme.headline6?.copyWith(
                    height: 1.445,
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              _details(context, "Color", "Black"),
              _details(context, "Occassion", "Casual Wear"),
              _details(context, "Material", "Coton"),
              const SizedBox(
                height: 5,
              ),
              Text(
                "Description",
                style: Theme.of(context).textTheme.headline6?.copyWith(
                    height: 1.445,
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                serviceProvider.serviceDetailsModel?.serviceData?.description ?? "",
                style: Theme.of(context).textTheme.headline6?.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    height: 1.9444444444,
                    color: const Color(0xff333333)),
              ),
            ],
          ),
        ),
     
      ])),
      bottomNavigationBar: SizedBox(
        height: 50,
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: InkWell(
                    onTap: () {
                      userModel.updateWith(
                          serviceId: serviceProvider?.serviceDetailsModel?.serviceData?.id.toString(),
                          servicePrice: serviceProvider?.serviceDetailsModel?.serviceData?.price,
                          serviceImage: "${ApiEndPoints.imageBaseURL}${serviceProvider?.serviceDetailsModel?.serviceData?.image}",
                          serviceTitle: serviceProvider?.serviceDetailsModel?.serviceData?.title
                      );
                      debugPrint(userModel.userId);
                      debugPrint(userModel.serviceId);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const BookService(),));
                    },
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.primaryBlue),
                      child: Center(
                        child: Text(
                          "Book Service",
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    height: 1.445,
                                    color: AppColors.white,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                        ),
                      ),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }

  Widget _details(BuildContext context, title, type) {
    return Row(
      children: [
        SizedBox(
          width: 150,
          child: Text(
            title,
            style: Theme.of(context).textTheme.headline6?.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                  height: 1.9444444444,
                  color: const Color(0xff333333),
                ),
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          type,
          style: Theme.of(context).textTheme.headline6?.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                height: 1.9444444444,
                color: const Color(0xff333333),
              ),
        ),
      ],
    );
  }
  @override
  void initState() {
    Future.microtask(() {
      context.read<ServiceProvider>().serviceDetailsFUNC(
          userId: userModel.userId,
          serviceId: userModel.serviceId
      );
    });
    super.initState();
  }
}
