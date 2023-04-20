import 'package:epic_multivendor/apis/api_endpoints.dart';
import 'package:epic_multivendor/helper/model/SuccessModel.dart';
import 'package:epic_multivendor/screens/home/model/home_service_list_model.dart';
import 'package:epic_multivendor/screens/home/model/home_shop_list_model.dart';
import 'package:flutter/cupertino.dart';
import '../../../apis/http_request.dart';
import '../../../helper/helper_logger.dart';
import 'model/ShopDetailsModel.dart';
import 'package:http/http.dart' as http;

class ShopDetailsProvider extends ChangeNotifier {
  bool isLoading = true;
  setLoading(bool status) {
    isLoading = status;
    notifyListeners();
  }

  ShopDetailsModel? shopDetailsModel;
  SuccessModel? successModel;
  /// Home shops
  ///
  ///
  Future<ShopDetailsModel> shopDetails(
      {userId,productIAd}) async {
    try {
      setLoading(true);
      ApiResponse apiResponse = await ApiHelper().postData(data: {
        "user_id": "$userId",
        "product_id": "$productIAd",
      }, route: ApiEndPoints.shopDetails);
      if (apiResponse.data != null) {
        shopDetailsModel = ShopDetailsModel.fromJson(apiResponse.data);
      }
      setLoading(false);
    } catch (ex) {
      setLoading(false);
      showErrorMessage("Something went wrong");
    }
    return shopDetailsModel!;
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

  Future<SuccessModel> addToWishList(context,
      {userId,productId}) async {
    try {
      ApiResponse apiResponse = await ApiHelper().addWishList(data: {
        "user_id": "$userId",
        "product_id": "$productId",
      }, route: ApiEndPoints.addToWishList);
      if (apiResponse.data != null) {
        successModel = SuccessModel.fromJson(apiResponse.data);
        successModel?.errorMsg == null || successModel?.errorMsg == "" || successModel?.errorMsg == "null"?
        SnackBarMessage(context, "Added to wish list"):
        SnackBarMessage(context, successModel?.errorMsg);
      }
    } catch (ex) {
      showErrorMessage("Something went wrong");
    }
    return successModel!;
  }

  Future<SuccessModel> removeWishList(context,
      {userId,productId}) async {
    try {
      ApiResponse apiResponse = await ApiHelper().addWishList(data: {
        "user_id": "$userId",
        "product_id": "$productId",
      }, route: ApiEndPoints.removeToWishList);
      if (apiResponse.data != null) {
        successModel = SuccessModel.fromJson(apiResponse.data);
        successModel?.errorMsg == null || successModel?.errorMsg == "" || successModel?.errorMsg == "null"?
        SnackBarMessage(context, "Remove wish list"):
        SnackBarMessage(context, successModel?.errorMsg);
      }
    } catch (ex) {
      showErrorMessage("Something went wrong");
    }
    return successModel!;
  }

  
}
