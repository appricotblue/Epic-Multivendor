import 'package:epic_multivendor/helper/helper_color.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoader {
  Widget shimmerProduct(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Shimmer.fromColors(
                  baseColor: AppColors.secondaryGreen.withOpacity(0.3),
                  highlightColor: AppColors.secondaryGreen.withOpacity(.4),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(7)),
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                child: Shimmer.fromColors(
                  baseColor: AppColors.secondaryGreen.withOpacity(0.3),
                  highlightColor: AppColors.secondaryGreen.withOpacity(.4),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(7)),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Shimmer.fromColors(
            baseColor: AppColors.secondaryGreen.withOpacity(0.3),
            highlightColor: AppColors.secondaryGreen.withOpacity(.4),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(7)),
            ),
          ),
          const SizedBox(
            height: 7,
          ),
          Shimmer.fromColors(
            baseColor: AppColors.secondaryGreen.withOpacity(0.3),
            highlightColor: AppColors.secondaryGreen.withOpacity(.4),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 180,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(7)),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Expanded(
            child: Shimmer.fromColors(
              baseColor: AppColors.secondaryGreen.withOpacity(0.3),
              highlightColor: AppColors.secondaryGreen.withOpacity(.4),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(7)),
              ),
            ),
          ),
        ],
      ),
    );
  }


  Widget shimmerService(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Shimmer.fromColors(
                  baseColor: AppColors.secondaryBlue.withOpacity(0.3),
                  highlightColor: AppColors.secondaryBlue.withOpacity(.4),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(7)),
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                child: Shimmer.fromColors(
                  baseColor: AppColors.secondaryBlue.withOpacity(0.3),
                  highlightColor: AppColors.secondaryBlue.withOpacity(.4),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(7)),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Shimmer.fromColors(
            baseColor: AppColors.secondaryBlue.withOpacity(0.3),
            highlightColor: AppColors.secondaryBlue.withOpacity(.4),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(7)),
            ),
          ),
          const SizedBox(
            height: 7,
          ),
          Shimmer.fromColors(
            baseColor: AppColors.secondaryBlue.withOpacity(0.3),
            highlightColor: AppColors.secondaryBlue.withOpacity(.4),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 180,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(7)),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Expanded(
            child: Shimmer.fromColors(
              baseColor: AppColors.secondaryBlue.withOpacity(0.3),
              highlightColor: AppColors.secondaryBlue.withOpacity(.4),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(7)),
              ),
            ),
          ),
        ],
      ),
    );
  }


  Widget shimmerImageService(BuildContext context, {width,height}) {
    return Shimmer.fromColors(
      baseColor: AppColors.secondaryBlue.withOpacity(0.3),
      highlightColor: AppColors.secondaryBlue.withOpacity(.4),
      child: Container(
        width:width?? MediaQuery.of(context).size.width,
        height:height ?? 180,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(7)),
      ),
    );
  }
  Widget shimmerImageProduct(BuildContext context, {width,height}) {
    return Shimmer.fromColors(
      baseColor: AppColors.secondaryGreen.withOpacity(0.3),
      highlightColor: AppColors.secondaryGreen.withOpacity(.4),
      child: Container(
        width:width?? MediaQuery.of(context).size.width,
        height:height ?? 180,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(7)),
      ),
    );
  }

  Widget shimmerText(BuildContext context, {width,height}) {
    return Shimmer.fromColors(
      baseColor: AppColors.secondaryGreen.withOpacity(0.3),
      highlightColor: AppColors.secondaryGreen.withOpacity(.4),
      child: Container(
        width:130,
        height:height ?? 30,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(7)),
      ),
    );
  }
}
