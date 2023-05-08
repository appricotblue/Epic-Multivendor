import 'package:epic_multivendor/helper/helper_color.dart';
import 'package:epic_multivendor/helper/helper_images.dart';
import 'package:epic_multivendor/helper/model/user_model.dart';
import 'package:epic_multivendor/helper/widgets/button.dart';
import 'package:epic_multivendor/screens/prime/prime_provider.dart';
import 'package:epic_multivendor/screens/splash/splash_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_web/razorpay_web.dart';

import '../../bottom/bottom_nav.dart';
import '../../home/home.dart';

class PrimeUI extends StatefulWidget {
  const PrimeUI({super.key});

  @override
  State<PrimeUI> createState() => _PrimeUIState();
}

class _PrimeUIState extends State<PrimeUI> {
  final razorpay = Razorpay();
  final userModel = Get.find<UserModel>();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
       onWillPop: () async {
         Navigator.push(context, MaterialPageRoute(builder: (context) => const BottomBarScreen(),));
         return true;
      },
      child: Scaffold(
        backgroundColor: AppColors.scaffoldGreen,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          leading: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back,color: AppColors.black,)),
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppAssetsImages.primeBottom),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    // getprimeunlockbenefitslikeVto (1047:1069)
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
                    child: Text(
                      'Get Prime & Unlock Benefits like',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            height: 1.445,
                            color: const Color(0xff000000),
                          ),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            // image68yxP (1047:1073)
                            margin: const EdgeInsets.fromLTRB(0, 0, 18, 0),
                            width: 19,
                            height: 19,
                            child: const Icon(Icons.border_outer_rounded),
                          ),
                          Container(
                            // image68yxP (1047:1073)
                            margin: const EdgeInsets.fromLTRB(0, 0, 18, 0),
                            width: 19,
                            height: 19,
                            child: const Icon(Icons.border_outer_rounded),
                          ),
                          Container(
                            // image68yxP (1047:1073)
                            margin: const EdgeInsets.fromLTRB(0, 0, 18, 0),
                            width: 19,
                            height: 19,
                            child: const Icon(Icons.border_outer_rounded),
                          ),
                          Container(
                            // image68yxP (1047:1073)
                            margin: const EdgeInsets.fromLTRB(0, 0, 18, 0),
                            width: 19,
                            height: 19,
                            child: const Icon(Icons.border_outer_rounded),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            // fastandfreedeliveryforallpurch (1047:1072)
                            'Fast and free delivery for all purchases',
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      height: 1.445,
                                      color: const Color(0xff000000),
                                    ),
                          ),
                          Text(
                            // fastandfreedeliveryforallpurch (1047:1072)
                            'Seasonal offers and discounts',
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      height: 1.445,
                                      color: const Color(0xff000000),
                                    ),
                          ),
                          Text(
                            // fastandfreedeliveryforallpurch (1047:1072)
                            'Grocery Giveaway on Seasonal Occasions',
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      height: 1.445,
                                      color: const Color(0xff000000),
                                    ),
                          ),
                          Text(
                            // fastandfreedeliveryforallpurch (1047:1072)
                            'Eligibility to participate in the lucky draw contest ',
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      height: 1.445,
                                      color: const Color(0xff000000),
                                    ),
                          ),
                          Text(
                            // fastandfreedeliveryforallpurch (1047:1072)
                            ' conducting on 1st January 2024',
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      height: 1.445,
                                      color: const Color(0xff000000),
                                    ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Image.asset(AppAssetsImages.primetop),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Join Prime For Only',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: 20.0621967316,
                      fontWeight: FontWeight.w600,
                      height: 1.0810000106,
                      color: const Color(0xfff09401),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Container(
                  width: 150,
                  height: 70,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  decoration: BoxDecoration(
                      color: const Color(0xffff9d00).withOpacity(.3),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: const Color(0xffff9d00).withOpacity(.3), width: 2)),
                  child: Column(
                    children: [
                      Text(
                        "Rs ${Provider.of<SplashProvider>(context,listen: false).settingsModel?.subscriptionAmount}",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.black),
                      ),
                      Text(
                        "Per Year",
                        style: TextStyle(
                            fontSize: 18,
                            color: AppColors.black),
                      ),
                    ],
                  ),
                ),
                  const SizedBox(
                    height: 20,
                  ),
                  AppButton(onPressed: (){
                    getPayment();
                  }, text: "Get Prime Now",width: 400,color: const Color(0xffff9d00),),
                  const SizedBox(
                    height: 170,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

    @override
  void initState() {

    Provider.of<SplashProvider>(context,listen: false).mySettingsFUNC(context);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, externalWallet);
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, paySuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, payError);
    Provider.of<SplashProvider>(context,listen: false).mySettingsFUNC(context);
    super.initState();
  }
   void paySuccess(PaymentSuccessResponse response) async {

    Provider.of<PrimeProvider>(context,listen: false).premiumUpdate(userId: userModel.userId).then((value) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const BottomBarScreen()));
    });
    // Navigator.push(
    //     context, MaterialPageRoute(builder: (context) => const PlaceOrderUI()));
    print(response.paymentId.toString());
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
      'amount': int.parse(Provider.of<SplashProvider>(context,listen: false).settingsModel?.subscriptionAmount ?? "") * 100,
      'name': "",
      'prefill': {'contact':"",
        'email': "",
      },
    };
    try {
      razorpay.open(options);
    } catch (e) {
      print("error $e");
    }
  }
}
