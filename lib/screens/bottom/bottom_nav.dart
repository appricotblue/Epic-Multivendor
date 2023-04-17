import 'package:flutter/material.dart';

import '../../helper/helper_color.dart';
import '../cart/cart.dart';
import '../home/home.dart';
import '../profile/profile.dart';
import '../wishlist/wishlist.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen();
  @override
  _BottomBarScreenState createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int? currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex =  0;
  }


  @override
  Widget build(BuildContext context) {
  List<Widget> screens = [
    Home(),
    WishList(),
    Cart(),
    Profile(),
  ];
    return Scaffold(
      // width: MediaQuery.of(context).size.width,
      // decoration: BoxDecoration(
      //   color: Colors.red,
      //   border: Border(
      //     bottom: BorderSide(width: 5.0, color: Color(0xFF4D56A4)),
      //   ),
      // ),
      body: Column(
        children: [
          Expanded(
              child: Container(
            child: screens[currentIndex!],
          )),
          BottomNavigationBar(
            currentIndex: currentIndex!,
            onTap: (int newindex) {
              currentIndex = newindex;
              setState(() {});
            },
            type: BottomNavigationBarType.fixed,
            backgroundColor: const Color(0xffffffff),
            unselectedFontSize: 12,
            selectedFontSize: 13,
            iconSize: 22,
            selectedItemColor: AppColors.primaryGreen,
            selectedLabelStyle:  TextStyle(
                fontWeight: FontWeight.bold, color: AppColors.primaryGreen),
            unselectedItemColor: AppColors.lightGrey,
            items: const [
               BottomNavigationBarItem(
                label: "Home", icon: Icon(Icons.home),
              ),
               BottomNavigationBarItem(
                label: "Wishlist", icon: Icon(Icons.favorite_outline),
              ),
               BottomNavigationBarItem(
                label: "Cart", icon: Icon(Icons.shopping_cart),
              ),
               BottomNavigationBarItem(
                label: "Account", icon: Icon(Icons.person),
              ),
            ],
          ),
        ],
      ),
    );
  }
  TextStyle menu =const TextStyle(
    fontSize: 15.0,
    color: Color(0xFF333333),
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w500,
  );
}
