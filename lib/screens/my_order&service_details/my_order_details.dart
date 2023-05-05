import 'package:epic_multivendor/screens/my_order&service_details/my_order_details_provider.dart';
import 'package:epic_multivendor/screens/my_order&service_details/ui/my_order_details_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyOrderDetails extends StatelessWidget {
  const MyOrderDetails({super.key,this.orderId,this.orderKey});
  final String? orderId;
  final String? orderKey;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyOrderDetailsProvider(),
      child: MyOrderDetailsUI(
        orderId:orderId,
        orderKey: orderKey,
      ),
    );
  }
}