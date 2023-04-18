import 'package:epic_multivendor/screens/my_order&services/model/MyOrderModel.dart';
import 'package:epic_multivendor/screens/my_order&services/model/ServiceBookingDetailsModel.dart';
import 'package:flutter/foundation.dart';

import '../../apis/api_endpoints.dart';
import '../../apis/http_request.dart';
import '../../helper/helper_logger.dart';
import 'model/MyServiceListModel.dart';

class MyOrderProvider extends ChangeNotifier{
  bool isLoading = true;
  setLoading(bool status) {
    isLoading = status;
    notifyListeners();
  }

  MyOrderModel? myOrderModel;
  MyServiceListModel? myServicsListModel;
 

  /// PRODUCT WISHLIST
  ///
  ///
  Future<MyOrderModel> myOrderList({userId}) async {
    try {
      setLoading(true);
      ApiResponse apiResponse = await ApiHelper().postData(
          data: {"user_id": "$userId"},
          route:ApiEndPoints.myOrderList);
      if (apiResponse.data != null) {
        myOrderModel = MyOrderModel.fromJson(apiResponse.data);
      }
      setLoading(false);
    } catch (ex) {
      setLoading(false);
      showErrorMessage("Something went wrong");
    }
    return myOrderModel!;
  }

  ///  SERVICE WISHLIST
  ///
  ///

  Future<MyServiceListModel> myServiceList({userId}) async {
    try {
      setLoading(true);
      ApiResponse apiResponse = await ApiHelper().postData(
          data: {"user_id": "$userId"},
          route:ApiEndPoints.myServiceList);
      if (apiResponse.data != null) {
        myServicsListModel = MyServiceListModel.fromJson(apiResponse.data);
      }
      setLoading(false);
    } catch (ex) {
      setLoading(false);
      showErrorMessage("Something went wrong");
    }
    return myServicsListModel!;
  }


}