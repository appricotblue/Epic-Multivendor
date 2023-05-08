

import 'package:cached_network_image/cached_network_image.dart';
import 'package:epic_multivendor/apis/api_endpoints.dart';
import 'package:epic_multivendor/helper/model/user_model.dart';
import 'package:epic_multivendor/screens/my_order&service_details/my_order_details_provider.dart';
import 'package:epic_multivendor/screens/my_service_details/my_service_details.dart';
import 'package:epic_multivendor/screens/splash/splash_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_web/razorpay_web.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../helper/helper_color.dart';
import '../../../helper/helper_images.dart';
import '../../../helper/helper_shimmer.dart';
import '../../../helper/helper_style.dart';

class MyServiceDetailsUI extends StatefulWidget {
  const MyServiceDetailsUI({super.key,this.serviceId});
  final String? serviceId;

  @override
  State<MyServiceDetailsUI> createState() => _MyServiceDetailsUIState();
}

class _MyServiceDetailsUIState extends State<MyServiceDetailsUI> {
  final userModel = Get.find<UserModel>();
  final razorpay = Razorpay();
  @override
  Widget build(BuildContext context) {
    MyOrderDetailsProvider value = context.watch<MyOrderDetailsProvider>();
    return Scaffold(
      backgroundColor: AppColors.scaffoldBlue,
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
          "Booking Details",
          style: Theme.of(context)
              .textTheme
              .headline6
              ?.copyWith(color: AppColors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 5.0, top: 5),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                          imageUrl: "${ApiEndPoints.imageBaseURL}${value.serviceBookingDetailsModel?.bookingData?.image}",
                          width: 70,
                          height: 70,
                          fit: BoxFit.fill,
                          placeholder: (context, url) => ShimmerLoader()
                              .shimmerImageProduct(context, width: 70.0),
                          errorWidget: (context, url, error) => Image.asset(
                            AppAssetsImages.noService1,
                            height: 70,
                            color: AppColors.secondaryBlue,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 230,
                            child: Text(
                              value.serviceBookingDetailsModel?.bookingData?.serviceTitle ?? "",
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
                            "Booking Id: ${value.serviceBookingDetailsModel?.bookingData?.bookingId}",
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
                          Row(
                          
                            children: [
                              Text(
                                "$rupees ${value.serviceBookingDetailsModel?.bookingData?.price}",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        height: 1.445,
                                        color: AppColors.primaryBlue,
                                        overflow: TextOverflow.ellipsis),
                              ),
                              const SizedBox(
                                width: 110,
                              ),
                              value.serviceBookingDetailsModel?.bookingData?.paymentStatus == "Unpaid"? InkWell(
                                onTap: (){
                                  getPayment(value.serviceBookingDetailsModel?.bookingData?.price);
                                },
                                child: Container(
                                  height: 30,
                                  width:70,
                                  decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: AppColors.primaryBlue),
                                  child: Center(child: Text("Pay Now",
                                  style:
                                  Theme.of(context).textTheme.bodyMedium?.copyWith(
                                        height: 1.445,
                                        color: AppColors.white,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                  ))
                                ),
                              ):Container(),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
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
                child: Row(
                  children: [
                    value.serviceBookingDetailsModel?.bookingData?.servicePin != null?Text(
                      "${value.serviceBookingDetailsModel?.bookingData?.servicePin}",
                      style: Theme.of(context).textTheme.headline5?.copyWith(
                          height: 1.445,
                          fontSize:25,
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.bold,
                      ),
                    ):Text(
                      "Not Found",
                      style: Theme.of(context).textTheme.headline5?.copyWith(
                          height: 1.445,
                          fontSize:15,
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "PIN for Delivery",
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              ?.copyWith(
                                  height: 1.445,
                                  overflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 100,
                          child: Text(
                            "Share this PIN with the delivery boy at the time of delivery",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  height: 1.445,
                                  color: const Color(0x99363636),
                                ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        )
                      ],
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
                      "Seller Details",
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
                      "${value.serviceBookingDetailsModel?.bookingData?.shopName}",
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                          height: 1.445,
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          // color: Colors.grey
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 120,
                          child: Text(
                            "${value.serviceBookingDetailsModel?.bookingData?.shopAddress}",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  height: 1.445,
                                  color: const Color(0x99363636),
                                ),
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            _makePhoneCall(value.serviceBookingDetailsModel?.bookingData?.shopPhone.toString());
                          },
                          child: Column(
                            children: [
                              Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: AppColors.primaryBlue)),
                                child: Icon(
                                  Icons.call,
                                  color: AppColors.primaryBlue,
                                ),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Text(
                                "Call Seller",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                        height: 1.445,
                                        color: AppColors.primaryBlue),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 5,
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
                      "Address Information",
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
                      "${value.serviceBookingDetailsModel?.bookingData?.userAddress}",
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                          height: 1.445,
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.bold,
                          fontSize: 15
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "${value.serviceBookingDetailsModel?.bookingData?.userEmail}",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            height: 1.445,
                            color: const Color(0x99363636),
                          ),
                    ),
                    Text(
                      "${value.serviceBookingDetailsModel?.bookingData?.userPhone}",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            height: 1.445,
                            color: const Color(0x99363636),
                          ),
                    ),
                    
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Payment Method",
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                          height: 1.445,
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "${value.serviceBookingDetailsModel?.bookingData?.paymentMethod}",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            height: 1.445,
                            color: const Color(0x99363636),
                          ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              value.serviceBookingDetailsModel?.bookingData?.providerStatus !=null?Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.white),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                   Text(
                      "Service Provider Status",
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                          height: 1.445,
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                      ),
                    ),

                    Text(
                      "${value.serviceBookingDetailsModel?.bookingData?.providerStatus}",
                        style: Theme.of(context).textTheme.headline6?.copyWith(
                          height: 1.445,
                          overflow: TextOverflow.ellipsis,
                          fontSize: 15
                      ),
                    ),
                  ],
                ),
              ):Container(),
              value.serviceBookingDetailsModel?.bookingData?.providerStatus !=null?const SizedBox(
                height: 10,
              ):const SizedBox(),
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
                      "Additional Charges",
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
                    
