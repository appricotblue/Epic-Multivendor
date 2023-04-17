import 'package:epic_multivendor/apis/api_endpoints.dart';
import 'package:epic_multivendor/helper/model/SuccessModel.dart';
import 'package:flutter/cupertino.dart';
import '../../apis/http_request.dart';
import '../../helper/helper_logger.dart';
import 'model/Product_Wishlist_Model.dart';
import 'model/Service_Wishlist_Modeldart.dart';

class WishListProvider extends ChangeNotifier {
  bool isLoading = true;
  setLoading(bool status) {
    isLoading = status;
    notifyListeners();
  }

  ProductWishlistModel? productWishlistModel;
  ServiceWishlistModel? serviceWishlistModel;
  SuccessModel? successModel;

  /// PRODUCT WISHLIST
  ///
  ///
  Future<ProductWishlistModel> wishListProduct({userId}) async {
    try {
      setLoading(true);
      ApiResponse apiResponse = await ApiHelper().postData(
          data: {"user_id": "$userId"},
          route:ApiEndPoints.productWishList);
      if (apiResponse.data != null) {
        productWishlistModel = ProductWishlistModel.fromJson(apiResponse.data);
      }
      setLoading(false);
    } catch (ex) {
      setLoading(false);
      showErrorMessage("Something went wrong");
    }
    return productWishlistModel!;
  }

  ///  SERVICE WISHLIST
  ///
  ///

  Future<ServiceWishlistModel> wishListServices({userId}) async {
    try {
      setLoading(true);
      ApiResponse apiResponse = await ApiHelper().postData(
          data: {"user_id": "$userId"},
          route:ApiEndPoints.serviceWishList);
      if (apiResponse.data != null) {
        serviceWishlistModel = ServiceWishlistModel.fromJson(apiResponse.data);
      }
      setLoading(false);
    } catch (ex) {
      setLoading(false);
      showErrorMessage("Something went wrong");
    }
    return serviceWishlistModel!;
  }

  /// REMOVE SERVICE WISHLIST
  ///
  ///
  Future<SuccessModel> removeServiceWishList(context,{userId, serviceId}) async {
    try {
      setLoading(true);
      ApiResponse apiResponse = await ApiHelper().postData(
          data: {"user_id": "$userId", "service_id": "$serviceId"},
          route:ApiEndPoints.serviceRemovedFromWishList);
      if (apiResponse.data != null) {
        successModel = SuccessModel.fromJson(apiResponse.data);
         SnackBarMessage(context, "This service removed to wishlist");
      }
      setLoading(false);
    } catch (ex) {
      setLoading(false);
      showErrorMessage("Something went wrong");
    }
    return successModel!;
  }

  /// REMOVE PRODUCT WISHLIST
  ///
  ///
  Future<SuccessModel> removeProductWishList(context,{userId, productId}) async {
    try {
      setLoading(true);
      ApiResponse apiResponse = await ApiHelper().postData(
          data: {"user_id": "$userId", "product_id": "$productId"},
          route:ApiEndPoints.productRemovedFromWishList);
      if (apiResponse.data != null) {
        successModel = SuccessModel.fromJson(apiResponse.data);
         SnackBarMessage(context, "This product removed to wishlist");
      }
      setLoading(false);
    } catch (ex) {
      setLoading(false);
      showErrorMessage("Something went wrong");
    }
    return successModel!;
  }

  /// REMOVE SERVICE WISHLIST
  ///
  ///
  Future<SuccessModel> addServiceWishList(context,{userId, serviceId}) async {
    try {
      setLoading(true);
      ApiResponse apiResponse = await ApiHelper().postData(
          data: {"user_id": "$userId", "service_id": "$serviceId"},
          route:ApiEndPoints.serviceAddToWishList);
      if (apiResponse.data != null) {
        successModel = SuccessModel.fromJson(apiResponse.data);
         SnackBarMessage(context, "This service added to wishlist");
      }
      setLoading(false);
    } catch (ex) {
      setLoading(false);
      showErrorMessage("Something went wrong");
    }
    return successModel!;
  }

  /// REMOVE PRODUCT WISHLIST
  ///
  ///
  Future<SuccessModel> addProductWishList(context,{userId, productId}) async {
    try {
      setLoading(true);
      ApiResponse apiResponse = await ApiHelper().postData(
          data: {"user_id": "$userId", "product_id": "$productId"},
          route:ApiEndPoints.productAddToWishList);
      if (apiResponse.data != null) {
        successModel = SuccessModel.fromJson(apiResponse.data);
        SnackBarMessage(context, "This product added to wishlist");
      }
      setLoading(false);
    } catch (ex) {
      setLoading(false);
      showErrorMessage("Something went wrong");
    }
    return successModel!;
  }
}
