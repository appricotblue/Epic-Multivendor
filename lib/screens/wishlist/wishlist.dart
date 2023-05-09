import 'package:epic_multivendor/screens/wishlist/ui/wishlist_ui.dart';
import 'package:epic_multivendor/screens/wishlist/wishlist_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WishList extends StatelessWidget {
  const WishList({super.key});
  

  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider(
      create: (context) => WishListProvider(),
      child: const WishListUI());
  }
}