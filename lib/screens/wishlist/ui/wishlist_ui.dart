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

class _WishListUIState extends State<WishListUI> with SingleTickerProviderStateMixin{

  int selectedIndex = 0;
  var userModel = Get.find<UserModel>();
  late TabController _tabController;
  

  @override
  Widget build(BuildContext context) {
    print(userModel.userId);
    return WillPopScope(
      onWillPop: () async {
         await SystemNavigator.pop();
         return true;
      },
      child: Scaffold(
         backgroundColor: selectedIndex == 0?AppColors.scaffoldGreen: AppColors.scaffoldBlue,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: AppColors.white,
            title: Text(
              "My Wishlist",
              style: Theme.of(context).textTheme.headline6?.copyWith(color: AppColors.black),
            ),
          ),
          body: Column(
            children: [
              const SizedBox(height: 5,),
              Container(
                color: Colors.white,
                child: TabBar(
                  onTap: (i) {
                    setState(() {
                      selectedIndex = i;
                    });
                  },
                  controller: _tabController,
                  indicatorColor: selectedIndex == 0
                      ? AppColors.primaryGreen
                      : AppColors.primaryBlue,
                  labelColor: AppColors.black,
                  
                  tabs: const [
                    Tab(text: "Products"),
                    Tab(text: "Services"),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    WishListProduct(), 
                    WishListService()
                  ],
                ),
              ),
            ]),
      ),
    );
  }

  @override
  void initState() {
    Future.microtask(() {
      context.read<WishListProvider>().wishListProduct(userId: userModel.userId);
    });
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }
}
