import 'package:cached_network_image/cached_network_image.dart';
import 'package:epic_multivendor/helper/widgets/cached_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../helper_color.dart';
import '../helper_images.dart';
import '../helper_shimmer.dart';
import '../helper_style.dart';

class CommonServiceDetailsWidget extends StatelessWidget {
  const CommonServiceDetailsWidget(
      {Key? key,
      this.productImage,
      this.title,
      this.price,
      this.ratingViewsCount,
      this.height})
      : super(key: key);
  final String? productImage, title, price, ratingViewsCount;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(10),
                  topLeft: Radius.circular(10)),
              child: CachedNetworkImage(
                imageUrl: productImage!,
                width: double.infinity,
                height: 200,
                fit: BoxFit.fill,
                placeholder: (context, url) =>
                    ShimmerLoader().shimmerImageProduct(context, width:200.0),
                errorWidget: (context, url, error) =>
                    Image.asset(AppAssetsImages.noService1,height: 200,color: AppColors.secondaryBlue,),
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
                          borderRadius: BorderRadius.circular(10)),
                      child: const Icon(Icons.favorite_border)),
                ))
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          width: MediaQuery.of(context).size.width,
          color: AppColors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title.toString(),
                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      fontSize: 17.9075546265,
                      fontWeight: FontWeight.w500,
                      height: 1.445,
                      color: const Color(0xff3d6deb),
                    ),
              ),
              const SizedBox(width: 5.0),
              Row(
                children: [
                  Text(
                    "$rs $price",
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          fontSize: 17.9075546265,
                          fontWeight: FontWeight.w500,
                          height: 1.445,
                          color: const Color(0xff3d6deb),
                        ),
                  ),
                  const SizedBox(width: 5.0),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Text(
                      "Automobile Services",
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontSize: 14.7916059494,
                            fontWeight: FontWeight.w500,
                            height: 1.445,
                            color: const Color(0xff444444),
                          ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 3,
              ),
              Row(
                children: [
                  RatingBar.builder(
                    initialRating: 3,
                    minRating: 1,
                    itemSize: 13,
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
                  const SizedBox(width: 5.0),
                  Text(
                    "$ratingViewsCount Reviews",
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          fontSize: 14.7916059494,
                          fontWeight: FontWeight.w300,
                          height: 1.5,
                          color: const Color(0xff444444),
                        ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
