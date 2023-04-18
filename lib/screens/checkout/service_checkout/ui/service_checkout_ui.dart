import 'package:epic_multivendor/helper/helper_style.dart';
import 'package:epic_multivendor/screens/checkout/order_placed/service_order_placed.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_web/razorpay_web.dart';
import '../../../../helper/helper_color.dart';
import '../../../../helper/helper_logger.dart';
import '../../../../helper/helper_shimmer.dart';
import '../../../../helper/model/user_model.dart';
import '../../../../helper/widgets/button.dart';
import '../../../../helper/widgets/common_textfield.dart';
import '../../address/address.dart';
import '../../checkout_provider.dart';

class ServiceCheckoutUI extends StatefulWidget {
  ServiceCheckoutUI({super.key});

  @override
  State<ServiceCheckoutUI> createState() => _ServiceCheckoutUIState();
}

class _ServiceCheckoutUIState extends State<ServiceCheckoutUI> {
  bool? isLoading = false;
  int? selectedIndex;
  int? selectedPayment;
  var userModel = Get.find<UserModel>();
  final razorpay = Razorpay();

  TextEditingController postCTLR = TextEditingController();

  @override
  Widget build(BuildContext context) {
    CheckoutProvider checkoutProvider = context.watch<CheckoutProvider>();
    return Scaffold(
        backgroundColor: AppColors.scaffoldBlue,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: AppColors.black,
              )),
          title: Text(
            "Checkout",
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  height: 1.15,
                  color: const Color(0xff272727),
                ),
          ),
        ),
        body: checkoutProvider.isLoading
            ? ShimmerLoader().shimmerProduct(context)
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// DELIVERY ADDRESS TEXT
                      ///
                      ///
                      Text(
                        "Delivery Address",
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              height: 1.445,
                              color: const Color(0xcc373737),
                            ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),

                      /// DELIVERY ADDRESS LIST WIDGET
                      ///
                      /// SHOW ADDRESS
                      /// SHOW PINCODE
                      /// SHOW LOCATION
                      checkoutProvider.addressListModel?.addressList?.length ==
                                  0 ||
                              checkoutProvider
                                      .addressListModel?.addressList?.length ==
                                  null
                          ? Container()
                          : ListView.builder(
                              shrinkWrap: true,
                              reverse: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: checkoutProvider
                                  .addressListModel?.addressList?.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 5.0),
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        userModel.updateWith(
                                            addressId: checkoutProvider
                                                .addressListModel
                                                ?.addressList?[index]
                                                .id
                                                .toString());
                                        selectedIndex = index;
                                      });
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 10),
                                      decoration: BoxDecoration(
                                        color: AppColors.white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 8.0),
                                            child: Container(
                                              height: 15,
                                              width: 15,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                      color: AppColors
                                                          .primaryBlue)),
                                              child: Center(
                                                child: Container(
                                                  height: 10,
                                                  width: 10,
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: selectedIndex ==
                                                              index
                                                          ? AppColors
                                                              .primaryBlue
                                                          : AppColors.white),
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                70,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width -
                                                      100,
                                                  child: Text(
                                                    checkoutProvider
                                                            .addressListModel
                                                            ?.addressList?[
                                                                index]
                                                            .address ??
                                                        "",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyText1
                                                        ?.copyWith(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          height: 1.5,
                                                          color: const Color(
                                                              0xff373737),
                                                        ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  checkoutProvider
                                                          .addressListModel
                                                          ?.addressList?[index]
                                                          .pincode ??
                                                      "",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyText1
                                                      ?.copyWith(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        height: 1.5,
                                                        color: const Color(
                                                            0xff373737),
                                                      ),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                      const SizedBox(
                        height: 5,
                      ),

                      /// ADD ADDRESS SECTION IF ISLOADING IS BECOME TRUE
                      ///
                      ///
                      /// ################################
                      isLoading == true
                          ? Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const Address(),
                                        ));
                                  },
                                  child: CommonTextField(
                                    hintText: userModel.placeName ??
                                        "Pick your address",
                                    enabled: false,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                CommonTextField(
                                  hintText: "Postal Code",
                                  controller: postCTLR,
                                  textInputType: TextInputType.number,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                InkWell(
                                  onTap: () {
                                    if (postCTLR.text.isEmpty ||
                                        userModel.placeName == null ||
                                        userModel.placeName == "null" ||
                                        userModel.placeName == "") {
                                      SnackBarMessage(
                                          context, "All fields are required");
                                    } else {
                                      Provider.of<CheckoutProvider>(context,
                                              listen: false)
                                          .addAddressFUNC(
                                              userID: userModel.userId,
                                              address: userModel.placeName,
                                              lat: userModel.lat,
                                              lng: userModel.lng,
                                              pincode: postCTLR.text)
                                          .then((value) {
                                        userModel.updateWith(placeName: "");
                                        postCTLR.clear();
                                        checkoutProvider.getAddressFUNC(
                                            userId: userModel.userId);
                                      });
                                      setState(() {
                                        isLoading = false;
                                      });
                                    }
                                  },
                                  child: Container(
                                    width: 200,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 10),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: AppColors.primaryBlue),
                                      color: AppColors.white,
                                      borderRadius: BorderRadius.circular(12),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Color(0x19000000),
                                          offset: Offset(0, 1),
                                          blurRadius: 2,
                                        ),
                                      ],
                                    ),
                                    child: Center(
                                      child: Text(
                                        "+ Add New Address",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1
                                            ?.copyWith(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.primaryBlue,
                                            ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            )
                          : InkWell(
                              onTap: () {
                                setState(() {
                                  isLoading = true;
                                });
                              },
                              child: Container(
                                width: 200,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: AppColors.primaryBlue),
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color(0x19000000),
                                      offset: Offset(0, 1),
                                      blurRadius: 2,
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: Text(
                                    "+ Add New Address",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        ?.copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.primaryBlue,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                      const SizedBox(
                        height: 15,
                      ),

                      /// PAYMENT METHOD
                      ///
                      ///
                      Text(
                        "Payment Method",
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              height: 1.445,
                              color: const Color(0xcc373737),
                            ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 2,
                        itemBuilder: (context, index) {
                          List paymentMethod = ["Razorpay", "Cash on delivery"];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 5.0),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  selectedPayment = index;
                                });
                              },
                              child: Container(
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Container(
                                        height: 15,
                                        width: 15,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                color: AppColors.primaryBlue)),
                                        child: Center(
                                          child: Container(
                                            height: 10,
                                            width: 10,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: selectedPayment == index
                                                    ? AppColors.primaryBlue
                                                    : AppColors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      paymentMethod[index],
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          ?.copyWith(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                            height: 1.5,
                                            color: const Color(0xff373737),
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
        bottomSheet: Padding(
          padding: const EdgeInsets.all(8.0),
          child: AppButton(
            onPressed: () {
              if (userModel.addressId == "null" ||
                  userModel.addressId == "" ||
                  userModel.addressId == null) {
                SnackBarMessage(context, "Address Missing");
              } else {
                debugPrint(userModel.userId);
                debugPrint(userModel.serviceId);
                debugPrint(userModel.name);
                debugPrint(userModel.number);
                debugPrint(userModel.email);
                debugPrint(userModel.query);
                debugPrint(userModel.addressId);
                getPayment();
              }
              //
            },
            text: "Pay $rupees ${userModel.servicePrice}",
            color: AppColors.primaryBlue,
            txtClr: AppColors.white,
            width: MediaQuery.of(context).size.width,
          ),
        ));
  }

  @override
  void initState() {
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, externalWallet);
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, paySuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, payError);
    Future.microtask(() {
      context.read<CheckoutProvider>().getAddressFUNC(
            userId: userModel.userId,
          );
    });
    userModel.updateWith(addressId: "");
    super.initState();
  }

  void paySuccess(PaymentSuccessResponse response) async {
    print("---Succcess---");
    Provider.of<CheckoutProvider>(context,listen: false).serviceBooking(
      context,
        userId: userModel.userId,
        addressId: userModel.addressId,
      serviceId: userModel.serviceId,
      name: userModel.name,
      phone: userModel.phone,
      email: userModel.email,
      query: userModel.query
    ).then((value) => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ServiceOrderPlaced(),)));
  }

  void payError(PaymentFailureResponse response) {
    print("---Failure---");
    print(response.message! + response.code.toString());
  }

  void externalWallet(ExternalWalletResponse response) {
    print("---ExternalWallet---");
    print(response.walletName);
  }

  getPayment() {
    var options = {
      'key': "rzp_test_YPPy2atb2bUKDB",
      'amount': int.parse(userModel.servicePrice.toString())*100,
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
