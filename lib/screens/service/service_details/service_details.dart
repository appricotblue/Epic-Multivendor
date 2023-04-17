import 'package:epic_multivendor/screens/service/service_details/ui/service_details_ui.dart';
import 'package:epic_multivendor/screens/service/service_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ServiceDetails extends StatelessWidget {
  const ServiceDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ServiceProvider(),
        child: const ServiceDetailsUI());
  }
}