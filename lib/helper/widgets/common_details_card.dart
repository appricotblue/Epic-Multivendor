import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../helper_color.dart';
import 'cached_images.dart';

class CommonDetailsCard extends StatelessWidget {
  const CommonDetailsCard(
      {super.key,
      this.assetImage,
      this.netWorkImage,
      this.ratingCount,
      this.ratingViewsCount,
      this.title,
      this.type,
      this.location});
  final String? title,
      netWorkImage,
      assetImage,
      type,
      ratingCount,
      ratingViewsCount;
  final Widget? location;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: Card(
        elevation: 3,
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
                  CatchedImageWidget(
                    height: 200,
                    image: "$netWorkImage",
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
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "$title",
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontSize: 17.9075546265,
                            fontWeight: FontWeight.w500,
                            height: 1.445,
                            color: AppColors.secondaryGreen,
                          ),
                    ),
                    Row(
                      children: [
                        Image.asset(assetImage!),
                        const SizedBox(width: 5.0),
                        Text(
                          "$type",
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
                          itemCount: 5,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 1.0),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            size: 10,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {},
                        ),
                        Text(
                          " $ratingCount Rating ($ratingViewsCount)",
                        )
                      ],
                    ),
                    const SizedBox(height: 3.0),
                    location!
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
