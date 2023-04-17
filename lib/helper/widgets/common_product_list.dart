import 'package:epic_multivendor/helper/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../helper_color.dart';
import '../helper_images.dart';
import '../helper_style.dart';
import 'cached_images.dart';

class RestaurantProductListWidget extends StatelessWidget {
  RestaurantProductListWidget(
      {super.key,
      this.productImage,
      this.title,
      this.rating,
      this.price,
      this.addTap,
      this.quantityCount,
      this.removeTap,
      this.onTap});
  final String? productImage, title, rating, price, quantityCount;
  void Function()? addTap, removeTap, onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 5, 12, 12),
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(height: 5.0),
        itemCount: 10,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, i) {
          return InkWell(
            onTap: onTap,
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  CatchedImageWidget(
                    image: productImage,
                    width: 90,
                    height: 120,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10)),
                  ),
                  const SizedBox(width: 7.0),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 190,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(height: 3.0),
                        Text(
                          title!,
                          style:
                              Theme.of(context).textTheme.bodyText1?.copyWith(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                    height: 1.445,
                                    color: const Color(0xff272727),
                                  ),
                        ),
                        const SizedBox(height: 5.0),
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
                            const SizedBox(width: 5.0),
                            Text(
                              "$rating",
                            )
                          ],
                        ),
                        const SizedBox(height: 5.0),
                        Row(
                          children: [
                            Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: AppColors.primaryGreen)),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: CircleAvatar(
                                  radius: 10,
                                  backgroundColor: AppColors.primaryGreen,
                                ),
                              ),
                            ),
                            const SizedBox(width: 3.0),
                            Text("Vegitarian",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    ?.copyWith(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300,
                                      height: 1.445,
                                      color: const Color(0xff000000),
                                    )),
                          ],
                        ),
                        const SizedBox(height: 3.0),
                        Text(
                          "$rs $price",
                        ),
                        const SizedBox(height: 5.0),
                      ],
                    ),
                  ),
                  const SizedBox(width: 7.0),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButtonWidget(
                        text: "+",
                        color: AppColors.secondaryGreen,
                        onTap: addTap,
                      ),
                      ElevatedButtonWidget(
                        text: "$quantityCount",
                        isTrue: true,
                        textCLR: AppColors.black,
                      ),
                      ElevatedButtonWidget(
                        text: "-",
                        color: AppColors.secondaryGreen,
                        onTap: removeTap,
                      ),
                    ],
                  ),
                  const SizedBox(width: 7.0),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
