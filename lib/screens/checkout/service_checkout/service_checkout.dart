import 'package:epic_multivendor/screens/checkout/checkout_provider.dart';
import 'package:epic_multivendor/screens/checkout/service_checkout/ui/service_checkout_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ServiceCheckout extends StatelessWidget {
  const ServiceCheckout({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => CheckoutProvider(), child: ServiceCheckoutUI());
  }
}
