
import 'package:epic_multivendor/screens/category/category_product_ui.dart';
import 'package:epic_multivendor/screens/shops/shop_products/shop_product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryProduct extends StatelessWidget {
  const CategoryProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ShopProductProvider(),
        child: const CategoryProductUi());
  }
}