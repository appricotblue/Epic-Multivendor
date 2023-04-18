import 'package:cached_network_image/cached_network_image.dart';
import 'package:epic_multivendor/apis/api_endpoints.dart';
import 'package:epic_multivendor/screens/my_service_details/my_service_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../../../helper/helper_color.dart';
import '../../../../helper/helper_images.dart';
import '../../../../helper/helper_shimmer.dart';
import '../../../../helper/helper_style.dart';
import '../../../../helper/model/user_model.dart';
import '../../my_order&service_provider.dart';

class ServiceOrderUI extends StatefulWidget {
  const ServiceOrderUI({super.key});

  @override
  State<ServiceOrderUI> createState() => _ServiceOrderUIState();
}

class _ServiceOrderUIState extends State<ServiceOrderUI> {
  var userModel = Get.find<UserModel>();
  @override
  Widget build(BuildContext context) {
    MyOrderProvider myOrderProvider = context.watch<MyOrderProvider>();
    return myOrderProvider.isLoading?ShimmerLoader().shimmerService(context):
    SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${myOrderProvider.myServicsListModel?.services?.length ?? 0} Items",
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  ?.copyWith(color: AppColors.lightGrey),
            ),
            const SizedBox(
              height: 10,
            ),
            myOrderProvider.myServicsListModel?.services?.length == 0 ||
                myOrderProvider.myServicsListModel?.services?.length == null ?
                Center(child: Image.asset(AppAssetsImages.noService1),):
            ListView.builder(
                itemCount: myOrderProvider.myServicsListModel?.services?.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.only(bottom: 5.0),
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => MyServiceDetails(
                            serviceId:myOrderProvider.myServicsListModel?.services?[index].id.toString()
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
                                  imageUrl: "${ApiEndPoints.imageBaseURL}${myOrderProvider.myServicsListModel?.services?[index].imageUrl}",
                                  width: 70,
                                  height: 70,
                                  fit: BoxFit.fill,
                                  placeholder: (context, url) => ShimmerLoader()
                                      .shimmerImageProduct(context, width: 70.0),
                                  errorWidget: (context, url, error) =>
                                      Image.asset(
                                    AppAssetsImages.noService1,
                                    height: 70,
                                    color: AppColors.secondaryBlue,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 230,
                                    child: Text(
                                      myOrderProvider.myServicsListModel?.services?[index].serviceTitle ?? "",
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
                                    "Booking Id : ${myOrderProvider.myServicsListModel?.services?[index].bookingId}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w300,
                                            height: 1.445,
                                            color: const Color(0x99363636),
                                            overflow: TextOverflow.ellipsis),
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  Text(
                                    "$rupees ${myOrderProvider.myServicsListModel?.services?[index].price ?? ""}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            height: 1.445,
                                            color: AppColors.primaryBlue,
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
  @override
  void initState() {
    Future.microtask(() {
      context.read<MyOrderProvider>().myServiceList(
          userId: userModel.userId);
    });
    super.initState();
  }
}
