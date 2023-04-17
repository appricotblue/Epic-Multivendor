import 'package:epic_multivendor/screens/login/login_provider.dart';
import 'package:epic_multivendor/screens/login/ui/login_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => LoginProvider(),child: LoginUI(),);
  }
}
