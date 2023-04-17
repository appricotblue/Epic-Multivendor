import 'package:cached_network_image/cached_network_image.dart';
import 'package:epic_multivendor/helper/helper_images.dart';
import 'package:flutter/material.dart';

class CatchedImageWidget extends StatelessWidget {
  const CatchedImageWidget({
    Key? key,
    this.image,
    this.height,
    this.width,
    this.assetHt,
    this.assetWT,
    this.borderRadius
  }) : super(key: key);
  final String? image;
  final double? height,width,assetHt,assetWT;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      key: UniqueKey(),
      imageUrl:image.toString(),
      width:width?? double.infinity,
      height: height??130,
      imageBuilder: (context, imageProvider) => ClipRRect(
        borderRadius: borderRadius ??const  BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10)),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
                colorFilter:
                    const ColorFilter.mode(Colors.white, BlendMode.colorBurn)),
          ),
        ),
      ),
      placeholder: (context, url) =>  Padding(
        padding: const EdgeInsets.all(12.0),
        child: Image.asset(
          AppAssetsImages.noImges2,
          width: 25,
          height: 20,),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
