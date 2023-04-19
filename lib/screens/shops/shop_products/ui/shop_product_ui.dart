import 'package:cached_network_image/cached_network_image.dart';
import 'package:epic_multivendor/apis/api_endpoints.dart';
import 'package:epic_multivendor/helper/helper_color.dart';
import 'package:epic_multivendor/helper/widgets/button.dart';
import 'package:epic_multivendor/helper/widgets/common_search_bar.dart';
import 'package:epic_multivendor/helper/widgets/common_view_all.dart';
import 'package:epic_multivendor/screens/cart/cart.dart';
import 'package:epic_multivendor/screens/cart/cart_provider.dart';
import 'package:epic_multivendor/screens/shops/shop_products/shop_product_provider.dart';
import 'package:epic_multivendor/screens/wishlist/wishlist_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../../helper/helper_images.dart';
import '../../../../helper/helper_shimmer.dart';
import '../../../../helper/helper_style.dart';
import '../../../../helper/model/user_model.dart';
import '../../shop_details/shop_details.dart';

class ShopProductUI extends StatefulWidget {
  const ShopProductUI({super.key});

  @override
  State<ShopProductUI> createState() => _ShopProductUIState();
}

class _ShopProductUIState extends State<ShopProductUI> {
  var userModel = Get.find<UserModel>();
  int? isSelected;
  int count = 0;
  int? attributeId;
  @override
  Widget build(BuildContext context) {
    ShopProductProvider shopProductProvider =
        context.watch<ShopProductProvider>();
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
          actions: [
          IconButton(
            onPressed: () {
               Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const Cart(),
                ));
            },
            icon: Icon(
              Icons.shopping_bag,
              color: AppColors.primaryGreen,
            )),
        ],
      ),
      body: shopProductProvider.isLoading
          ? ShimmerLoader().shimmerProduct(context)
          : SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: CachedNetworkImage(
                            imageUrl: userModel.shopImage ?? "",
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
                      // Positioned(
                      //     right: 20,
                      //     top: 10,
                      //     child: Card(
                      //       elevation: 10,
                      //       shape: RoundedRectangleBorder(
                      //           borderRadius: BorderRadius.circular(20)),
                      //       child: Container(
                      //           height: 40,
                      //           width: 40,
                      //           decoration: BoxDecoration(
                      //               borderRadius: BorderRadius.circular(10)),
                      //           child: InkWell(
                      //             onTap: (){
                      //               Provider.of<WishListProvider>(context,listen: false).addProductWishList(
                      //                 productId:  shopProductProvider.shopProductListModel?.,
                      //                 userId: userModel.userId
                      //               );
                      //             },
                      //             child: Icon(
                      //               Icons.favorite_outline,
                      //               color: AppColors.primaryGreen,
                      //             ),
                      //           )),
                      //     ))
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Text(
                            userModel.shopName ?? "",
                            style: Theme.of(context)
                                .textTheme
                                .headline5
                                ?.copyWith(
                                    height: 1.445,
                                    overflow: TextOverflow.ellipsis,
                                    fontWeight: FontWeight.bold),
                          ),
                        ),
                        // Text(
                        //   "Kalhara",
                        //   style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        //       height: 1.445,
                        //       overflow: TextOverflow.ellipsis,
                        //       color: AppColors.lightGrey),
                        // ),
                        Row(
                          children: [
                            Text('${userModel.shopCategoryType}',
                              // '$rupees 300',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5
                                  ?.copyWith(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w900,
                                      height: 1.445,
                                      color: AppColors.primaryGreen),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            // Text(
                            //   'MRP $rupees 300',
                            //   style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            //         fontSize: 18,
                            //         fontWeight: FontWeight.w500,
                            //         height: 1.445,
                            //         decoration: TextDecoration.lineThrough,
                            //         color: const Color(0xff7a7a7a),
                            //         decorationColor: const Color(0xff7a7a7a),
                            //       ),
                            // ),
                          ],
                        ),
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
                        // const SizedBox(
                        //   height: 5,
                        // ),
                        Divider(
                          color: AppColors.lightGrey,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        // CommonSearchBar(
                        //   hintText: "Search Product",
                        // ),
                        const SizedBox(
                          height: 5,
                        ),
                        CommonViewAllWithTitle(
                          title: "Products",
                          viewAll: "",
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        shopProductProvider.shopProductListModel?.products
                                        ?.length ==
                                    0 ||
                                shopProductProvider.shopProductListModel
                                        ?.products?.length ==
                                    null
                            ? Center(
                                child: Image.asset(AppAssetsImages.noProduct1))
                            : ListView.builder(
                                itemCount: shopProductProvider
                                    .shopProductListModel?.products?.length,
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, index) => Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 5.0),
                                      child: InkWell(
                                        onTap: () {
                                          userModel.updateWith(
                                              shopProductId: shopProductProvider
                                                  .shopProductListModel
                                                  ?.products?[index]
                                                  .id
                                                  .toString());
                                           Navigator.push(context, MaterialPageRoute(builder: (context) => const ShopDetails(),));
                                        },
                                        child: Column(
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              color: AppColors.white,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 5,
                                                      vertical: 5),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            const BorderRadius
                                                                    .only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        10),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        10)),
                                                        color: AppColors
                                                            .scaffoldGreen),
                                                    child: CachedNetworkImage(
                                                      imageUrl: "${ApiEndPoints.imageBaseURL}${shopProductProvider.shopProductListModel?.products?[index].featuredImageName}",
                                                      width: 100,
                                                      height: 100,
                                                      fit: BoxFit.fill,
                                                      placeholder: (context,
                                                              url) =>
                                                          ShimmerLoader()
                                                              .shimmerImageProduct(
                                                                  context,
                                                                  width: 100.0),
                                                      errorWidget: (context,
                                                              url, error) =>
                                                          Image.asset(
                                                        AppAssetsImages
                                                            .noService1,
                                                        height: 100,
                                                        color: AppColors
                                                            .secondaryGreen,
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 4,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      SizedBox(
                                                        width: 200,
                                                        child: Text(
                                                          shopProductProvider
                                                                  .shopProductListModel
                                                                  ?.products?[
                                                                      index]
                                                                  .name ??
                                                              "",
                                                          style: Theme.of(
                                                                  context)
                                                              .textTheme
                                                              .bodyLarge
                                                              ?.copyWith(
                                                                fontSize: 17,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                height: 1.445,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                color: const Color(
                                                                    0xff272727),
                                                              ),
                                                        ),
                                                      ),
                                                      // const SizedBox(
                                                      //   height: 5,
                                                      // ),
                                                      shopProductProvider
                                                                      .shopProductListModel
                                                                      ?.products?[
                                                                          index]
                                                                      .attributes
                                                                      ?.length ==
                                                                  0 ||
                                                              shopProductProvider
                                                                      .shopProductListModel
                                                                      ?.products?[
                                                                          index]
                                                                      .attributes
                                                                      ?.length ==
                                                                  null
                                                          ? Container()
                                                          : SizedBox(
                                                              width: 150,
                                                              height: 40,
                                                              child: ListView.builder(
                                                                itemCount: shopProductProvider.shopProductListModel?.products?[ index].attributes?.length,
                                                                scrollDirection:Axis.horizontal,
                                                                itemBuilder:(context,pos) =>
                                                                Padding(
                                                                  padding:const EdgeInsets.all( 5.0),
                                                                  child:
                                                                      InkWell(
                                                                    onTap: () {

                                                                      setState(() {
                                                                        attributeId =  shopProductProvider.shopProductListModel?.products?[index].attributes?[pos].id;
                                                                        shopProductProvider.shopProductListModel?.products?[index].attributeCount = pos;
                                                                        shopProductProvider.shopProductListModel?.products?[index].salePrice =  
                                                                        shopProductProvider.shopProductListModel?.products?[index].attributes?[pos].value;
                                                                      });
                                                                      // shopProductProvider.addRemoveStock(
                                                                      //     index,
                                                                      //     false);
                                                                      // setState(
                                                                      //     () {
                                                                      //       shopProductProvider.addStock(index);
                                                                      //   // shopProductProvider
                                                                      //   //     .shopProductListModel
                                                                      //   //     ?.products?[index]
                                                                      //   //     .attributeCount = pos;
                                                                      //   // shopProductProvider
                                                                      //   //     .shopProductListModel
                                                                      //   //     ?.products?[
                                                                      //   //         index]
                                                                      //   //     .productPrice = shopProductProvider.shopProductListModel?.products?[index].attributes?[pos].value
                                                                      //   //         .toString() ??
                                                                      //   //     "";
                                                                      //   // debugPrint(
                                                                      //   //     ".${shopProductProvider.shopProductListModel?.products?[index].productPrice}...............");
                                                                      // });
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          40,
                                                                      color: shopProductProvider.shopProductListModel?.products?[index].attributeCount ==
                                                                              pos
                                                                          ? AppColors
                                                                              .primaryGreen
                                                                          : AppColors
                                                                              .primaryGreen
                                                                              .withOpacity(.6),
                                                                      padding: const EdgeInsets
                                                                              .symmetric(
                                                                          horizontal:
                                                                              5,
                                                                          vertical:
                                                                              5),
                                                                      child:
                                                                          Center(
                                                                        child:
                                                                            Text(
                                                                          shopProductProvider.shopProductListModel?.products?[index].attributes?[pos].name.toString() ??
                                                                              "",
                                                                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                                                              fontSize: 12,
                                                                              height: 1.445,
                                                                              overflow: TextOverflow.ellipsis,
                                                                              color: AppColors.white),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
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
                                                      //           const EdgeInsets.symmetric(
                                                      //               horizontal: 1.0),
                                                      //       itemBuilder: (context, _) =>
                                                      //           const Icon(
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
                                                      //           ?.copyWith(
                                                      //               color:
                                                      //                   AppColors.primaryGreen),
                                                      //     ),
                                                      //   ],
                                                      // ),
                                                      
                                                      shopProductProvider.shopProductListModel?.products?[index].salePrice != null &&
                                                      shopProductProvider.shopProductListModel?.products?[index].salePrice != 0
                                                      ?
                                                      Row(
                                                        children: [
                                                          Text(
                                                            '$rupees ${shopProductProvider.shopProductListModel?.products?[index].salePrice ?? ""}',
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .headline5
                                                                ?.copyWith(
                                                                    fontSize:
                                                                        18,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w900,
                                                                    height:
                                                                        1.445,
                                                                    color: AppColors
                                                                        .primaryGreen),
                                                          ),
                                                          const SizedBox(
                                                            width: 10,
                                                          ),
                                                          Text(
                                                            'MRP $rupees ${shopProductProvider.shopProductListModel?.products?[index].price ?? ""}',
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .bodyLarge
                                                                ?.copyWith(
                                                                  fontSize: 13,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  height: 1.445,
                                                                  decoration:
                                                                      TextDecoration
                                                                          .lineThrough,
                                                                  color: const Color(
                                                                      0xff7a7a7a),
                                                                  decorationColor:
                                                                      const Color(
                                                                          0xff7a7a7a),
                                                                ),
                                                          ),
                                                        ],
                                                      ):Row(
                                                        children: [
                                                          Text(
                                                            '$rupees ${shopProductProvider.shopProductListModel?.products?[index].price ?? ""}',
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .headline5
                                                                ?.copyWith(
                                                                    fontSize:
                                                                        18,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w900,
                                                                    height:
                                                                        1.445,
                                                                    color: AppColors
                                                                        .primaryGreen),
                                                          )]),
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    width: 4,
                                                  ),
                                                  const Spacer(),
                                                  Column(
                                                    children: [
                                                      InkWell(
                                                        onTap: () {
                                                          setState(() {
                                                            shopProductProvider
                                                                .shopProductListModel
                                                                ?.products?[
                                                                    index]
                                                                .quantityCount++;
                                                            isSelected = index;
                                                            debugPrint(
                                                                "${shopProductProvider.shopProductListModel?.products?[index].quantityCount}..${shopProductProvider.shopProductListModel?.products?[index].productPrice}");
                                                            // shopProductProvider
                                                            //       .shopProductListModel
                                                            //       ?.products?[
                                                            //           index].productPrice = (shopProductProvider
                                                            //       .shopProductListModel
                                                            //       ?.products?[
                                                            //           index].productPrice)! * (shopProductProvider
                                                            //       .shopProductListModel
                                                            //       ?.products?[
                                                            //           index].quantityCount);
                                                          });
                                                        },
                                                        child: Container(
                                                          height: 30,
                                                          width: 40,
                                                          color: AppColors
                                                              .primaryGreen,
                                                          child: Center(
                                                            child: Text(
                                                              "+",
                                                              style: TextStyle(
                                                                  color: AppColors
                                                                      .white),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        height: 30,
                                                        width: 40,
                                                        color: AppColors.white,
                                                        child: Center(
                                                          child: Text(
                                                            shopProductProvider
                                                                    .shopProductListModel
                                                                    ?.products?[
                                                                        index]
                                                                    .quantityCount
                                                                    .toString() ??
                                                                "",
                                                            style: TextStyle(
                                                                color: AppColors
                                                                    .primaryGreen),
                                                          ),
                                                        ),
                                                      ),
                                                      InkWell(
                                                        onTap: () {
                                                          setState(() {
                                                            if (shopProductProvider
                                                                    .shopProductListModel
                                                                    ?.products?[
                                                                        index]
                                                                    .quantityCount ==
                                                                0) {
                                                            } else {
                                                              shopProductProvider
                                                                  .shopProductListModel
                                                                  ?.products?[
                                                                      index]
                                                                  .quantityCount--;
                                                            }
                                                            isSelected = index;
                                                          });
                                                        },
                                                        child: Container(
                                                          height: 30,
                                                          width: 40,
                                                          color: AppColors
                                                              .primaryGreen,
                                                          child: Center(
                                                            child: Text(
                                                              "-",
                                                              style: TextStyle(
                                                                  color: AppColors
                                                                      .white),
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            isSelected == index
                                                ? Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      // Padding(
                                                      //   padding: const EdgeInsets.all(8.0),
                                                      //   child: ClipRRect(
                                                      //       borderRadius: BorderRadius.circular(10),
                                                      //       child: AppButton2(
                                                      //         radius: BorderRadius.circular(5),
                                                      //         onPressed: (){
                                                      //           setState(() {
                                                      //             isSelected != 99999;
                                                      //           });
                                                      //         },
                                                      //         text: "Cancel",
                                                      //         height: 30,
                                                      //         width: 100,
                                                      //         color: AppColors.lightGrey,
                                                      //         txtClr: AppColors.white,)),
                                                      // ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            child: AppButton2(
                                                              radius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5),
                                                              onPressed: shopProductProvider
                                                                          .shopProductListModel
                                                                          ?.products?[
                                                                              index]
                                                                          .isCart ==
                                                                      false
                                                                  ? () {
                                                                      if(shopProductProvider.shopProductListModel?.products?[ index].attributes?.length != 0){
                                                                        // ignore: prefer_conditional_assignment
                                                                        if(attributeId == null){
                                                                            attributeId = shopProductProvider.shopProductListModel?.products?[ index].attributes?[0].id;
                                                                        }
                                                                      }
                                                                      Provider.of<CartProvider>(
                                                                              context,
                                                                              listen:
                                                                                  false)
                                                                          .addToCart(
                                                                              context,
                                                                              userId: userModel.userId,
                                                                              productAmount: shopProductProvider.shopProductListModel?.products?[index].productPrice,
                                                                              productId: shopProductProvider.shopProductListModel?.products?[index].id,
                                                                              quantity: shopProductProvider.shopProductListModel?.products?[index].quantityCount,
                                                                              attributeId: attributeId
                                                                          )
                                                                          .then((value) {
                                                                        Future.microtask(
                                                                            () {
                                                                          context.read<ShopProductProvider>().shopProductList(
                                                                              userId: "26",
                                                                              shopId: userModel.shopId);
                                                                        });
                                                                      });
                                                                    }
                                                                  : () {},
                                                              text: shopProductProvider
                                                                          .shopProductListModel
                                                                          ?.products?[
                                                                              index]
                                                                          .isCart ==
                                                                      false
                                                                  ? "Add to cart"
                                                                  : "All ready added",
                                                              height: 30,
                                                              width: 100,
                                                              color: AppColors
                                                                  .secondaryGreen,
                                                              txtClr: AppColors
                                                                  .white,
                                                            )),
                                                      ),
                                                    ],
                                                  )
                                                : Container()
                                          ],
                                        ),
                                      ),
                                    ))
                     
                      ],
                    ),
                  ),
                ],
              ),
            ),
      // bottomNavigationBar: Padding(
      //   padding: const EdgeInsets.all(18.0),
      //   child: AppButton(
      //     text: "Go Cart",
      //     txtClr: AppColors.white,
      //     onPressed: () {
      //       Navigator.pushReplacement(
      //           context,
      //           MaterialPageRoute(
      //             builder: (context) => const Cart(),
      //           ));
      //     },
      //   ),
      // ),
    );
  }

  @override
  void initState() {
    Future.microtask(() {
      context
          .read<ShopProductProvider>()
          .shopProductList(userId: userModel.userId, shopId: userModel.shopId);
    });
    super.initState();
  }

  increaseQuantity({quantityCount, productPrice}) {
    setState(() {
      productPrice = productPrice * quantityCount;
    });
  }
}
