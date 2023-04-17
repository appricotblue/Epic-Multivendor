import 'package:epic_multivendor/helper/model/user_model.dart';
import 'package:epic_multivendor/screens/my_order&services/my_order&service_provider.dart';
import 'package:epic_multivendor/screens/my_order&services/ui/widget/product_order.dart';
import 'package:epic_multivendor/screens/my_order&services/ui/widget/service_order.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../../helper/helper_color.dart';

class MyOrderAndServicesUI extends StatefulWidget {
  const MyOrderAndServicesUI({super.key});

  @override
  State<MyOrderAndServicesUI> createState() => _MyOrderAndServicesUIState();
}

class _MyOrderAndServicesUIState extends State<MyOrderAndServicesUI> {
  int selectedIndex = 0;
  var userModel = Get.find<UserModel>();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
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
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: AppColors.black,
                  )),
              title: Text(
                selectedIndex == 0? "My Orders":"My Services",
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
          children: [ProductOrderUI(), ServiceOrderUI()],
        ),
      ),
    );
  }
  @override
  void initState() {
    Future.microtask(() {
      context.read<MyOrderProvider>().myOrderList(
          userId: userModel.userId);
    });
    super.initState();
  }
}
