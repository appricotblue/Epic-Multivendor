import 'package:cached_network_image/cached_network_image.dart';
import 'package:epic_multivendor/helper/helper_images.dart';
import 'package:epic_multivendor/helper/helper_logger.dart';
import 'package:epic_multivendor/helper/model/user_model.dart';
import 'package:epic_multivendor/screens/checkout/service_checkout/service_checkout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import '../../../../helper/helper_color.dart';
import '../../../../helper/helper_shimmer.dart';
import '../../../../helper/widgets/button.dart';
import '../../../../helper/widgets/common_textfield.dart';

class BookServiceUI extends StatelessWidget {
   BookServiceUI({super.key});
 TextEditingController nameCTLR = TextEditingController();
  TextEditingController phoneCTLR = TextEditingController();
  TextEditingController emailCTLR = TextEditingController();
  TextEditingController queryCTLR = TextEditingController();
  var userModel = Get.find<UserModel>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.scaffoldBlue,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          elevation: 0,
          leading: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_back,
                color: AppColors.black,
              )),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 10, 12, 8),
                  child: Container(
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
                            imageUrl: userModel.serviceImage.toString(),
                            width: 100,
                            height: 100,
                            fit: BoxFit.fill,
                            placeholder: (context, url) => ShimmerLoader()
                                .shimmerImageService(context, width: 200.0),
                            errorWidget: (context, url, error) => Image.asset(
                              AppAssetsImages.noService1,
                              width: 100,
                              height: 100,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              userModel.serviceTitle.toString() ?? "",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.copyWith(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    height: 1.15,
                                    color: const Color(0xff272727),
                                  ),
                            ),
                            Text(
                              userModel.serviceType.toString() ?? "",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    height: 1.445,
                                    color: const Color(0xff1747c3),
                                  ),
                            ),
                            // Row(
                            //   children: [
                            //     Text(
                            //       "₹ ${userModel.servicePrice.toString() ?? ""}",
                            //       style: Theme.of(context)
                            //           .textTheme
                            //           .bodyText1
                            //           ?.copyWith(
                            //             fontSize: 20,
                            //             fontWeight: FontWeight.w700,
                            //             height: 1.445,
                            //             color: const Color(0xff1747c3),
                            //           ),
                            //     ),
                            //     const SizedBox(width: 5.0),
                            //     Text(
                            //       "120",
                            //       style: Theme.of(context)
                            //           .textTheme
                            //           .bodyText1
                            //           ?.copyWith(
                            //             fontSize: 15,
                            //             fontWeight: FontWeight.w500,
                            //             height: 1.445,
                            //             decoration: TextDecoration.lineThrough,
                            //             color: const Color(0xff7a7a7a),
                            //             decorationColor:
                            //                 const Color(0xff7a7a7a),
                            //           ),
                            //     ),
                            //   ],
                            // ),
                            // Row(
                            //   children: [
                            //     RatingBar.builder(
                            //       initialRating: 3,
                            //       minRating: 1,
                            //       itemSize: 15,
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
                            //     const SizedBox(width: 5.0),
                            //     Text(
                            //       "520 Reviews",
                            //       style: Theme.of(context)
                            //           .textTheme
                            //           .bodyText1
                            //           ?.copyWith(
                            //             fontSize: 12,
                            //             fontWeight: FontWeight.w400,
                            //             height: 1.445,
                            //             color: const Color(0xff5f5f5f),
                            //           ),
                            //     ),
                            //   ],
                            // ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Text(
                    "Your Name",
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          height: 1.375,
                          color: const Color(0xff333333),
                        ),
                  ),
                ),
                CommonTextField(
                  controller: nameCTLR,
                  hintText: "Full Name *",
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Text(
                    "Your Phone",
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          height: 1.375,
                          color: const Color(0xff333333),
                        ),
                  ),
                ),
                CommonTextField(
                  controller: phoneCTLR,
                  hintText: "+91 96556 66541",
                  textInputType: TextInputType.number,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Text(
                    "Your Email",
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          height: 1.375,
                          color: const Color(0xff333333),
                        ),
                  ),
                ),
                CommonTextField(
                  controller: emailCTLR,
                  hintText: "robertabraham@gmail.com",
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Text(
                    "Query",
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          height: 1.375,
                          color: const Color(0xff333333),
                        ),
                  ),
                ),
                CommonTextField(
                  controller: queryCTLR,
                  height: 130,
                  minLines: 1,
                  maxLines: 3,
                  hintText: "Type Something...",
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
        bottomSheet: Padding(
          padding: const EdgeInsets.all(8.0),
          child: AppButton(
            onPressed: () {
             if(nameCTLR.text.isEmpty ||
             phoneCTLR.text.isEmpty ||
             emailCTLR.text.isEmpty ||
             queryCTLR.text.isEmpty){
               SnackBarMessage(context, "All fields are required");
             }else{
               userModel.updateWith(
                 name: nameCTLR.text,
                 number: phoneCTLR.text,
                 email: emailCTLR.text,
                 query: queryCTLR.text,
                 phone: phoneCTLR.text
               );
               debugPrint(userModel.userId);
               debugPrint(userModel.serviceId);
               debugPrint(userModel.name);
               debugPrint(userModel.number);
               debugPrint(userModel.email);
               debugPrint(userModel.query);
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ServiceCheckout(),));
             }
            },
            text: "Submit",
            color: AppColors.primaryBlue,
            txtClr: AppColors.white,
            width: MediaQuery.of(context).size.width,
          ),
        ));
  }
}
