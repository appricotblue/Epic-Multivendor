import 'package:flutter/material.dart';
import '../../../../../helper/widgets/common_list.dart';
import '../../../../../helper/widgets/common_view_all.dart';
import '../../../common_shopProduct/common_shopProduct.dart';

class CommonWithinKMUI extends StatelessWidget {
  const CommonWithinKMUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CommonViewAllWithTitle(
          title: "Within 3KM",
          viewAll: "View All",
          onTap: () {},
        ),
        const SizedBox(
          height: 5,
        ),
        GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 210.0,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
          ),
          itemCount: 3,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, i) {
            return CommonListWidget(
              image: "",
              title: "Title",
              type: "Kakkanad",
              ratingViews: "2.4k",
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CommonShopProduct(),
                    ));
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
