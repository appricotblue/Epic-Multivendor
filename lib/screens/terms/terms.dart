import 'package:epic_multivendor/screens/splash/splash_provider.dart';
import 'package:epic_multivendor/screens/terms/ui/terms.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class Terms extends StatelessWidget {
  const Terms({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SplashProvider(),
      child: TermsUI(),
    );
  }
}