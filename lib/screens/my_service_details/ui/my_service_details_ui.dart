

import 'package:cached_network_image/cached_network_image.dart';
import 'package:epic_multivendor/apis/api_endpoints.dart';
import 'package:epic_multivendor/helper/model/user_model.dart';
import 'package:epic_multivendor/screens/my_order&service_details/my_order_details_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../helper/helper_color.dart';
import '../../../helper/helper_images.dart';
import '../../../helper/helper_shimmer.dart';
import '../../../helper/helper_style.dart';

class MyServiceDetailsUI extends StatefulWidget {
  const MyServiceDetailsUI({super.key,this.serviceId});
  final String? serviceId;

  @override
  State<MyServiceDetailsUI> createState() => _MyServiceDetailsUIState();
}

class _MyServiceDetailsUIState extends State<MyServiceDetailsUI> {
  final userModel = Get.find<UserModel>();
  @override
  Widget build(BuildContext context) {
    MyOrderDetailsProvider value = context.watch<MyOrderDetailsProvider>();
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
              color: AppColors.black,
            )),
        title: Text(
          "My Service",
          style: Theme.of(context)
              .textTheme
              .headline6
              ?.copyWith(color: AppColors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 5.0, top: 5),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                          imageUrl: "${ApiEndPoints.imageBaseURL}${value.myServiceDetailsModel?.serviceData?.image}",
                          width: 70,
                          height: 70,
                          fit: BoxFit.fill,
                          placeholder: (context, url) => ShimmerLoader()
                              .shimmerImageProduct(context, width: 70.0),
                          errorWidget: (context, url, error) => Image.asset(
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 230,
                            child: Text(
                              value.myServiceDetailsModel?.serviceData?.title ?? "",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  ?.copyWith(
                                      fontWeight: FontWeight.w500,
                                      height: 1.445,
                                      color: const Color(0xff333333),
                                      overflow: TextOverflow.ellipsis),
                            ),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Text(
                            "type: ${value.myServiceDetailsModel?.serviceData?.serviceType}",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w300,
                                    height: 1.445,
                                    color: const Color(0x99363636),
                                    overflow: TextOverflow.ellipsis),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Text(
                            "$rupees ${value.myServiceDetailsModel?.serviceData?.price}",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    height: 1.445,
                                    color: AppColors.primaryBlue,
                                    overflow: TextOverflow.ellipsis),
                          ),
                        ],
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border:
                                      Border.all(color: AppColors.lightGrey)),
                              child: Icon(
                                Icons.close_rounded,
                                size: 15,
                                color: AppColors.lightGrey,
                              )))
                    ],
                  ),
                ),
              ),
              // Container(
              //   width: MediaQuery.of(context).size.width,
              //   padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(10),
              //       color: AppColors.white),
              //   child: Row(
              //     children: [
              //       Text(
              //         "5888",
              //         style: Theme.of(context).textTheme.headline5?.copyWith(
              //             height: 1.445,
              //             fontSize:30,
              //             overflow: TextOverflow.ellipsis,
              //             fontWeight: FontWeight.bold),
              //       ),
              //       const SizedBox(
              //         width: 15,
              //       ),
              //       Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Text(
              //             "PIN for Delivery",
              //             style: Theme.of(context)
              //                 .textTheme
              //                 .headline6
              //                 ?.copyWith(
              //                     height: 1.445,
              //                     overflow: TextOverflow.ellipsis,
              //                     fontWeight: FontWeight.bold),
              //           ),
              //           SizedBox(
              //             width: MediaQuery.of(context).size.width - 100,
              //             child: Text(
              //               "Gh 11321 Building, Avenue Street,Borivili North, Mumbai , 40gggggg0 004",
              //               style: Theme.of(context)
              //                   .textTheme
              //                   .bodyMedium
              //                   ?.copyWith(
              //                     height: 1.445,
              //                   ),
              //             ),
              //           ),
              //           const SizedBox(
              //             width: 10,
              //           )
              //         ],
              //       ),
              //     ],
              //   ),
              // ),
            
              const SizedBox(
                height: 5,
              ),
              // Container(
              //   width: MediaQuery.of(context).size.width,
              //   padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(10),
              //       color: AppColors.white),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Text(
              //         "Seller Details",
              //         style: Theme.of(context).textTheme.headline6?.copyWith(
              //             height: 1.445,
              //             overflow: TextOverflow.ellipsis,
              //             fontWeight: FontWeight.bold),
              //       ),
              //       const SizedBox(
              //         height: 5,
              //       ),
              //       Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [
              //           SizedBox(
              //             width: MediaQuery.of(context).size.width - 120,
              //             child: Text(
              //               "Gh 11321 Building, Avenue Street,Borivili North, Mumbai , 40gggggg0 004",
              //               style: Theme.of(context)
              //                   .textTheme
              //                   .bodyMedium
              //                   ?.copyWith(
              //                     height: 1.445,
              //                   ),
              //             ),
              //           ),
              //           Column(
              //             children: [
              //               Container(
              //                 height: 40,
              //                 width: 40,
              //                 decoration: BoxDecoration(
              //                     borderRadius: BorderRadius.circular(10),
              //                     border: Border.all(
              //                         color: AppColors.primaryBlue)),
              //                 child: Icon(
              //                   Icons.call,
              //                   color: AppColors.primaryBlue,
              //                 ),
              //               ),
              //               const SizedBox(
              //                 height: 3,
              //               ),
              //               Text(
              //                 "Call Seller",
              //                 style: Theme.of(context)
              //                     .textTheme
              //                     .bodyMedium
              //                     ?.copyWith(
              //                         height: 1.445,
              //                         color: AppColors.primaryBlue),
              //               ),
              //             ],
              //           ),
              //           const SizedBox(
              //             width: 10,
              //           )
              //         ],
              //       ),
              //       const SizedBox(
              //         height: 5,
              //       ),
              //     ],
              //   ),
              // ),
              // const SizedBox(
              //   height: 5,
              // ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Shipping Information",
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                          height: 1.445,
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Gh 11321 Building, Avenue Street,Borivili North, Mumbai , 40gggggg0 004",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            height: 1.445,
                          ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "23232322222",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            height: 1.445,
                          ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Payment Method",
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                          height: 1.445,
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Razorpay",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            height: 1.445,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
    @override
  void initState() {
    Future.microtask(() {
      context.read<MyOrderDetailsProvider>().myServiceDetails(
          userId: userModel.userId,
          serviceId: widget.serviceId
          );
    });
    super.initState();
  }
}
