import 'package:flutter/material.dart';

import '../helper_color.dart';

class CommonSearchBar extends StatelessWidget {
  CommonSearchBar({Key? key, this.controller, this.hintText, this.onPressed})
      : super(key: key);
  final TextEditingController? controller;
  final String? hintText;
  void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        decoration: BoxDecoration(
            color: AppColors.white, borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
                hintText: hintText,
                hintStyle: Theme.of(context).textTheme.bodyText1?.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      height: 1.445,
                      color: const Color(0xffa4a4a4),
                    ),
                suffixIcon: IconButton(
                    onPressed: onPressed, icon: const Icon(Icons.search)),
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none),
          ),
        ));
  }
}
