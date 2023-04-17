

import 'package:epic_multivendor/screens/shops/shop_category/ui/shop_category_ui.dart';
import 'package:epic_multivendor/screens/shops/shop_details/shop_details_provider.dart';
import 'package:epic_multivendor/screens/shops/shop_details/ui/shop_details_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopDetails extends StatelessWidget {
  const ShopDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ShopDetailsProvider(),
        child: const ShopDetailsUI());
  }
}