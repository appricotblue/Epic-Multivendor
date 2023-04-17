import 'package:epic_multivendor/screens/checkout/address/ui/address.dart';
import 'package:epic_multivendor/screens/checkout/checkout_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Address extends StatelessWidget {
  const Address({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CheckoutProvider(),
        child: const AddressPage());
  }
}
