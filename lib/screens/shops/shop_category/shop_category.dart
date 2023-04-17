

import 'package:epic_multivendor/screens/shops/shop_category/shop_category_provider.dart';
import 'package:epic_multivendor/screens/shops/shop_category/ui/shop_category_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopCategory extends StatelessWidget {
  const ShopCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ShopCategoryProvider(),
        child: const ShopCategoryUI());
  }
}