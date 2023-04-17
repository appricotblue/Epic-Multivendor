

import 'package:epic_multivendor/screens/my_order&services/my_order&service_provider.dart';
import 'package:epic_multivendor/screens/my_order&services/ui/my_order&service_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyOrderServices extends StatelessWidget {
  const MyOrderServices({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyOrderProvider(),
        child: const MyOrderAndServicesUI());
  }
}