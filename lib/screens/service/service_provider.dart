import 'package:epic_multivendor/apis/api_endpoints.dart';
import 'package:epic_multivendor/apis/http_request.dart';
import 'package:flutter/material.dart';

import '../../helper/helper_logger.dart';
import 'model/branded_service.dart';
import 'model/category_service.dart';
import 'model/service_details.dart';

class ServiceProvider extends ChangeNotifier {
  bool isLoading = true;
  setLoading(bool status) {
    isLoading = status;
    notifyListeners();
  }

  CategoryServiceModel? categoryServiceModel;
  BrandedServiceModel? brandedServiceModel;
  ServiceDetailsModel? serviceDetailsModel;

  /// CATEGORY-SERVICE
  ///
  /// #################
  Future<CategoryServiceModel> categoryServiceFUNC({userId, categoryId}) async {
    try {
      ApiResponse apiResponse = await ApiHelper().postData(
          data: {"user_id": "$userId", "category_id": "$categoryId"},
          route: ApiEndPoints.serviceCategory);
      if (apiResponse.data != null) {
        categoryServiceModel = CategoryServiceModel.fromJson(apiResponse.data);
      }
      setLoading(false);
    } catch (ex) {
      setLoading(false);
      showErrorMessage("Something went wrong");
    }
    return categoryServiceModel!;
  }

  /// BRAND-SERVICE
  ///
  /// #################
  Future<BrandedServiceModel> brandServiceFUNC({userId, brandedId}) async {
    try {
      ApiResponse apiResponse = await ApiHelper().postData(
          data: {"user_id": "$userId", "brand_id": "$brandedId"},
          route: ApiEndPoints.brandServices);
      if (apiResponse.data != null) {
        brandedServiceModel = BrandedServiceModel.fromJson(apiResponse.data);
      }
      setLoading(false);
    } catch (ex) {
      setLoading(false);
      showErrorMessage("Something went wrong");
    }
    return brandedServiceModel!;
  }

  /// SERVICE-DETAILS
  ///
  /// #################
  Future<ServiceDetailsModel> serviceDetailsFUNC({userId, serviceId}) async {
    try {
      ApiResponse apiResponse = await ApiHelper().postData(
          data: {"user_id": "$userId", "service_id": "$serviceId"},
          route: ApiEndPoints.serviceDetails);
      if (apiResponse.data != null) {
        serviceDetailsModel = ServiceDetailsModel.fromJson(apiResponse.data);
      }
      setLoading(false);
    } catch (ex) {
      setLoading(false);
      showErrorMessage("Something went wrong");
    }
    return serviceDetailsModel!;
  }
}
