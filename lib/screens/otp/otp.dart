import 'package:epic_multivendor/screens/login/login_provider.dart';
import 'package:epic_multivendor/screens/otp/ui/otp_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OTP extends StatelessWidget {
  const OTP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => LoginProvider(),child: OTPUI(),);
  }
}
