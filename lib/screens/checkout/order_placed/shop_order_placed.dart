import 'package:epic_multivendor/helper/helper_color.dart';
import 'package:epic_multivendor/helper/helper_routes.dart';
import 'package:epic_multivendor/helper/widgets/button.dart';
import 'package:epic_multivendor/screens/bottom/bottom_nav.dart';
import 'package:epic_multivendor/screens/my_order&services/my_order&service.dart';
import 'package:flutter/material.dart';

import '../../home/home.dart';

class ShopOrderPlaced extends StatelessWidget {
  const ShopOrderPlaced({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBlue,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back,
              color: AppColors.black,
            )),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              color: AppColors.white,
              child: Column(
                children: [
                  CircleAvatar(
                      radius: 15,
                      backgroundColor: AppColors.primaryGreen,
                      child: Icon(Icons.check,color: AppColors.white,)),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Order Placed Successfully'",
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        height: 1.445,
                        color: AppColors.primaryGreen),
                  ),
                  Text(
                    "You can see your booking in my bookings",
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      height: 1.445,
                      color: const Color(0xff333333),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  AppButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const MyOrderServices(),));
                    },
                    text: "Go to my Order",
                    color: AppColors.primaryGreen,
                    txtClr: AppColors.white,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
