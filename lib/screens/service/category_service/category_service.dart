

import 'package:epic_multivendor/screens/service/category_service/ui/category_service_ui.dart';
import 'package:epic_multivendor/screens/service/service_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CateroryService extends StatelessWidget {
  const CateroryService({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ServiceProvider(),
        child: const CategoryServiceUI());
  }
}