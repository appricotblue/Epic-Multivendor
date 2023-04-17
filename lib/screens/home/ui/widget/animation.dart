import 'package:epic_multivendor/helper/helper_images.dart';
import 'package:flutter/material.dart';
import '../../../../helper/helper_color.dart';
// ignore: must_be_immutable
class AnimatedTab extends StatefulWidget {
  void Function()? firstTabTap, secondTabTaP;
  bool? isSelected,isFirstTab,isSecondTab;
  AnimatedTab(
      {super.key,this.isSelected,this.isFirstTab,this.isSecondTab, this.firstTabTap, this.secondTabTaP,});
  @override
  State<AnimatedTab> createState() => _AnimatedTabState();
}

class _AnimatedTabState extends State<AnimatedTab> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: widget.firstTabTap,
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width / 2.3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border:
                    Border.all(color: widget.isSelected == true ? Colors.grey : Colors.white),
                color: widget.isSelected == true
                    ? AppColors.white
                    : AppColors.primaryGreen,
                // color:isSecondTab?AppColors().primaryColor:AppColors().whiteColor
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: Image.asset(AppAssetsImages.product.toString()),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: widget.isSelected == true ? 0.0 : 12.0),
                    child:Text(
                      "Products",
                     style: Theme.of(context).textTheme.bodyText2?.copyWith(
                       color: widget.isSelected == true
                          ? AppColors.black
                          : AppColors.white,
                     ),)
                  )
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: widget.secondTabTaP,
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width / 2.3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border:
                    Border.all(color: widget.isSelected == true ? Colors.white : Colors.grey),
                color: widget.isSelected == true
                    ? AppColors.primaryBlue
                    : AppColors.white,
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: Image.asset(
                      AppAssetsImages.service.toString(),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: widget.isSelected == true ? 10.0 : 0.0),
                    child: Text(
                      "Services",
                     style: Theme.of(context).textTheme.bodyText2?.copyWith(
                       color: widget.isSelected == true
                          ? AppColors.white
                          : AppColors.black,
                     ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
  
}
