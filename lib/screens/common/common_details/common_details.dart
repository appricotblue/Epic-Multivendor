import 'package:epic_multivendor/screens/common/common_details/ui/common_details_ui.dart';
import 'package:epic_multivendor/screens/common/common_provider.dart';
import 'package:epic_multivendor/screens/shops/shop_details/shop_details_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class CommonProductDetails extends StatelessWidget {
  const CommonProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ShopDetailsProvider(),
         child: const CommonProductDetailsUI());
  }
}
