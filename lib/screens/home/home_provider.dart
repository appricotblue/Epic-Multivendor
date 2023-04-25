import 'package:epic_multivendor/apis/api_endpoints.dart';
import 'package:epic_multivendor/helper/model/SuccessModel.dart';
import 'package:epic_multivendor/screens/home/model/home_service_list_model.dart';
import 'package:epic_multivendor/screens/home/model/home_shop_list_model.dart';
import 'package:epic_multivendor/screens/home/model/search_shop_model.dart';
import 'package:epic_multivendor/screens/login/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../apis/http_request.dart';
import '../../helper/helper_logger.dart';

class HomeProvider extends ChangeNotifier {
  bool isLoading = true;
  setLoading(bool status) {
    isLoading = status;
    notifyListeners();
  }

  String? lat, lng, placeName;
  String addLat(String value) {
    lat = value;
    notifyListeners();
    return lat!;
  }

  String addLng(String value) {
    lng = value;
    notifyListeners();
    return lng!;
  }

  String addPlaceName(String value) {
    placeName = value;
    notifyListeners();
    return placeName!;
  }

  HomeShopListModel? homeShopListModel;
  HomeServiceListModel? homeServiceListModel;
  SuccessModel? successModel;
  SearchShopModel? searchShopModel;

  /// Home shops
  ///
  ///
  Future<HomeShopListModel> homeShop({userId, location, lat, lng}) async {
    try {
      ApiResponse apiResponse = await ApiHelper().postData(data: {
        "user_id": "$userId",
        "location": "$location",
        "latitude": "$lat",
        "longitude": "$lng"
      }, route: ApiEndPoints.homeShopData);
      if (apiResponse.data != null) {
        homeShopListModel = HomeShopListModel.fromJson(apiResponse.data);
      }
      setLoading(false);
    } catch (ex) {
      setLoading(false);
      showErrorMessage("Something went wrong");
    }
    return homeShopListModel!;
  }

  /// Home service
  ///
  ///

  Future<HomeServiceListModel> homeService({userId, location, lat, lng}) async {
    try {
      ApiResponse apiResponse = await ApiHelper().postData(data: {
        "user_id": "$userId",
        "location": "$location",
        "latitude": "$lat",
        "longitude": "$lng"
      }, route: ApiEndPoints.homeServiceData);
      if (apiResponse.data != null) {
        homeServiceListModel = HomeServiceListModel.fromJson(apiResponse.data);
      }
      setLoading(false);
    } catch (ex) {
      setLoading(false);
      showErrorMessage("Something went wrong");
    }
    return homeServiceListModel!;
  }

  Future<HomeShopListModel> homeSearchShopFUNC(
      {userId, location, lat, lng,searchKey}) async {
    try {
      setLoading(true);
      ApiResponse apiResponse = await ApiHelper().postData(data: {
        "user_id": "$userId",
        "location": "$location",
        "latitude": "$lat",
        "longitude": "$lng",
         "search_key":"$searchKey"
      }, route: ApiEndPoints.homeSearchShopData);
      if (apiResponse.data != null) {
        homeShopListModel = HomeShopListModel.fromJson(apiResponse.data);
      }
      setLoading(false);
    } catch (ex) {
      setLoading(false);
      showErrorMessage("Something went wrong");
    }
    return homeShopListModel!;
  }

    Future<SearchShopModel> searchShopFUNC(
      {userId, location, lat, lng,searchKey,categoryId}) async {
    try {
      setLoading(true);
      ApiResponse apiResponse = await ApiHelper().postData(data: {
        "user_id": "$userId",
        "location": "$location",
        "latitude": "$lat",
        "longitude": "$lng",
        "search_key":"$searchKey",
        "category_id":"$categoryId"
      }, route: ApiEndPoints.searchShopData);
      if (apiResponse.data != null) {
        searchShopModel = SearchShopModel.fromJson(apiResponse.data);
      }
      setLoading(false);
    } catch (ex) {
      setLoading(false);
      showErrorMessage("Something went wrong");
    }
    return searchShopModel!;
  }

  Future<HomeServiceListModel> homeSearchServiceFUNC({userId, location, lat, lng,searchKey}) async {
    try {
      setLoading(true);
      ApiResponse apiResponse = await ApiHelper().postData(data: {
        "user_id": "$userId",
        "location": "$location",
        "latitude": "$lat",
        "longitude": "$lng",
        "search_key":"$searchKey"
      }, route: ApiEndPoints.homeSearchServiceData);
      if (apiResponse.data != null) {
        homeServiceListModel = HomeServiceListModel.fromJson(apiResponse.data);
      }
      setLoading(false);
    } catch (ex) {
      setLoading(false);
      showErrorMessage("Something went wrong");
    }
    return homeServiceListModel!;
  }
}
