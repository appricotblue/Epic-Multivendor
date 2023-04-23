// ignore_for_file: file_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:epic_multivendor/helper/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import '../helper_color.dart';
import '../helper_images.dart';
import '../helper_shimmer.dart';
import 'cached_images.dart';

class CommonScreenProductList extends StatefulWidget {
  CommonScreenProductList(
      {super.key,
        this.image,
        this.title,
        this.type,
        this.price,
        this.strikedPrice,
        this.onTap});
  final String? image, title, type, price,strikedPrice;
  void Function()? onTap;

  @override
  State<CommonScreenProductList> createState() => _CommonScreenProductListState();
}

class _CommonScreenProductListState extends State<CommonScreenProductList> {
  var userModel = Get.find<UserModel>();
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Card(
        elevation: 0.5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(10),
                    topLeft: Radius.circular(10)),
                child: CachedNetworkImage(
                  imageUrl: widget.image.toString(),
                  width: double.infinity,
                  height: 170,
                  fit: BoxFit.fill,
                  placeholder: (context, url) =>
                      ShimmerLoader().shimmerImageProduct(context, width:200.0),
                  errorWidget: (context, url, error) =>
                      Image.asset(AppAssetsImages.noProduct1,height: 170,color: AppColors.secondaryGreen,),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 130,
                      child: Text(
                        widget.title.toString(),
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          height: 1.445,
                          overflow: TextOverflow.ellipsis,
                          color: const Color(0xff000000),
                        ),
                      ),
                    ),
                    Text(
                      "${userModel.shopCategoryType}",
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        height: 1.445,
                        overflow: TextOverflow.ellipsis,
                        color: const Color(0xff000000),
                      ),
                    ),
                    const SizedBox(height: 3.0),
                    Row(
                      children: [
                        Text(
                          '₹${widget.price}',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              height: 1.445,
                              color: AppColors.secondaryGreen),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          '${widget.strikedPrice}',
                          style:
                          Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            height: 1.445,
                            decoration: TextDecoration.lineThrough,
                            color: const Color(0xff7a7a7a),
                            decorationColor: const Color(0xff7a7a7a),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
