
import 'package:epic_multivendor/screens/shops/shop_products/shop_product_provider.dart';
import 'package:epic_multivendor/screens/shops/shop_products/ui/shop_product_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopProduct extends StatelessWidget {
  const ShopProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ShopProductProvider(),
        child: const ShopProductUI());
  }
}