import 'dart:developer';

import 'package:epic_multivendor/apis/api_endpoints.dart';
import 'package:epic_multivendor/helper/model/SuccessModel.dart';
import 'package:epic_multivendor/screens/home/model/home_service_list_model.dart';
import 'package:epic_multivendor/screens/home/model/home_shop_list_model.dart';
import 'package:epic_multivendor/screens/home/model/search_product_model.dart';
import 'package:epic_multivendor/screens/home/model/search_service_model.dart';
import 'package:epic_multivendor/screens/home/model/search_shop_model.dart';
import 'package:epic_multivendor/screens/login/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../apis/http_request.dart';
import '../../helper/helper_logger.dart';
import '../../helper/model/user_model.dart';
import 'new1/service_list_model.dart';

class HomeProvider extends ChangeNotifier {
  // HomeProvider() {
  //   initializeServiceListScrollController();
  // }
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
  SearchServiceModel? searchServiceModel;
  SearchProductModel? searchProductModel;

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

  ScrollController scrollController = ScrollController();
  void initializeServiceListScrollController() {
    log('initialservicescroll');

    scrollController.addListener(() {
      // log('initialscroll');
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        log('REACHED END OF LIST');

        Future.microtask(() {
          loadmore();
        });
      }
    });
    allServices("1");
    // Future.microtask(() {
    //   shopProducts("1");
    // });
  }
  

  ServiceListModel? serviceListModel;
  List<AllServicesList> serviceslist = [];
  var userModel = Get.find<UserModel>();
  int currentpage = 1;
  int? endpage;

  //ALL SERVICE LIST
  Future<void> allServices(String page) async {
    log('ALL SERVICES CALLED----\n');
    try {
      ApiResponse apiResponse = await ApiHelper().postData(data: {
        "user_id": userModel.userId.toString(),
        "shop_id": userModel.shopId.toString(),
        "page": page,
      }, route: ApiEndPoints.homeServiceData);
      if (apiResponse.data != null) {
        log('ALL SERVICES LIST---/n${apiResponse.data}');
        serviceListModel = ServiceListModel.fromJson(apiResponse.data);
        currentpage = serviceListModel!.pagination!.currentPage!;
        endpage = serviceListModel!.pagination!.lastPage!;
        if (page == "1") {
          serviceslist.addAll(serviceListModel?.services ?? []);
        } else {
          // If it's not the first page, update the existing list
          // assuming there's an identifier, for example, orderId
          serviceslist.removeWhere((existingproduct) =>
              serviceListModel?.services
                  ?.any((newproduct) => newproduct.id == existingproduct.id) ??
              false);
          serviceslist.addAll(serviceListModel?.services ?? []);
        }
        log('------------SERVICESLENGTH----******-----${serviceslist.length}');
      }
      setLoading(false);
    } catch (ex) {
      setLoading(false);
      showErrorMessage("Something went wrong");
    }
    // return homeServiceListModel!;
  }
  void loadmore() async {
    var newpage = currentpage + 1;
    if (newpage <= endpage!) {
      await allServices(newpage.toString());
      // if (activeOrderModel?.orders != null) {
      //   orderlist.addAll(activeOrderModel!.orders!);
      // }
      log('--new-page-------------$newpage');
      log('AFTER--LOADING-SERVICESLSIT-LENGTH------------${serviceslist.length}');
    } else {
      return;
    }
  }

  Future<HomeShopListModel> homeSearchShopFUNC(
      {userId, location, lat, lng, searchKey}) async {
    try {
      setLoading(true);
      ApiResponse apiResponse = await ApiHelper().postData(data: {
        "user_id": "$userId",
        "location": "$location",
        "latitude": "$lat",
        "longitude": "$lng",
        "search_key": "$searchKey"
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
      {userId, location, lat, lng, searchKey, categoryId}) async {
    try {
      setLoading(true);
      ApiResponse apiResponse = await ApiHelper().postData(data: {
        "user_id": "$userId",
        "location": "$location",
        "latitude": "$lat",
        "longitude": "$lng",
        "search_key": "$searchKey",
        "category_id": "$categoryId"
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

  Future<HomeServiceListModel> homeSearchServiceFUNC(
      {userId, location, lat, lng, searchKey}) async {
    try {
      setLoading(true);
      ApiResponse apiResponse = await ApiHelper().postData(data: {
        "user_id": "$userId",
        "location": "$location",
        "latitude": "$lat",
        "longitude": "$lng",
        "search_key": "$searchKey"
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

  Future<SearchServiceModel> searchServiceFUNC(
      {userId, location, lat, lng, searchKey, categoryId}) async {
    try {
      setLoading(true);
      ApiResponse apiResponse = await ApiHelper().postData(data: {
        "user_id": "$userId",
        "location": "$location",
        "latitude": "$lat",
        "longitude": "$lng",
        "search_key": "$searchKey",
        "category_id": "$categoryId"
      }, route: ApiEndPoints.searchServiceData);
      if (apiResponse.data != null) {
        searchServiceModel = SearchServiceModel.fromJson(apiResponse.data);
      }
      setLoading(false);
    } catch (ex) {
      setLoading(false);
      showErrorMessage("Something went wrong");
    }
    return searchServiceModel!;
  }

  Future<SearchProductModel> searchProductFUNC(
      {userId, shopId, searchKey, categoryId}) async {
    try {
      setLoading(true);
      ApiResponse apiResponse = await ApiHelper().postData(data: {
        "user_id": "$userId",
        "shop_id": "$shopId",
        "search_key": "$searchKey"
      }, route: ApiEndPoints.searchProductData);
      if (apiResponse.data != null) {
        searchProductModel = SearchProductModel.fromJson(apiResponse.data);
      }
      setLoading(false);
    } catch (ex) {
      setLoading(false);
      showErrorMessage("Something went wrong");
    }
    return searchProductModel!;
  }

  Future<SuccessModel> updateDeviceToken({userId, deviceToken}) async {
    try {
      ApiResponse apiResponse = await ApiHelper().postData(data: {
        "user_id": "$userId",
        "device_token": "$deviceToken",
      }, route: ApiEndPoints.updateDeviceToken);
      if (apiResponse.data != null) {
        successModel = SuccessModel.fromJson(apiResponse.data);
      }
    } catch (ex) {
      showErrorMessage("Something went wrong");
    }
    return successModel!;
  }
}
