import 'package:epic_multivendor/helper/helper_color.dart';
import 'package:epic_multivendor/helper/helper_logger.dart';
import 'package:epic_multivendor/helper/helper_shimmer.dart';
import 'package:epic_multivendor/helper/helper_style.dart';
import 'package:epic_multivendor/screens/cart/cart.dart';
import 'package:epic_multivendor/screens/checkout/address/address.dart';
import 'package:epic_multivendor/screens/checkout/address/ui/address.dart';
import 'package:epic_multivendor/screens/checkout/checkout_provider.dart';
import 'package:epic_multivendor/screens/checkout/order_placed/shop_order_placed.dart';
import 'package:epic_multivendor/screens/splash/splash_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_web/razorpay_web.dart';
import '../../../../helper/model/user_model.dart';
import '../../../../helper/widgets/button.dart';
import '../../../../helper/widgets/common_textfield.dart';

class ShopCheckoutUI extends StatefulWidget {
  ShopCheckoutUI({this.isAdrress,this.isOrder,this.productId,this.productAmount,this.quantity});
  String? isAdrress;
  String? isOrder;
  final String? productId;
  final String? productAmount;
  final int? quantity;
  @override
  State<ShopCheckoutUI> createState() => _ShopCheckoutUIState();
}

class _ShopCheckoutUIState extends State<ShopCheckoutUI> {
  
  int? selectedIndex;
  int? selectedPayment = 0;
  var userModel = Get.find<UserModel>();
  final razorpay = Razorpay();
  double? deliveryAmount;
  double? totalAmount;
 
