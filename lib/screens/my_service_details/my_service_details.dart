import 'package:epic_multivendor/screens/my_order&service_details/my_order_details_provider.dart';
import 'package:epic_multivendor/screens/my_service_details/ui/my_service_details_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class MyServiceDetails extends StatelessWidget {
  const MyServiceDetails({super.key,this.serviceId});
  final String? serviceId;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyOrderDetailsProvider(),
      child: MyServiceDetailsUI(
        serviceId:serviceId
      ));
  }
}