import 'package:epic_multivendor/screens/my_order&service_details/model/my_service_details.dart';
import 'package:flutter/cupertino.dart';

import '../../apis/api_endpoints.dart';
import '../../apis/http_request.dart';
import '../../helper/helper_logger.dart';
import 'model/my-order-details.dart';

class MyOrderDetailsProvider extends ChangeNotifier {
  bool isLoading = true;
  setLoading(bool status) {
    isLoading = status;
    notifyListeners();
  }

  MyOrderDetailsModel? myOrderDetailsModel;
  MyServiceDetailsModel? myServiceDetailsModel;

  /// PRODUCT WISHLIST
  ///
  ///
  Future<MyOrderDetailsModel> myOrderListDetails({orderId}) async {
    try {
      setLoading(true);
      ApiResponse apiResponse = await ApiHelper().postData(
          data: {"order_id": "$orderId"},
          route: ApiEndPoints.myOrderListDetails);
      if (apiResponse.data != null) {
        myOrderDetailsModel = MyOrderDetailsModel.fromJson(apiResponse.data);
      }
      setLoading(false);
    } catch (ex) {
      setLoading(false);
      showErrorMessage("Something went wrong");
    }
    return myOrderDetailsModel!;
  }

  Future<MyServiceDetailsModel> myServiceDetails({userId,serviceId}) async {
    try {
      setLoading(true);
      ApiResponse apiResponse = await ApiHelper().postData(data: {
        "user_id": "$userId", "service_id": "$serviceId"
      }, route: ApiEndPoints.myserviceDetails);
      if (apiResponse.data != null) {
        myServiceDetailsModel =
            MyServiceDetailsModel.fromJson(apiResponse.data);
      }
      setLoading(false);
    } catch (ex) {
      setLoading(false);
      showErrorMessage("Something went wrong");
    }
    return myServiceDetailsModel!;
  }
}
