// ignore_for_file: file_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:epic_multivendor/helper/helper_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../helper_color.dart';
import '../helper_images.dart';
import 'cached_images.dart';

class CommonListServiceWidget extends StatefulWidget {
  CommonListServiceWidget(
      {super.key,
      this.image,
      this.title,
      this.type,
      this.ratingViews,
      this.onTap,
      this.iconData,
      this.price});
  final String? image, title, type, ratingViews, price;
  void Function()? onTap;
  final Widget? iconData;

  @override
  State<CommonListServiceWidget> createState() =>
      _CommonListServiceWidgetState();
}

class _CommonListServiceWidgetState extends State<CommonListServiceWidget> {
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
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(10),
                        topLeft: Radius.circular(10)),
                    child: CachedNetworkImage(
                      imageUrl: widget.image.toString(),
                      width: double.infinity,
                      height: 130,
                      fit: BoxFit.fill,
                      placeholder: (context, url) =>
                          ShimmerLoader().shimmerImageService(context, width:200.0),
                      errorWidget: (context, url, error) =>
                          Image.asset(AppAssetsImages.noService1),
                    ),
                  ),
                  Positioned(
                      top: 10,
                      right: 10,
                      child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.white,
                          ),
                          child: widget.iconData))
                ],
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
                    Row(
                      children: [
                        const Icon(
                          Icons.place,
                          color: Colors.grey,
                          size: 20,
                        ),
                        const SizedBox(width: 5.0),
                        SizedBox(
                          width: 130,
                          child: Text(
                            widget.type.toString(),
                            style:
                                Theme.of(context).textTheme.bodyText1?.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300,
                                      height: 1.445,
                                      overflow: TextOverflow.ellipsis,
                                      color: const Color(0xff444444),
                                    ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 3.0),
                    Row(
                      children: [
                        RatingBar.builder(
                          initialRating: 3,
                          minRating: 1,
                          itemSize: 13,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 1,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 1.0),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            size: 10,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {},
                        ),
                        Text("(${widget.ratingViews})",
                            style:
                                Theme.of(context).textTheme.bodyText1?.copyWith(
                                      fontSize: 11.3185548782,
                                      fontWeight: FontWeight.w300,
                                      height: 1.5,
                                      color: const Color(0xff444444),
                                    )),
                        const Spacer(),
                        Text(
                          "₹ ${widget.price}",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  height: 1.445,
                                  color: AppColors.primaryBlue),
                        )
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
