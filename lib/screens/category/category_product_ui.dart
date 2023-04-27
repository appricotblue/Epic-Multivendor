import 'package:cached_network_image/cached_network_image.dart';
import 'package:epic_multivendor/apis/api_endpoints.dart';
import 'package:epic_multivendor/helper/helper_color.dart';
import 'package:epic_multivendor/helper/helper_images.dart';
import 'package:epic_multivendor/helper/helper_shimmer.dart';
import 'package:epic_multivendor/helper/helper_style.dart';
import 'package:epic_multivendor/helper/model/user_model.dart';
import 'package:epic_multivendor/helper/widgets/button.dart';
import 'package:epic_multivendor/screens/cart/cart.dart';
import 'package:epic_multivendor/screens/cart/cart_provider.dart';
import 'package:epic_multivendor/screens/category/category_product.dart';
import 'package:epic_multivendor/screens/shops/shop_details/shop_details.dart';
import 'package:epic_multivendor/screens/shops/shop_products/shop_product_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class CategoryProductUi extends StatefulWidget {
  const CategoryProductUi({super.key});

  @override
  State<CategoryProductUi> createState() => _CategoryProductUiState();
}

class _CategoryProductUiState extends State<CategoryProductUi> {
  var userModel = Get.find<UserModel>();
  int? attributeId;
  int? isSelected;
  @override
  Widget build(BuildContext context) {
    ShopProductProvider shopProductProvider = context.watch<ShopProductProvider>();
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
          : Column(
            children: [
              const SizedBox(height: 20),
              Row(
                children: [
                  const SizedBox(width: 15),
                  InkWell(
                    onTap: (){
                      setState(() {
                        
                      });
                      userModel.updateWith(subCategoryId: 'null');
                      setState(() {
                        context
                        .read<ShopProductProvider>()
                        .categoryProductList(
                        userId: userModel.userId, categoryId: userModel.catgeoryId,shopId:userModel.shopId,subCategoryId: userModel.subCategoryId);
                      });
                    },
                    child: Container(
                      height: 50,
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        color:AppColors.primaryGreen,
                        borderRadius: BorderRadius.circular(7)),
                      child: Text("All", 
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 12,
                        height: 1.445,
                        overflow: TextOverflow.ellipsis,
                        color: AppColors.white),),
                    ),
                  ),   
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width-80,
                    child: ListView.builder(
                      itemCount: shopProductProvider.productSubCategoryModel?.categories?.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: (){
                            
                            userModel.updateWith(
                              catgeoryId:shopProductProvider.productSubCategoryModel?.categories?[index].mainCategoryId.toString(),
                              subCategoryId: shopProductProvider.productSubCategoryModel?.categories?[index].id.toString()
                            );
                            setState(() {
                              context
                              .read<ShopProductProvider>()
                              .categoryProductList(
                              userId: userModel.userId, categoryId: userModel.catgeoryId,shopId:userModel.shopId,subCategoryId: userModel.subCategoryId);
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              color:AppColors.primaryGreen,
                              borderRadius: BorderRadius.circular(7)),
                            child: Text("${shopProductProvider.productSubCategoryModel?.categories?[index].subCategory}",
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              fontSize: 12,
                              height: 1.445,
                              overflow: TextOverflow.ellipsis,
                              color: AppColors.white),
                            ),
                          ),
                        );
                      }
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              SingleChildScrollView(
                child:shopProductProvider.categoryProductModel?.products?.length == 0 ||
                shopProductProvider.categoryProductModel?.products?.length == null? 
                Center(
                  child: Image.asset(AppAssetsImages.noProduct1)
                ): 
                Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    ListView.builder(
                      itemCount: shopProductProvider.categoryProductModel?.products?.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) => Padding(
                        padding:
                          const EdgeInsets.only(bottom: 5.0,top: 5),
                          child: InkWell(
                            onTap: () {
                              userModel.updateWith(
                                shopProductId: shopProductProvider.categoryProductModel?.products?[index].id.toString()
                              );
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const ShopDetails(),));
                            },
                            child: Column(
                              children: [
                                Card(
                                  elevation: 5,
                                  child: Container(
                                    width: MediaQuery.of(context).size.width - 30,
                                    color: AppColors.white,
                                    // decoration: BoxDecoration(
                                    //   // borderRadius: BorderRadius.circular(10),
                                    //   color: Colors.white,
                                    //   // boxShadow: [
                                    //   //   BoxShadow(color: Colors.green, spreadRadius: 1),
                                    //   // ],
                                    // ),
                                    // padding:const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                                    child: Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:const BorderRadius.only(bottomLeft: Radius.circular(10),
                                            topLeft: Radius.circular(10)
                                          ),
                                          color: AppColors.scaffoldGreen
                                        ),
                                        child: CachedNetworkImage(
                                          imageUrl: "${ApiEndPoints.imageBaseURL}${shopProductProvider.categoryProductModel?.products?[index].featuredImageName}",
                                          width: 100,
                                          height: 100,
                                          fit: BoxFit.fill,
                                          placeholder: (context,url) =>ShimmerLoader().shimmerImageProduct(context,width: 100.0),
                                          errorWidget: (context,url, error) =>Image.asset(AppAssetsImages.noService1,
                                            height: 100,
                                            color: AppColors.secondaryGreen,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      Column(
                                        crossAxisAlignment:CrossAxisAlignment.start,
                                        mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                        children: [
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          SizedBox(
                                            width: 200,
                                            child: Text(shopProductProvider.categoryProductModel?.products?[index].name ??"",
                                              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                                fontSize: 17,
                                                fontWeight:FontWeight.w500,
                                                height: 1.445,
                                                overflow:TextOverflow.ellipsis,
                                                color: const Color(0xff272727),
                                              ),
                                            ),
                                          ),
                                                               
                                          // ignore: prefer_is_empty
                                          shopProductProvider.categoryProductModel?.products?[index].attributes?.length ==0 ||
                                          shopProductProvider.categoryProductModel?.products?[index].attributes?.length ==null
                                          ? Container()
                                          : SizedBox(
                                              width: 140,
                                              height: 40,
                                              child: ListView.builder(
                                                itemCount: shopProductProvider.categoryProductModel?.products?[ index].attributes?.length,
                                                scrollDirection:Axis.horizontal,
                                                itemBuilder:(context,pos) =>
                                                Padding(
                                                  padding:const EdgeInsets.all( 5.0),
                                                  child:InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        attributeId =  shopProductProvider.categoryProductModel?.products?[index].attributes?[pos].id;
                                                        shopProductProvider.categoryProductModel?.products?[index].attributeCount = pos;
                                                        shopProductProvider.categoryProductModel?.products?[index].salePrice =  
                                                        shopProductProvider.categoryProductModel?.products?[index].attributes?[pos].value;
                                                      });
                                                    },
                                                    child:Container(
                                                      height:40,
                                                      color: shopProductProvider.categoryProductModel?.products?[index].attributeCount ==pos
                                                        ? AppColors.primaryGreen: AppColors.primaryGreen.withOpacity(.6),
                                                      padding: const EdgeInsets.symmetric(horizontal:5,vertical:5),
                                                                                child:
                                                                                    Center(
                                                                                  child:
                                                                                      Text(
                                                                                    shopProductProvider.categoryProductModel?.products?[index].attributes?[pos].name.toString() ??
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
                                                                
                                                                shopProductProvider.categoryProductModel?.products?[index].salePrice != null &&
                                                                shopProductProvider.categoryProductModel?.products?[index].salePrice != 0
                                                                ?
                                                                Row(
                                                                  children: [
                                                                    Text(
                                                                      '$rupees ${shopProductProvider.categoryProductModel?.products?[index].salePrice ?? ""}',
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
                                                                      'MRP $rupees ${shopProductProvider.categoryProductModel?.products?[index].price ?? ""}',
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
                                                                      '$rupees ${shopProductProvider.categoryProductModel?.products?[index].price ?? ""}',
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
                                                            // const SizedBox(
                                                            //   width:4,
                                                            // ),
                                                            // const Spacer(),
                                                            Column(
                                                              children: [
                                                                InkWell(
                                                                  onTap: () {
                                                                    setState(() {
                                                                      shopProductProvider
                                                                          .categoryProductModel
                                                                          ?.products?[
                                                                              index]
                                                                          .quantityCount++;
                                                                      isSelected = index;
                                                                      debugPrint(
                                                                          "${shopProductProvider.categoryProductModel?.products?[index].quantityCount}..${shopProductProvider.categoryProductModel?.products?[index].productPrice}");
                                                                    
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
                                                                              .categoryProductModel
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
                                                                              .categoryProductModel
                                                                              ?.products?[
                                                                                  index]
                                                                              .quantityCount ==
                                                                          0) {
                                                                      } else {
                                                                        shopProductProvider
                                                                            .categoryProductModel
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
                                                                                  .categoryProductModel
                                                                                  ?.products?[
                                                                                      index]
                                                                                  .isCart ==
                                                                              false
                                                                          ? () {
                                                                              if(shopProductProvider.categoryProductModel?.products?[ index].attributes?.length != 0){
                                                                                // ignore: prefer_conditional_assignment
                                                                                if(attributeId == null){
                                                                                    attributeId = shopProductProvider.categoryProductModel?.products?[ index].attributes?[0].id;
                                                                                }
                                                                              }
                                                                              Provider.of<CartProvider>(
                                                                                      context,
                                                                                      listen:
                                                                                          false)
                                                                                  .addToCart(
                                                                                      context,
                                                                                      userId: userModel.userId,
                                                                                      productAmount: shopProductProvider.categoryProductModel?.products?[index].productPrice,
                                                                                      productId: shopProductProvider.categoryProductModel?.products?[index].id,
                                                                                      quantity: shopProductProvider.categoryProductModel?.products?[index].quantityCount,
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
                                                                                  .categoryProductModel
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
                                            )),
                  ],
                )
              ),
            ],
          ),
     );
  }

  @override
  void initState() {
    Future.microtask(() {
      context
          .read<ShopProductProvider>()
          .categoryProductList(
            userId: userModel.userId, categoryId: userModel.catgeoryId,shopId:userModel.shopId,subCategoryId: userModel.subCategoryId);

      context.read<ShopProductProvider>().getProductSubCategory(categoryId: userModel.catgeoryId);
    });
    super.initState();
  }
}