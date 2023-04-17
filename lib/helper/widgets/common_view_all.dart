import 'package:flutter/material.dart';

import '../helper_color.dart';

class CommonViewAllWithTitle extends StatelessWidget {
  CommonViewAllWithTitle({Key? key, this.title, this.viewAll, this.onTap,this.color})
      : super(key: key);
  final String? title, viewAll;
  void Function()? onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title!,
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  height: 1.445,
                  color:color?? AppColors.primaryGreen,
                ),
          ),
          InkWell(
            onTap:onTap,
            child: Text(
              "",
              style: Theme.of(context).textTheme.bodyText1?.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    height: 1.445,
                    color: AppColors.lightGrey,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

