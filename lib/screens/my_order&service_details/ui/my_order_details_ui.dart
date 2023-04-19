import 'package:cached_network_image/cached_network_image.dart';
import 'package:epic_multivendor/apis/api_endpoints.dart';
import 'package:epic_multivendor/helper/helper_color.dart';
import 'package:epic_multivendor/helper/model/user_model.dart';
import 'package:epic_multivendor/screens/my_order&service_details/my_order_details_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:order_tracker/order_tracker.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_web/razorpay_web.dart';

import '../../../helper/helper_images.dart';
import '../../../helper/helper_shimmer.dart';
import '../../../helper/helper_style.dart';

class MyOrderDetailsUI extends StatefulWidget {
  const MyOrderDetailsUI({super.key, this.orderId});
  final String? orderId;

  @override
  State<MyOrderDetailsUI> createState() => _MyOrderDetailsUIState();
}

class _MyOrderDetailsUIState extends State<MyOrderDetailsUI> {
  int _index = 0;
  final userModel = Get.find<UserModel>();
  final razorpay = Razorpay();

  @override
  Widget build(BuildContext context) {
    MyOrderDetailsProvider value = context.watch<MyOrderDetailsProvider>();
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
              color: AppColors.black,
            )),
        title: Text(
          "My Order",
          style: Theme.of(context)
              .textTheme
              .headline6
              ?.copyWith(color: AppColors.black),
        ),
      ),
      body:value.isLoading?CupertinoActivityIndicator(color: AppColors.primaryBlue,): SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              value.myOrderDetailsModel?.products?.length == 0 ||
                      value.myOrderDetailsModel?.products?.length == null
                  ? Container()
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: value.myOrderDetailsModel?.products?.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 5.0, top: 5),
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
                                    imageUrl:
                                        "${ApiEndPoints.imageBaseURL}${value.myOrderDetailsModel?.products?[index].featuredImageUrl}",
                                    width: 70,
                                    height: 70,
                                    fit: BoxFit.fill,
                                    placeholder: (context, url) =>
                                        ShimmerLoader().shimmerImageProduct(
                                            context,
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
                                        value.myOrderDetailsModel
                                                ?.products?[index].title ??
                                            "",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6
                                            ?.copyWith(
                                                fontWeight: FontWeight.w500,
                                                height: 1.445,
                                                color: const Color(0xff333333),
                                                overflow:
                                                    TextOverflow.ellipsis),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      "Product Id : #0000000${value.myOrderDetailsModel?.products?[index].productId}",
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
                                      "Quantity : ${value.myOrderDetailsModel?.products?[index].quantity}",
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
                                      "$rupees ${value.myOrderDetailsModel?.products?[index].price}",
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
                                // const Spacer(),
                                // IconButton(
                                //     onPressed: () {},
                                //     icon: Container(
                                //         decoration: BoxDecoration(
                                //             shape: BoxShape.circle,
                                //             border: Border.all(
                                //                 color: AppColors.lightGrey)),
                                //         child: Icon(
                                //           Icons.close_rounded,
                                //           size: 15,
                                //           color: AppColors.lightGrey,
                                //         )))
                              ],
                            ),
                          ),
                        );
                      }),
              // Container(
              //   width: MediaQuery.of(context).size.width,
              //   padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(10),
              //       color: AppColors.white),
              //   child: Row(
              //     children: [
              //       Text(
              //         "5888",
              //         style: Theme.of(context).textTheme.headline5?.copyWith(
              //             height: 1.445,
              //             fontSize: 26,
              //             overflow: TextOverflow.ellipsis,
              //             fontWeight: FontWeight.bold),
              //       ),
              //       const SizedBox(
              //         width: 10,
              //       ),
              //       Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Text(
              //             "PIN for Delivery",
              //             style: Theme.of(context)
              //                 .textTheme
              //                 .headline6
              //                 ?.copyWith(
              //                     height: 1.445,
              //                     overflow: TextOverflow.ellipsis,
              //                     fontWeight: FontWeight.bold),
              //           ),
              //           SizedBox(
              //             width: MediaQuery.of(context).size.width - 100,
              //             child: Text(
              //               "Gh 11321 Building, Avenue Street,Borivili North",
              //               style: Theme.of(context)
              //                   .textTheme
              //                   .bodyMedium
              //                   ?.copyWith(
              //                     height: 1.445,
              //                   ),
              //             ),
              //           ),
              //           const SizedBox(
              //             width: 5,
              //           )
              //         ],
              //       ),
              //     ],
              //   ),
              // ),
              const SizedBox(
                height: 5,
              ),
              // Container(
              //   width: MediaQuery.of(context).size.width,
              //   padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(10),
              //       color: AppColors.white),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Text(
              //         "Seller Details",
              //         style: Theme.of(context).textTheme.headline6?.copyWith(
              //             height: 1.445,
              //             overflow: TextOverflow.ellipsis,
              //             fontWeight: FontWeight.bold),
              //       ),
              //       const SizedBox(
              //         height: 5,
              //       ),
              //       Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [
              //           SizedBox(
              //             width: MediaQuery.of(context).size.width - 120,
              //             child: Text(
              //               "Gh 11321 Building, Avenue Street,Borivili North, Mumbai , 40gggggg0 004",
              //               style: Theme.of(context)
              //                   .textTheme
              //                   .bodyMedium
              //                   ?.copyWith(
              //                     height: 1.445,
              //                   ),
              //             ),
              //           ),
              //           Column(
              //             children: [
              //               Container(
              //                 height: 40,
              //                 width: 40,
              //                 decoration: BoxDecoration(
              //                     borderRadius: BorderRadius.circular(10),
              //                     border: Border.all(
              //                         color: AppColors.primaryGreen)),
              //                 child: Icon(
              //                   Icons.call,
              //                   color: AppColors.primaryGreen,
              //                 ),
              //               ),
              //               const SizedBox(
              //                 height: 3,
              //               ),
              //               Text(
              //                 "Call Seller",
              //                 style: Theme.of(context)
              //                     .textTheme
              //                     .bodyMedium
              //                     ?.copyWith(
              //                         height: 1.445,
              //                         color: AppColors.primaryGreen),
              //               ),
              //             ],
              //           ),
              //           const SizedBox(
              //             width: 10,
              //           )
              //         ],
              //       ),
              //       const SizedBox(
              //         height: 5,
              //       ),
              //     ],
              //   ),
              // ),
              // const SizedBox(
              //   height: 5,
              // ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Shipping Information",
                        style: Theme.of(context).textTheme.headline6?.copyWith(
                          height: 1.445,
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      value.myOrderDetailsModel?.orders?.deliveryAddress ?? "",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            height: 1.445,
                            color: const Color(0x99363636),
                          ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      value.myOrderDetailsModel?.orders?.userName ?? "",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            height: 1.445,
                            color: const Color(0x99363636),
                          ),
                    ),
                    Text(
                      value.myOrderDetailsModel?.orders?.userPhone ?? "",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            height: 1.445,
                            color: const Color(0x99363636),
                          ),
                    ),
                    Text(
                      "Order Id : ${value.myOrderDetailsModel?.orders?.orderId ?? ""}",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            height: 1.445,
                            color: const Color(0x99363636),
                          ),
                    ),
                    Text(
                      "$rs ${value.myOrderDetailsModel?.orders?.orderAmount ?? ""}",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          height: 1.445,
                          fontSize: 16,
                          color: AppColors.primaryGreen),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Payment Method",
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                          height: 1.445,
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Payment status: ${value.myOrderDetailsModel?.orders?.paymentStatus ?? ""}",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            height: 1.445,
                            color: const Color(0x99363636),
                          ),
                    ),
                    Text(
                      "Payment method: ${value.myOrderDetailsModel?.orders?.paymentMethod ?? ""}",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            height: 1.445,
                            color: const Color(0x99363636),
                          ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                      value.myOrderDetailsModel?.orders?.paymentStatus == "Unpaid"? InkWell(
                      onTap: (){
                        getPayment(value.myOrderDetailsModel?.orders?.orderAmount);
                      },
                      child: Center(
                        child: Container(
                          height: 35,
                          width:MediaQuery.of(context).size.width - 100,
                          decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: AppColors.primaryGreen),
                          child: Center(child: Text("Pay Now",
                          style:
                          Theme.of(context).textTheme.bodyMedium?.copyWith(
                                height: 1.445,
                                color: AppColors.white,
                                overflow: TextOverflow.ellipsis,
                              ),
                          ))
                        ),
                      ),
                    ):Container(),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Order Status",
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                          height: 1.445,
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            CircleAvatar(radius: 10,child: Text("1"),backgroundColor: Colors.grey[250],),
                            const SizedBox(height: 5,),
                            Container(height: 50,width: 1,color: Colors.grey[500],),
                            const SizedBox(height: 5,),
                          ],
                        ),
                        const SizedBox(width: 10,),
                        Text("Order Processing",style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight:value.myOrderDetailsModel?.orders?.orderStatus == "Processing"? FontWeight.bold:FontWeight.normal,
                          color:value.myOrderDetailsModel?.orders?.orderStatus == "Processing"? AppColors.primaryGreen:AppColors.lightGrey
                        ),)
                      ],
                    ),
                        Row(
                      children: [
                        Column(
                          children: [
                            CircleAvatar(radius: 10,child: Text("2"),backgroundColor: Colors.grey[250],),
                            const SizedBox(height: 5,),
                            Container(height: 50,width: 1,color: Colors.grey[500],),
                            const SizedBox(height: 5,),
                          ],
                        ),
                        const SizedBox(width: 10,),
                        Text("Order Pending",style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight:value.myOrderDetailsModel?.orders?.orderStatus == "Pending"? FontWeight.bold:FontWeight.normal,
                          color:value.myOrderDetailsModel?.orders?.orderStatus == "Pending"? Colors.amber:AppColors.lightGrey
                        ),)
                      ],
                    ),
                      Row(
                      children: [
                        Column(
                          children: [
                            CircleAvatar(radius: 10,child:const Text("3"),backgroundColor: Colors.grey[250],),
                            const SizedBox(height: 5,),
                            Container(height: 50,width: 1,color: Colors.grey[500],),
                            const SizedBox(height: 5,),
                          ],
                        ),
                        const SizedBox(width: 10,),
                         Text("Order Completed",style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight:value.myOrderDetailsModel?.orders?.orderStatus == "Completed"? FontWeight.bold:FontWeight.normal,
                          color:value.myOrderDetailsModel?.orders?.orderStatus == "Completed"? AppColors.primaryGreen:AppColors.lightGrey
                        ),)
                      ],
                    ),
                        Row(
                      children: [
                        Column(
                          children: [
                            CircleAvatar(radius: 10,child:  const Text("4"),backgroundColor: Colors.grey[250],),
                            const SizedBox(height: 5,),
                            Container(height: 50,width: 1,color: Colors.grey[500],),
                            const SizedBox(height: 5,),
                          ],
                        ),
                        const SizedBox(width: 10,),
                         Text("Order Deliverd",style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight:value.myOrderDetailsModel?.orders?.orderStatus == "Deliverd"? FontWeight.bold:FontWeight.normal,
                          color:value.myOrderDetailsModel?.orders?.orderStatus == "Deliverd"? AppColors.primaryGreen:AppColors.lightGrey
                        ),)
                      ],
                    )
                    // Padding(
                    //   padding: const EdgeInsets.all(20),
                    //   child: OrderTracker(
                    //     status: Status.delivered,
                    //     activeColor: Colors.green,
                    //     inActiveColor: Colors.grey[300],
                    //     orderTitleAndDateList:
                    //     value.myOrderDetailsModel?.orders?.orderStatus == "Processing"?
                    //      [
                    //       TextDto("Your order has been placed",
                    //           "Fri, 25th Mar '22 - 10:47pm"),
                    //     ]:[],
                    //     shippedTitleAndDateList:
                    //      value.myOrderDetailsModel?.orders?.orderStatus == "shipped"?
                    //      [
                    //       TextDto("Your order has been shipped",
                    //           ""),
                    //       TextDto(
                    //           "Your item has been received in the nearest hub to you.",
                    //           null),
                    //     ]:[],
                    //     deliveredTitleAndDateList:
                    //      value.myOrderDetailsModel?.orders?.orderStatus == "Completed"?

                    //      [
                    //       TextDto("Your order has been ${value.myOrderDetailsModel?.orders?.orderStatus}",
                    //           "Thu, 31th Mar '22 - 3:58pm"),
                    //     ]:[],
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, externalWallet);
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, paySuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, payError);
    Future.microtask(() {
      context
          .read<MyOrderDetailsProvider>()
          .myOrderListDetails(orderId: widget.orderId);
    });
    super.initState();
  }

    void paySuccess(PaymentSuccessResponse response) async {
    print("---Succcess---");

    Provider.of<MyOrderDetailsProvider>(context,listen: false).updateOrderPaymentStatus(
      context,orderId: widget.orderId
    );
     context.read<MyOrderDetailsProvider>().myOrderListDetails(orderId: widget.orderId);
  }

  void payError(PaymentFailureResponse response) {
    print("---Failure---");
    print(response.message! + response.code.toString());
  }

  void externalWallet(ExternalWalletResponse response) {
    print("---ExternalWallet---");
    print(response.walletName);
  }

  getPayment(String? amount) {
    var options = {
      'key': "rzp_test_YPPy2atb2bUKDB",
      'amount': int.parse(amount.toString()) *100,
      'name': "${userModel.name}",
      'prefill': {
        'contact': userModel.phone,
        'email': userModel.email,
      },
    };
    try {
      razorpay.open(options);
    } catch (e) {
      print("error $e");
    }
  }

}
