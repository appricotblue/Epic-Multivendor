import 'package:epic_multivendor/screens/prime/prime_provider.dart';
import 'package:epic_multivendor/screens/prime/ui/prime_ui.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class Prime extends StatelessWidget {
  const Prime({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PrimeProvider(),
      child: const PrimeUI());
  }
}