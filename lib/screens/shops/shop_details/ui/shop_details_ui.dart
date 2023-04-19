import 'package:cached_network_image/cached_network_image.dart';
import 'package:epic_multivendor/apis/api_endpoints.dart';
import 'package:epic_multivendor/helper/helper_shimmer.dart';
import 'package:epic_multivendor/helper/model/user_model.dart';
import 'package:epic_multivendor/screens/shops/shop_details/shop_details.dart';
import 'package:epic_multivendor/screens/shops/shop_details/shop_details_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../../helper/helper_color.dart';
import '../../../../helper/helper_images.dart';
import '../../../../helper/helper_style.dart';
import '../../../../helper/widgets/common_screen_product_list.dart';
import '../../../../helper/widgets/common_view_all.dart';
import '../../../cart/cart.dart';
import '../../../checkout/shop_checkout/shop_checkout.dart';

class ShopDetailsUI extends StatefulWidget {
  const ShopDetailsUI({super.key});

  @override
  State<ShopDetailsUI> createState() => _ShopDetailsUIState();
}

class _ShopDetailsUIState extends State<ShopDetailsUI> {
  var userModel = Get.find<UserModel>();
  String? selectedImage;
  String? isWishList;
  String? isWishListdata;
  int? productAmount;
  int? productPrice;
  int? attributeId;

