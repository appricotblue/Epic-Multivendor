import 'package:epic_multivendor/screens/checkout/shop_checkout/ui/shop_checkout_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../checkout_provider.dart';

class ShopCheckOut extends StatelessWidget {
  const ShopCheckOut({super.key,this.isAdrress,this.isOrder,this.productId,this.productAmount,this.quantity});
  final String? isAdrress;
  final String? isOrder; 
  final String? productId;
  final String? productAmount;
  final int? quantity;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => CheckoutProvider(), child: ShopCheckoutUI(
          isAdrress: isAdrress,isOrder:isOrder,
          productId: productId,
          productAmount: productAmount,
          quantity: quantity,
        ));
  }
}