  TextEditingController postCTLR = TextEditingController();
  TextEditingController houseNumberCTLR = TextEditingController();
  TextEditingController landMrakCTLR = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool? isLoading = widget.isAdrress == null?false:true;
    CheckoutProvider checkoutProvider = context.watch<CheckoutProvider>();
    deliveryAmount  =  double.parse(checkoutProvider.deliveryAmount);
    totalAmount     = (deliveryAmount ?? 0) + (userModel.orderAmount ?? 0);

  
    return Scaffold(
        backgroundColor: AppColors.scaffoldBlue,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Cart(),));
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
        body:checkoutProvider.isLoading?ShimmerLoader().shimmerProduct(context): SingleChildScrollView(
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
                checkoutProvider.addressListModel?.addressList?.length == 0||
                    checkoutProvider.addressListModel?.addressList?.length == null?
                    Container():
                ListView.builder(
                  shrinkWrap: true,
                  reverse: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: checkoutProvider.addressListModel?.addressList?.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 5.0),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            userModel.updateWith(addressId: checkoutProvider.addressListModel?.addressList?[index].id.toString());
                            selectedIndex = index;
                            Provider.of<CheckoutProvider>(context,listen: false).deliveryCalculation(context,
                              fromLatitude: "${userModel.lat}",
                              fromLongitude: "${userModel.lng}",
                              toLatitude: "${checkoutProvider.addressListModel?.addressList?[index].latitude}",
                              toLongitude: "${checkoutProvider.addressListModel?.addressList?[index].longitude}"
                            );
                           
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
                                          color: AppColors.primaryGreen)),
                                  child: Center(
                                    child: Container(
                                      height: 10,
                                      width: 10,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: selectedIndex == index
                                              ? AppColors.primaryGreen
                                              : AppColors.white),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width - 70,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width-100,
                                      child: Text(
                                        checkoutProvider.addressListModel?.addressList?[index].address ?? "",
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
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                        checkoutProvider.addressListModel?.addressList?[index].pincode ?? "",
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
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Address(),));
                            },
                            child: CommonTextField(
                              hintText: userModel.placeName == ""?"Pick your address":userModel.placeName,
                              enabled: false,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          CommonTextField(
                            hintText: "pincode",
                            controller: postCTLR,
                            textInputType: TextInputType.number,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          CommonTextField(
                            hintText: "house number",
                            controller: houseNumberCTLR,
                            textInputType: TextInputType.number,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          CommonTextField(
                            hintText: "land mark",
                            controller: landMrakCTLR,
                            textInputType: TextInputType.text,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          InkWell(
                            onTap: () {
                            if(postCTLR.text.isEmpty || userModel.placeName == null || userModel.placeName == "null"||
                            userModel.placeName == "" || houseNumberCTLR.text.isEmpty || landMrakCTLR.text.isEmpty){
                              SnackBarMessage(context, "All fields are required");
                            }else{
                              Provider.of<CheckoutProvider>(context,
                                  listen: false)
                                  .addAddressFUNC(
                                  userID: userModel.userId,
                                  address: userModel.placeName,
                                  lat: userModel.lat,
                                  lng: userModel.lng,
                                  pincode: postCTLR.text,
                                  houseNumber: houseNumberCTLR.text,
                                  landMark: landMrakCTLR.text
                              ).then((value) {
                                userModel.updateWith(placeName: "");
                                postCTLR.clear();
                                houseNumberCTLR.clear();
                                landMrakCTLR.clear();
                                checkoutProvider.getAddressFUNC(userId: userModel.userId);
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
                                border:
                                    Border.all(color: AppColors.primaryGreen),
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
                                  "ADD ",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      ?.copyWith(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.primaryGreen,
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
                            // isLoading = true;
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Address(),));
                          });
                        },
                        child: Container(
                          width: 200,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          decoration: BoxDecoration(
                            border: Border.all(color:AppColors.primaryGreen),
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
                                    color: AppColors.primaryGreen,
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
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    List paymentMethod = ["Online Payment"];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 5.0),
                      child: InkWell(
                        onTap: (){
                          
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
                                          color: AppColors.primaryGreen)),
                                  child: Center(
                                    child: Container(
                                      height: 10,
                                      width: 10,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color:selectedPayment == index?AppColors.primaryGreen: AppColors.white
                                      ),
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
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Sub Total",
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            height: 1.445,
                            color: const Color(0xcc373737),
                          ),
                    ),
                    Text(
                      "$rupees ${userModel.orderAmount}",
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            height: 1.445,
                            color: const Color(0xcc373737),
                          ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Delivery Charge",
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            height: 1.445,
                            color: const Color(0xcc373737),
                          ),
                    ),
                    Text(
                      "$rupees $deliveryAmount",
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            height: 1.445,
                            color: const Color(0xcc373737),
                          ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Divider(
                  color: AppColors.lightGrey,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total Amount",
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            height: 1.445,
                            color: Colors.black,
                          ),
                    ),
                    Text(
                      "$rupees $totalAmount",
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            height: 1.445,
                            color: Colors.black,
                          ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                
              ],
            ),
          ),
        ),
        bottomSheet: Padding(
          padding: const EdgeInsets.all(8.0),
          child: AppButton(
            onPressed: () {
              print(userModel.orderAmount);
              if(userModel.addressId == null || userModel.addressId == ""){
                SnackBarMessage(context, "Address MIssing");
              }else if(deliveryAmount == 0.0){
                SnackBarErrorMessage(context, "No service is available between these regions.No intercity service is available.");
              }
              else{
                if(selectedPayment == 0){
                  getPayment();
                }else{
                  widget.isOrder == "true"? Provider.of<CheckoutProvider>(context,listen: false).buyNow(
                    orderAmount: totalAmount,
                    userId: userModel.userId,
                    addressId: userModel.addressId,
                    paymentStatus: "UnPaid",
                    paymentMethod: "Cash On Delivery",
                    productId: widget.productId,
                    productAmount: widget.productAmount,
                    quantity: widget.quantity,
                    deliveryAmount: deliveryAmount
                  ).then((value) {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ShopOrderPlaced(),));
                  }):
                  
                  Provider.of<CheckoutProvider>(context,listen: false).placeOrder(
                    orderAmount: totalAmount,
                    userId: userModel.userId,
                    addressId: userModel.addressId,
                    paymentMethod: "Cash On Delivery",
                    deliveryAmount: deliveryAmount
                  ).then((value) => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ShopOrderPlaced(),)));
                }
                
              }
            },
            text: "Checkout",
            color: AppColors.primaryGreen,
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
          userId: userModel.userId,);
      Provider.of<SplashProvider>(context,listen: false).mySettingsFUNC(context);
    });
    super.initState();
  }
  void paySuccess(PaymentSuccessResponse response) async {
    print("---Succcess---");
    widget.isOrder == "true"? Provider.of<CheckoutProvider>(context,listen: false).buyNow(
      orderAmount: totalAmount,
      userId: userModel.userId,
      addressId: userModel.addressId,
      paymentStatus: "Paid",
      paymentMethod: "Razorpay",
      productId: widget.productId,
      productAmount: widget.productAmount,
      quantity: widget.quantity
     
    ).then((value) => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ShopOrderPlaced(),))):

    Provider.of<CheckoutProvider>(context,listen: false).placeOrder(
      orderAmount: totalAmount,
      userId: userModel.userId,
      addressId: userModel.addressId,
      paymentMethod: "Razorpay"
    ).then((value) => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ShopOrderPlaced(),)));
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
      'key': Provider.of<SplashProvider>(context, listen: false).settingsModel?.razorpayKey,
      'amount': totalAmount! * 100,
      'name': "",

    };
    try {
      razorpay.open(options);
    } catch (e) {
      print("error $e");
    }
  }
}