  @override
  Widget build(BuildContext context) {
    ShopDetailsProvider shopDetailsProvider = context.watch<ShopDetailsProvider>();
    isWishList = isWishListdata ?? shopDetailsProvider.shopDetailsModel?.productData?.isWishlist.toString();
    productAmount =  productPrice ??shopDetailsProvider.shopDetailsModel?.productData?.salePrice;
    
    return Scaffold(
      backgroundColor: AppColors.scaffoldGreen,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: AppColors.primaryGreen,
            )),
      ),
      body:shopDetailsProvider.isLoading?
          ShimmerLoader().shimmerProduct(context):
      SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(
                      imageUrl: selectedImage == null?
                      "${ApiEndPoints.imageBaseURL}${shopDetailsProvider.shopDetailsModel?.productData?.featuredImageName}":"$selectedImage",
                      width: double.infinity,
                      height: 300,
                      fit: BoxFit.fill,
                      placeholder: (context, url) => ShimmerLoader()
                          .shimmerImageProduct(context, width: 300.0),
                      errorWidget: (context, url, error) => Image.asset(
                        AppAssetsImages.noProduct1,
                        height: 300,
                        color: AppColors.secondaryGreen,
                      ),
                    ),
                  ),
                ),
                Positioned(
                    right: 20,
                    top: 10,
                    child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)),
                              child: isWishList == "false"?InkWell(
                                onTap: (){
                                  
                                  shopDetailsProvider.addToWishList(context,
                                      userId: userModel.userId,
                                      productId: shopDetailsProvider.shopDetailsModel?.productData?.id
                                  ).then((value){
                                    setState(() {
                                      isWishListdata = "true";
                                    });
                                   
                                  });
                                },
                                child: Icon(
                                  Icons.favorite_border,
                                  color: AppColors.secondaryGreen,
                                ),
                              ):InkWell(
                                onTap: (){
                                  
                                  shopDetailsProvider.removeWishList(context,
                                      userId: userModel.userId,
                                      productId: shopDetailsProvider.shopDetailsModel?.productData?.id
                                  ).then((value){
                                    setState(() {
                                      isWishListdata = "false";
                                    });

                                  });
                                  
                                },
                                child: Icon(
                                  Icons.favorite,
                                  color: AppColors.secondaryGreen,
                                ),
                              ),
                       
                      ),
                    ))
              ],
            ),
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: shopDetailsProvider.shopDetailsModel?.productImages?.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(left: 3.0),
                  child: InkWell(
                    onTap: (){
                      setState(() {
                        selectedImage = "${ApiEndPoints.imageBaseURL}${shopDetailsProvider.shopDetailsModel?.productImages?[index]}";
                      });
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: CachedNetworkImage(
                        imageUrl:"${ApiEndPoints.imageBaseURL}${shopDetailsProvider.shopDetailsModel?.productImages?[index]}" ?? "",
                        width: 70,
                        height: 100,
                        fit: BoxFit.fill,
                        placeholder: (context, url) => ShimmerLoader()
                            .shimmerImageProduct(context, width: 70.0),
                        errorWidget: (context, url, error) => Image.asset(
                          AppAssetsImages.noProduct1,
                          height: 100,
                          color: AppColors.secondaryGreen,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
             Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      shopDetailsProvider.shopDetailsModel?.productData?.name ?? "",
                      style: Theme.of(context).textTheme.headline5?.copyWith(
                          height: 1.445,
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    shopDetailsProvider.shopDetailsModel?.productData?.status ?? "",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        height: 1.445,
                        overflow: TextOverflow.ellipsis,
                        color: AppColors.lightGrey),
                  ),
                  productAmount != null || 
                  productAmount != 0 ?
                  Row(
                    children: [
                      Text(
                        '$rupees ${productAmount ?? ""}',
                        style: Theme.of(context).textTheme.headline5?.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                            height: 1.445,
                            color: AppColors.primaryGreen),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'MRP $rupees ${shopDetailsProvider.shopDetailsModel?.productData?.price}',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              height: 1.445,
                              decoration: TextDecoration.lineThrough,
                              color: const Color(0xff7a7a7a),
                              decorationColor: const Color(0xff7a7a7a),
                            ),
                      ),
                    ],
                  ):Row(
                    children: [
                      Text(
                        '$rupees ${shopDetailsProvider.shopDetailsModel?.productData?.price ?? ""}',
                        style: Theme.of(context).textTheme.headline5?.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                            height: 1.445,
                            color: AppColors.primaryGreen),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                    ]),
                  const SizedBox(
                    height: 5,
                  ),
                  // Row(
                  //   children: [
                  //     RatingBar.builder(
                  //       initialRating: 3,
                  //       minRating: 1,
                  //       itemSize: 14,
                  //       direction: Axis.horizontal,
                  //       allowHalfRating: true,
                  //       itemCount: 5,
                  //       itemPadding:
                  //           const EdgeInsets.symmetric(horizontal: 1.0),
                  //       itemBuilder: (context, _) => const Icon(
                  //         Icons.star,
                  //         size: 10,
                  //         color: Colors.amber,
                  //       ),
                  //       onRatingUpdate: (rating) {},
                  //     ),
                  //     const SizedBox(
                  //       height: 3,
                  //     ),
                  //     Text(
                  //       "520 Rating",
                  //       style: Theme.of(context)
                  //           .textTheme
                  //           .bodySmall
                  //           ?.copyWith(color: AppColors.primaryGreen),
                  //     ),
                  //   ],
                  // ),
                  const SizedBox(
                    height: 5,
                  ),

                  // ignore: prefer_is_empty
                  shopDetailsProvider.shopDetailsModel?.productData?.attributes?.length != 0 ?
                  SizedBox(
                    height: 50,
                      child: ListView.builder(
                        itemCount:shopDetailsProvider.shopDetailsModel?.productData?.attributes?.length,
                        scrollDirection:Axis.horizontal,
                        itemBuilder:(context,pos) =>
                        Padding(
                          padding:const EdgeInsets.all( 5.0),
                          child: InkWell(
                            onTap: (){
                              setState(() {
                                attributeId = shopDetailsProvider.shopDetailsModel?.productData?.attributes?[pos].id; 
                                shopDetailsProvider.shopDetailsModel?.productData?.attributeCount = pos; 
                                productPrice = shopDetailsProvider.shopDetailsModel?.productData?.attributes?[pos].value; 
                              });

                              print("-----$attributeId");
                            },
                            child: Container(
                              width: 80,
                              height:40,
                              color: shopDetailsProvider.shopDetailsModel?.productData?.attributeCount == pos?
                                      AppColors.primaryGreen:AppColors.primaryGreen.withOpacity(.6),
                              child:Center(
                                child:Text("${ shopDetailsProvider.shopDetailsModel?.productData?.attributes?[pos].name}",
                                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                  fontSize: 12,
                                  height: 1.445,
                                  overflow: TextOverflow.ellipsis,
                                  color: AppColors.white),
                                ),
                              )
                            ),
                          )
                        ),
                      )

                  ):Container(),
                
              
                  Divider(
                    color: AppColors.lightGrey,
                  ),
                  Text(
                    "Details",
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                        height: 1.445,
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  _details(context, "Category", "Kurtha"),
                   _details(context, "Color", "Black"),
                  _details(context, "Occassion", "Casual Wear"),
                  _details(context, "Material", "Coton"),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Description",
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                        height: 1.445,
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    shopDetailsProvider.shopDetailsModel?.productData?.description ?? "",
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        height: 1.9444444444,
                        color: const Color(0xff333333)),
                  ),
                ],
              ),
            ),
      
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 50,
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: InkWell(
                    onTap: () {
                      userModel.updateWith(orderAmount: shopDetailsProvider.shopDetailsModel?.productData?.price);
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  
                              ShopCheckOut(
                                isOrder: "true",
                                productId: "${shopDetailsProvider.shopDetailsModel?.productData?.id.toString()}",
                                productAmount: productAmount == null? shopDetailsProvider.shopDetailsModel?.productData?.price.toString():productAmount.toString(),
                                quantity: 1,
                              )));
                    },
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.primaryGreen),
                      child: Center(
                        child: Text(
                          "Order now",
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    height: 1.445,
                                    color: AppColors.white,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                        ),
                      ),
                    ),
                  ),
                )),
            Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: InkWell(
                    onTap:shopDetailsProvider.shopDetailsModel?.productData?.isCart == true? (){
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Cart()));
                    }:
                   () {

                      if(shopDetailsProvider.shopDetailsModel?.productData?.attributes?.length != 0){

                        // ignore: prefer_conditional_assignment
                        if(attributeId == null){
                            attributeId = shopDetailsProvider.shopDetailsModel?.productData?.attributes?[0].id;
                        }
                      }
                      shopDetailsProvider.addToCart(context,
                      userId: userModel.userId,
                      quantity: "1",
                      productId: shopDetailsProvider.shopDetailsModel?.productData?.id,
                      productAmount: productAmount ?? shopDetailsProvider.shopDetailsModel?.productData?.price,
                      attributeId:attributeId

                    ).then((value) {
                        shopDetailsProvider.shopDetails(
                          userId: userModel.userId,
                          productIAd: userModel.shopProductId
                        );
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Cart()));
                      });
                    },
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.primaryGreen),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          shopDetailsProvider.shopDetailsModel?.productData?.isCart == true?"Go to cart":
                          "Add to cart",
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    height: 1.445,
                                    color: AppColors.primaryGreen,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                        ),
                      ),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }

  size(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.only(left: 3.0),
        child: Container(
          width: 100,
          height: 20,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: AppColors.primaryGreen),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 3.0),
              child: Text(
                "type",
                style: Theme.of(context).textTheme.headline6?.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    height: 1.9444444444,
                    color: AppColors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _details(BuildContext context, title, type) {
    return Row(
      children: [
        SizedBox(
          width: 150,
          child: Text(
            title,
            style: Theme.of(context).textTheme.headline6?.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                  height: 1.9444444444,
                  color: const Color(0xff333333),
                ),
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          type,
          style: Theme.of(context).textTheme.headline6?.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                height: 1.9444444444,
                color: const Color(0xff333333),
              ),
        ),
      ],
    );
  }
  @override
  void initState() {
    Future.microtask(() {
      context.read<ShopDetailsProvider>().shopDetails(
          userId: userModel.userId,
      productIAd: userModel.shopProductId);
    });
    super.initState();
  }
}
