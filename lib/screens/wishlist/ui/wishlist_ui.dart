import 'package:epic_multivendor/helper/helper_color.dart';
import 'package:epic_multivendor/screens/wishlist/ui/wishlist_product.dart';
import 'package:epic_multivendor/screens/wishlist/ui/wishlist_service.dart';
import 'package:epic_multivendor/screens/wishlist/wishlist_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../helper/model/user_model.dart';

class WishListUI extends StatefulWidget {
  const WishListUI({super.key});

  @override
  State<WishListUI> createState() => _WishListUIState();
}

class _WishListUIState extends State<WishListUI> {
  int selectedIndex = 0;
  var userModel = Get.find<UserModel>();
  @override
  Widget build(BuildContext context) {
    print(userModel.userId);
    return WillPopScope(
      onWillPop: () async {
         await SystemNavigator.pop();
         return true;
      },
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: selectedIndex == 0
              ? AppColors.scaffoldGreen
              : AppColors.scaffoldBlue,
          appBar: PreferredSize(
              preferredSize: const Size.fromHeight(100),
              child: AppBar(
                elevation: 0,
                backgroundColor: AppColors.white,
                leading: IconButton(
                    onPressed: () async{
                       await SystemNavigator.pop();
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: AppColors.black,
                    )),
                title: Text(
                  "Wishlist",
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(color: AppColors.black),
                ),
                bottom: TabBar(
                  onTap: (i) {
                    setState(() {
                      selectedIndex = i;
                    });
                  },
                  indicatorColor: selectedIndex == 0
                      ? AppColors.primaryGreen
                      : AppColors.primaryBlue,
                  labelColor: AppColors.black,
                  tabs: const [
                    Tab(
                      text: "Products",
                    ),
                    Tab(text: "Services"),
                  ],
                ),
              )),
          body: const TabBarView(
            children: [WishListProduct(), WishListService()],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    Future.microtask(() {
      context.read<WishListProvider>().wishListProduct(userId: userModel.userId);
    });
    super.initState();
  }
}
