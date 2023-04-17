import 'package:epic_multivendor/apis/api_endpoints.dart';
import 'package:flutter/cupertino.dart';
import '../../../apis/http_request.dart';
import '../../../helper/helper_logger.dart';
import 'model/ShopCategoryModel.dart';

class ShopCategoryProvider extends ChangeNotifier {
  bool isLoading = true;
  setLoading(bool status) {
    isLoading = status;
    notifyListeners();
  }

  ShopCategoryModel? shopCategoryModel;
  /// Home shops
  ///
  ///
  Future<ShopCategoryModel> shopCategory(
      {userId, location, lat, lng,categoryTypeId}) async {
    try {
      setLoading(true);
      ApiResponse apiResponse = await ApiHelper().postData(data: {
        "user_id": "$userId",
        "location": "$location",
        "latitude": "$lat",
        "longitude": "$lng",
        "type_id": "$categoryTypeId",
      }, route: ApiEndPoints.shopCategory);
      if (apiResponse.data != null) {
        shopCategoryModel = ShopCategoryModel.fromJson(apiResponse.data);
      }
      setLoading(false);
    } catch (ex) {
      setLoading(false);
      showErrorMessage("Something went wrong");
    }
    return shopCategoryModel!;
  }
}
