import 'package:flutter/cupertino.dart';

import '../../apis/api_endpoints.dart';
import '../../apis/http_request.dart';
import '../../helper/helper_logger.dart';
import '../../helper/model/SuccessModel.dart';
import 'model/CartListModel.dart';

class CartProvider extends ChangeNotifier{
  bool isLoading = true;
  setLoading(bool status) {
    isLoading = status;
    notifyListeners();
  }

  CartListModel? cartListModel;
  SuccessModel? successModel;
  /// Home shops
  ///
  ///
  Future<CartListModel> getCart(
      {userId, location, lat, lng,categoryTypeId}) async {
    try {
      setLoading(true);
      ApiResponse apiResponse = await ApiHelper().postData(data: {
        "user_id": "$userId",
      }, route: ApiEndPoints.getCart);
      if (apiResponse.data != null) {
        cartListModel = CartListModel.fromJson(apiResponse.data);
      }
      setLoading(false);
    } catch (ex) {
      setLoading(false);
      showErrorMessage("Something went wrong");
    }
    return cartListModel!;
  }

  Future<SuccessModel> addToCart(context,
      {userId,productId,quantity,productAmount,attributeId}) async {
    try {
      ApiResponse apiResponse = await ApiHelper().postData(data: {
        "user_id": "$userId",
        "product_id": "$productId",
        "quantity": "$quantity",
        "product_amount": "$productAmount",
        "attribute_id":"$attributeId"
      }, route: ApiEndPoints.addToCart);
      if (apiResponse.data != null) {
        successModel = SuccessModel.fromJson(apiResponse.data);
        successModel?.errorMsg == null || successModel?.errorMsg == "" || successModel?.errorMsg == "null"?
        SnackBarMessage(context, "Added to cart"):
        SnackBarMessage(context, successModel?.errorMsg);
      }
    } catch (ex) {
      showErrorMessage("Something went wrong");
    }
    return successModel!;
  }

   Future<SuccessModel> deleteCart(context,
      {userId,productId}) async {
    try {
      ApiResponse apiResponse = await ApiHelper().postData(data: {
        "user_id": "$userId", 
        "product_id": "$productId",
      }, route: ApiEndPoints.removeCart);
      if (apiResponse.data != null) {
        successModel = SuccessModel.fromJson(apiResponse.data);
      }
    } catch (ex) {
      showErrorMessage("Something went wrong");
    }
    return successModel!;
  }
}