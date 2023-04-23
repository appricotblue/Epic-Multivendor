

import 'package:epic_multivendor/screens/fashion/fashion_category/fashion_category_ui.dart';
import 'package:epic_multivendor/screens/shops/shop_category/shop_category_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FashionCategory extends StatelessWidget {
  const FashionCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ShopCategoryProvider(),
        child: const FashionCategoryUI());
  }
}