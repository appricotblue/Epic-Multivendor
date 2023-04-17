import 'package:epic_multivendor/screens/common/common_category/ui/common_category_ui.dart';
import 'package:epic_multivendor/screens/common/common_provider.dart';
import 'package:epic_multivendor/screens/shops/shop_category/shop_category_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class CommonCategory extends StatelessWidget {
  const CommonCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ShopCategoryProvider(),
         child: const CommonCategoryUI());
  }
}
