
import 'package:epic_multivendor/screens/service/branded_service/ui/branded_service_ui.dart';
import 'package:epic_multivendor/screens/service/service_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BrandedService extends StatelessWidget {
  const BrandedService({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ServiceProvider(),
        child:const  BrandedServicesUI());
  }
}