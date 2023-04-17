import 'dart:developer';

import 'package:epic_multivendor/helper/helper_color.dart';
import 'package:epic_multivendor/helper/helper_logger.dart';
import 'package:epic_multivendor/helper/model/user_model.dart';
import 'package:epic_multivendor/helper/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../bottom/bottom_nav.dart';
import '../../login/login_provider.dart';

class OTPUI extends StatefulWidget {
  OTPUI({Key? key}) : super(key: key);

  @override
  State<OTPUI> createState() => _OTPUIState();
}

class _OTPUIState extends State<OTPUI> {
  TextEditingController otpCTLR = TextEditingController();

  final bool? isLoading = false;
  var userModel = Get.find<UserModel>();

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<LoginProvider>(context);
    return Scaffold(
      backgroundColor: AppColors.white,
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
      ),
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            final double width = constraints.maxWidth;
            final double height = constraints.maxHeight;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "We ‘ve sent a verification code to",
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: AppColors.black,
                  ),
                ),
                Text(
                  userModel.phone.toString() ?? "",
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      fontWeight: FontWeight.w400, color: AppColors.black),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 20, bottom: 10, left: 20, right: 20),
                  child: PinCodeTextField(
                    appContext: context,
                    controller: otpCTLR,
                    length: 4,
                    keyboardType: TextInputType.phone,
                    boxShadows: [
                      BoxShadow(
                        offset: const Offset(0, 1),
                        color: Colors.white.withOpacity(.3),
                        blurRadius: 1,
                      )
                    ],
                    pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(5),
                        fieldHeight: 50,
                        fieldWidth: 60,
                        fieldOuterPadding:
                        const EdgeInsets.only(right: 10, left: 10),
                        activeFillColor: AppColors.black.withOpacity(.3),
                        activeColor: AppColors.black.withOpacity(.3),
                        selectedColor: AppColors.black.withOpacity(.3),
                        disabledColor: AppColors.black.withOpacity(.3),
                        inactiveColor: AppColors.black.withOpacity(.3),
                        inactiveFillColor: AppColors.black.withOpacity(.3)),
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    onChanged: (value) {},
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: (){
                    log(userModel.phone.toString());
                    prov.loginFUNC(userModel.phone.toString());
                  },
                  child: SizedBox(
                    height: 40,
                    width: 200,
                    child: Center(
                      child: Text(
                        "Resend OTP",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            ?.copyWith(color: AppColors.secondaryGreen),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                AppButton(
                  onPressed: () {
                    __otpLoginFUNC();
                  },
                  text: "Verify",
                  width: width - 50,
                  isLoading: prov.isLoading,
                  txtClr: AppColors.white,
                )
                // SizedBox(
                //   width: 152,
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Text("Resend OTP In",style: Theme.of(context).textTheme.bodyText1?.copyWith(color: AppColors.black),),
                //       Text("30s",style: Theme.of(context).textTheme.bodyText1?.copyWith(color: AppColors.secondaryGreen),),
                //     ],
                //   ),
                // ),
              ],
            );
          }),
    );
  }

  __otpLoginFUNC() async{
    final pref = await SharedPreferences.getInstance();
    if (otpCTLR.text == userModel.otp) {
      pref.setString("userId", userModel.userId.toString());
      SnackBarMessage(context, "Login Success");
      Navigator.push(context, MaterialPageRoute(builder: (context) => const BottomBarScreen(),));
    } else {
      SnackBarMessage(context, "Invalid OTP");
    }
  }
}
