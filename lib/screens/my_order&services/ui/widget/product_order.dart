import 'package:cached_network_image/cached_network_image.dart';
import 'package:epic_multivendor/apis/api_endpoints.dart';
import 'package:epic_multivendor/screens/my_order&services/my_order&service_provider.dart';
import 'package:epic_multivendor/screens/my_order&service_details/my_order_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../helper/helper_color.dart';
import '../../../../helper/helper_images.dart';
import '../../../../helper/helper_shimmer.dart';
import '../../../../helper/helper_style.dart';

class ProductOrderUI extends StatefulWidget {
  const ProductOrderUI({super.key});

  @override
  State<ProductOrderUI> createState() => _ProductOrderUIState();
}

class _ProductOrderUIState extends State<ProductOrderUI> {
  @override
  Widget build(BuildContext context) {
    MyOrderProvider myOrderProvider = context.watch<MyOrderProvider>();
    return myOrderProvider.isLoading?ShimmerLoader().shimmerProduct(context):
      SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${  myOrderProvider.myOrderModel?.orders?.length} Items",
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  ?.copyWith(color: AppColors.lightGrey),
            ),
            const SizedBox(
              height: 10,
            ),
            

            myOrderProvider.myOrderModel?.orders?.length == 0 ||
                myOrderProvider.myOrderModel?.orders?.length == null ?
            Center(child: Image.asset(AppAssetsImages.noService1),):
            ListView.builder(
                itemCount: myOrderProvider.myOrderModel?.orders?.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.only(bottom: 5.0),
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => MyOrderDetails(
                            orderId:myOrderProvider.myOrderModel?.orders?[index].id.toString(),
                            orderKey: myOrderProvider.myOrderModel?.orders?[index].orderKey.toString(),

                          ),));
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.white),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    topLeft: Radius.circular(10)),
                                child: CachedNetworkImage(
                                  imageUrl: "${ApiEndPoints.imageBaseURL}${myOrderProvider.myOrderModel?.orders?[index].image}",
                                  width: 70,
                                  height: 70,
                                  fit: BoxFit.fill,
                                  placeholder: (context, url) => ShimmerLoader()
                                      .shimmerImageProduct(context, width: 70.0),
                                  errorWidget: (context, url, error) =>
                                      Image.asset(
                                    AppAssetsImages.noService1,
                                    height: 70,
                                    color: AppColors.secondaryGreen,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              // Text("${myOrderProvider.myOrderModel?.orders?[index].orderKey}"),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 230,
                                    child: Text(
                                     
                                    "Order Id :${myOrderProvider.myOrderModel?.orders?[index].orderId}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6
                                          ?.copyWith(
                                              fontWeight: FontWeight.w500,
                                              height: 1.445,
                                              color: const Color(0xff333333),
                                              overflow: TextOverflow.ellipsis),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  Text(
                                    "Order Status : ${myOrderProvider.myOrderModel?.orders?[index].orderStatus ?? ""}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600,
                                            height: 1.445,
                                            color: 
                                            myOrderProvider.myOrderModel?.orders?[index].orderStatus == "Pending"?
                                            Colors.amber:
                                             myOrderProvider.myOrderModel?.orders?[index].orderStatus == "Completed"?
                                             Colors.green:
                                             myOrderProvider.myOrderModel?.orders?[index].orderStatus == "On the way"?
                                             Colors.black:
                                             myOrderProvider.myOrderModel?.orders?[index].orderStatus == "Processing"?
                                             Colors.blue:Colors.black,
                                            overflow: TextOverflow.ellipsis),
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  Text(
                                    "$rupees ${myOrderProvider.myOrderModel?.orders?[index].orderAmount}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            height: 1.445,
                                            color: AppColors.primaryGreen,
                                            overflow: TextOverflow.ellipsis),
                                  ),
                                ],
                              ),
                              // IconButton(
                              //     onPressed: () {},
                              //     icon: Container(
                              //         decoration: BoxDecoration(
                              //             shape: BoxShape.circle,
                              //             border: Border.all(
                              //                 color: AppColors.white)),
                              //         child: Icon(
                              //           Icons.close_rounded,
                              //           size: 15,
                              //           color: AppColors.white,
                              //         )))
                            ],
                          ),
                        ),
                      ),
                    ))
          ],
        ),
      ),
    );
  }
}