                    value.serviceBookingDetailsModel?.bookingData?.additionalCharges?.length == null ||
                    value.serviceBookingDetailsModel?.bookingData?.additionalCharges?.length == 0 ?
                    Center(child: Image.asset(AppAssetsImages.noService1),)
                    :
                    Container(
                      height: 100,
                      child: ListView.builder(
                        itemCount:  value.serviceBookingDetailsModel?.bookingData?.additionalCharges?.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index){
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("${value.serviceBookingDetailsModel?.bookingData?.additionalCharges?[index].service}",
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  height: 1.445,
                                  fontSize: 17,
                                  color: const Color(0x99363636),
                                ),
                              ),
                              Text("$rupees ${value.serviceBookingDetailsModel?.bookingData?.additionalCharges?[index].amount}",
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  height: 1.445,
                                  fontSize: 17,
                                  color: const Color(0x99363636),
                                ),
                              )
                            ],
                          );
                        }
                      ),
                    )
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
      context.read<MyOrderDetailsProvider>().serviceBookingDetails(
          serviceBookingId: widget.serviceId
      );
      Provider.of<SplashProvider>(context,listen: false).mySettingsFUNC(context);
    });
    super.initState();
  }

  void _makePhoneCall(String? phoneNumber) async {
    String telUrl = 'tel:$phoneNumber';
    if (await canLaunch(telUrl)) {
      await launch(telUrl);
    } else {
      throw 'Could not launch $telUrl';
    }
  }

  void paySuccess(PaymentSuccessResponse response) async {
    print("---Succcess---");

    Provider.of<MyOrderDetailsProvider>(context,listen: false).updateBookingPaymentStatus(
      context,bookingId: widget.serviceId
    );
    context.read<MyOrderDetailsProvider>().serviceBookingDetails(
      serviceBookingId: widget.serviceId
    );
   
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
      'key': Provider.of<SplashProvider>(context, listen: false).settingsModel?.razorpayKey,
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
