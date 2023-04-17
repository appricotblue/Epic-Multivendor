import 'package:flutter/cupertino.dart';

import '../../apis/api_endpoints.dart';
import '../../apis/http_request.dart';
import '../../helper/helper_logger.dart';
import '../../helper/model/SuccessModel.dart';

class PrimeProvider extends ChangeNotifier{
    bool isLoading = true;
  setLoading(bool status) {
    isLoading = status;
    notifyListeners();
  }

  SuccessModel? successModel;

  /// PRODUCT WISHLIST
  ///
  ///
  Future<SuccessModel> premiumUpdate({userId}) async {
    try {
      setLoading(true);
      ApiResponse apiResponse = await ApiHelper().postData(
          data: {"user_id": "$userId"},
          route:ApiEndPoints.premium);
      if (apiResponse.data != null) {
        successModel = SuccessModel.fromJson(apiResponse.data);
      }
      setLoading(false);
    } catch (ex) {
      setLoading(false);
      showErrorMessage("Something went wrong");
    }
    return successModel!;
  }
}