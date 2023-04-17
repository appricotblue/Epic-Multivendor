import 'package:cached_network_image/cached_network_image.dart';
import 'package:epic_multivendor/apis/api_endpoints.dart';
import 'package:epic_multivendor/helper/helper_color.dart';
import 'package:epic_multivendor/helper/helper_logger.dart';
import 'package:epic_multivendor/helper/widgets/button.dart';
import 'package:epic_multivendor/screens/cart/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../helper/helper_images.dart';
import '../../../helper/helper_shimmer.dart';
import '../../../helper/helper_style.dart';
import '../../../helper/model/user_model.dart';
import '../../bottom/bottom_nav.dart';
import '../../checkout/shop_checkout/shop_checkout.dart';
import '../../home/home.dart';

class CartUI extends StatefulWidget {
  const CartUI({super.key});

  @override
  State<CartUI> createState() => _CartUIState();
}

class _CartUIState extends State<CartUI> {
  var userModel = Get.find<UserModel>();
  var total;
  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = context.watch<CartProvider>();
    var data = cartProvider.cartListModel?.cartData?.map((e) => e.totalAmount);
    total = data?.fold(0, (previousValue, element) => previousValue.toInt() + element!.toInt());
    print(total);
    return WillPopScope(
       onWillPop: () async {
         Navigator.push(context, MaterialPageRoute(builder: (context) => const BottomBarScreen(),));
         return true;
      },
      child: Scaffold(
        backgroundColor: AppColors.scaffoldGreen,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.white,
          leading: IconButton(
             onPressed: () async{
                 Navigator.push(context, MaterialPageRoute(builder: (context) => const BottomBarScreen(),));
                    },
              icon: Icon(
                Icons.arrow_back,
                color: AppColors.black,
              )),
          title: Text(
            "My Cart",
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(color: AppColors.black),
          ),
        ),
        body:cartProvider.isLoading?ShimmerLoader().shimmerProduct(context): SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${cartProvider.cartListModel?.cartData?.length} Items",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(color: AppColors.lightGrey),
                ),
                const SizedBox(
                  height: 5,
                ),
                cartProvider.cartListModel?.cartData?.length == 0 ||
                    cartProvider.cartListModel?.cartData?.length == null ?
                    Center(child: Image.asset(AppAssetsImages.noProduct1),):
                ListView.builder(
                    itemCount: cartProvider.cartListModel?.cartData?.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.only(bottom: 5.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColors.white),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                      topRight: Radius.circular(10),
                                      topLeft: Radius.circular(10)),
                                  child: CachedNetworkImage(
                                    imageUrl: "${ApiEndPoints.imageBaseURL}${cartProvider.cartListModel?.cartData?[index].productImage}",
                                    width: 70,
                                    height: 70,
                                    fit: BoxFit.fill,
                                    placeholder: (context, url) => ShimmerLoader()
                                        .shimmerImageProduct(context,
                                            width: 70.0),
                                    errorWidget: (context, url, error) =>
                                        Image.asset(
                                      AppAssetsImages.noService1,
                                      height: 70,
                                      color: AppColors.secondaryGreen,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 230,
                                      child: Text(
                                        cartProvider.cartListModel?.cartData?[index].productTitle??"",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6
                                            ?.copyWith(
                                                fontWeight: FontWeight.w500,
                                                height: 1.445,
                                                color: const Color(0xff333333),
                                                overflow: TextOverflow.ellipsis),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      "Order Id :12235554448",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w300,
                                              height: 1.445,
                                              color: const Color(0x99363636),
                                              overflow: TextOverflow.ellipsis),
                                    ),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      "$rupees ${ cartProvider.cartListModel?.cartData?[index].productAmount??""}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                              height: 1.445,
                                              color: AppColors.primaryGreen,
                                              overflow: TextOverflow.ellipsis),
                                    ),
                                  ],
                                ),
                                IconButton(
                                    onPressed: () {
                                      cartProvider.deleteCart(
                                        context,
                                        id: cartProvider.cartListModel?.cartData?[index].id,userId: userModel.userId).then((value) {
                                        Future.microtask(() {
                                            context.read<CartProvider>().getCart(
                                                userId: userModel.userId,
                                            );
                                          });
                                      });
                                    },
                                    icon: Container(
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                color: AppColors.lightGrey)),
                                        child: Icon(
                                          Icons.close_rounded,
                                          size: 15,
                                          color: AppColors.lightGrey,
                                        )))
                              ],
                            ),
                          ),
                        ))
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          width: MediaQuery.of(context).size.width,
          height: 300,
          color: AppColors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                _price(context, title: "Product Price", price: ""),
                _price(context, title: "GST(18%)", price: ""),
                _price(context, title: "Delivery Charge", price: ""),
                _price(context, title: "Delivery GST", price: ""),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total Amount",
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            height: 1.9444444444,
                            color: const Color(0xff333333),
                          ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      "$rupees $total",
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            height: 1.9444444444,
                            color: const Color(0xff333333),
                          ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                AppButton(
                  onPressed:cartProvider.cartListModel?.cartData?.length == 0?(){
                    SnackBarMessage(context, "Cart empty");
                  }: () {
                    userModel.updateWith(orderAmount: total);
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ShopCheckOut()));
                  },
                  width: MediaQuery.of(context).size.width,
                  text: "Continue to Checkout",
                  txtClr: AppColors.white,
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row _price(BuildContext context, {title, price}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "$title",
          style: Theme.of(context).textTheme.headline6?.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w300,
                height: 1.9444444444,
                color: const Color(0xff333333),
              ),
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          "$price",
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
      context.read<CartProvider>().getCart(
          userId: userModel.userId,
      );
    });
    super.initState();
  }
}
