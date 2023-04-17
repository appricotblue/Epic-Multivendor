import 'package:flutter/material.dart';
import '../../../../../helper/widgets/common_screen_product_list.dart';
import '../../../../../helper/widgets/common_view_all.dart';
import '../../../common_details/common_details.dart';

class CommonProductForYouCollection extends StatelessWidget {
  const CommonProductForYouCollection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CommonViewAllWithTitle(
          title: "Product For You Collections",
          viewAll: "View All",
        ),
        const SizedBox(
          height: 5,
        ),
        GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 245.0,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
          ),
          itemCount: 6,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, i) {
            return CommonScreenProductList(
              image: "",
              title: "Daily Angadi",
              type: "kakkanad",
              price: "200",
              strikedPrice: "300",
              onTap: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context) => const CommonProductDetails(),));
              },
            );
          },
        ),
        const SizedBox(
          height: 5,
        ),
      ],
    );
  }
}
