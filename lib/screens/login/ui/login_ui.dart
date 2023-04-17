import 'package:epic_multivendor/helper/helper_color.dart';
import 'package:epic_multivendor/helper/helper_logger.dart';
import 'package:epic_multivendor/helper/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';
import '../../../helper/helper_images.dart';
import '../../../helper/widgets/button.dart';
import '../../otp/otp.dart';
import '../login_provider.dart';

class LoginUI extends StatefulWidget {
  LoginUI({Key? key}) : super(key: key);

  @override
  State<LoginUI> createState() => _LoginUIState();
}

class _LoginUIState extends State<LoginUI> {
  TextEditingController phoneCTLR = TextEditingController();
  var userModel = Get.find<UserModel>();

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<LoginProvider>(context);
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final double width = constraints.maxWidth;
          final double height = constraints.maxHeight;
          return SingleChildScrollView(
            child: Container(
              width: width,
              height: height,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AppAssetsImages.login),
                    fit: BoxFit.fill,
                  )),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 80,
                    ),
                    SvgImage(AppSvgImages.epic, context, size: 80.0),
                    const SizedBox(
                      height: 50,
                    ),
                    Text("Login",
                        style: Theme.of(context)
                            .textTheme
                            .headline3
                            ?.copyWith(color: AppColors.white)),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: width,
                        height: 215,
                        margin: const EdgeInsets.only(left: 10, right: 10),
                        decoration: BoxDecoration(
                          color: AppColors.whiteWithOpacity,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.boxShadow,
                              offset: const Offset(0, 4),
                              blurRadius: 3.5,
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColors.white,
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 100,
                                      child: IntlPhoneField(
                                        flagsButtonPadding:
                                        const EdgeInsets.all(15),
                                        keyboardType: TextInputType.phone,
                                        disableLengthCheck: true,
                                        showCountryFlag: true,
                                        initialCountryCode: 'IN',
                                        enabled: false,
                                        dropdownTextStyle: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width -
                                          180,
                                      child: TextField(
                                        controller: phoneCTLR,
                                        keyboardType: TextInputType.number,
                                        style: TextStyle(
                                            color: AppColors.black,
                                            fontSize: 17),
                                        inputFormatters: [
                                          LengthLimitingTextInputFormatter(10)
                                        ],
                                        decoration: const InputDecoration(
                                            hintText: "Phone Number",
                                            enabledBorder: InputBorder.none,
                                            errorBorder: InputBorder.none,
                                            disabledBorder: InputBorder.none,
                                            focusedBorder: InputBorder.none),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            AppButton(
                              onPressed: () {
                                if (phoneCTLR.text.isEmpty) {
                                  SnackBarMessage(
                                      context, "Phone number missing");
                                } else {
                                  userModel.updateWith(phone: phoneCTLR.text);
                                  prov.loginFUNC(phoneCTLR.text).then((value) =>
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => const  OTP())));                              }
                              },
                              width: width - 60,
                              text: 'Sent Otp',
                              isLoading: prov.isLoading,
                              txtClr: AppColors.white,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "By Clicking you agree to our Terms & Policy",
                              style: Theme.of(context).textTheme.subtitle1,
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 80,
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
