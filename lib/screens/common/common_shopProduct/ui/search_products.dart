import 'package:epic_multivendor/screens/common/common_shopProduct/ui/search_products_ui.dart';
import 'package:epic_multivendor/screens/home/home_provider.dart';
import 'package:epic_multivendor/screens/home/ui/widget/search_shop_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class SearchProducts extends StatelessWidget {
  SearchProducts({super.key,this.searchKey});
  String? searchKey;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => HomeProvider(),
         child: const SearchProductUI());
  }
}
