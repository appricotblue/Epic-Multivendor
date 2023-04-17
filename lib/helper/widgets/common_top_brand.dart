import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../helper_color.dart';
import '../helper_images.dart';
import '../helper_shimmer.dart';
import 'cached_images.dart';

class CommonTopBrandServices extends StatefulWidget {
  CommonTopBrandServices(
      {super.key,
      this.image,
      this.title,
      this.ratingViews,
      this.onTap,
      this.iconData});
  final String? image, title, ratingViews;
  void Function()? onTap;
  final Widget? iconData;

  @override
  State<CommonTopBrandServices> createState() => _CommonTopBrandServicesState();
}

class _CommonTopBrandServicesState extends State<CommonTopBrandServices> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Card(
        elevation: .5,
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
                  width: 130,
                  height: 100,
                  fit: BoxFit.fill,
                  placeholder: (context, url) => ShimmerLoader()
                      .shimmerImageService(context, width: 200.0),
                  errorWidget: (context, url, error) => Image.asset(
                    AppAssetsImages.noService1,
                    width: 130,
                    height: 100,
                    color: AppColors.secondaryBlue,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title.toString(),
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            height: 1.445,
                            color: const Color(0xff000000),
                          ),
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
