import 'package:epic_multivendor/screens/common/common_provider.dart';
import 'package:epic_multivendor/screens/common/common_shopProduct/ui/common_shopProduct_ui.dart';
import 'package:epic_multivendor/screens/shops/shop_products/shop_product_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class CommonShopProduct extends StatelessWidget {
  const CommonShopProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ShopProductProvider(),
         child: const CommonShopProductUI());
  }
}
