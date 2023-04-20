import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../helper/helper_logger.dart';

class ApiHelper {
  static final ApiHelper _instance = ApiHelper.internal();
  factory ApiHelper() => _instance;
  ApiHelper.internal();
  String baseUrlFunction() {
    String baseUrl = 'http://phpstack-732301-3293226.cloudwaysapps.com/api/';
    return baseUrl;
  }

  Future<ApiResponse> getData(String route) async {
    showInfoMessage(route);
    try {
      Map<String, String> headers = getDefaultHeaders();
      Response response = await get(Uri.parse(route), headers: headers);
      showInfoMessage(response.body);
       showInfoMessage(route);
      if (response.statusCode == 200) {
        dynamic bodyData = jsonDecode(response.body);
        return ApiResponse(true, data: bodyData);
      } else {
        return ApiResponse(false);
      }
    } catch (ex) {
      showErrorMessage("Exception $ex");
      return ApiResponse(false);
    }
  }

  Future<ApiResponse> postData(
      {dynamic data,
        String? route,
        Map<String, String> extraHeaders = const {}}) async {
    try {
      Map<String, String> headers = getDefaultHeaders();
      if (extraHeaders.isNotEmpty) {
        headers.clear();
        headers.addAll(extraHeaders);
      }
      Response response =
      await post(Uri.parse(route!), body: data, headers: headers);
      showWarningMessage(route!);
      showInfoMessage(data);
      showWarningMessage(response.body);
      showInfoMessage(response.statusCode);
      if (response.statusCode == 200) {
        return ApiResponse(true, data: jsonDecode(response.body));
      }else {
        return ApiResponse(false);
      }

    } catch (ex) {
      showErrorMessage("Exception $ex");
    }
    return ApiResponse(false);
  }

    Future<ApiResponse> buyNow(
      {dynamic data,
        String? route,
        Map<String, String> extraHeaders = const {}}) async {
    try {
      Map<String, String> headers = getDefaultHeaders();
      if (extraHeaders.isNotEmpty) {
        headers.clear();
        headers.addAll(extraHeaders);
      }
      Response response =
      await post(Uri.parse(route!), body: data, headers: headers);
      showWarningMessage(route!);
      showInfoMessage(data);
      showWarningMessage(response.body);
      showInfoMessage(response.statusCode);
      if (response.statusCode == 200) {
        return ApiResponse(true, data: jsonDecode(response.body));
      }else {
        return ApiResponse(false);
      }

    } catch (ex) {
      showErrorMessage("Exception $ex");
    }
    return ApiResponse(false);
  }

   Future<ApiResponse> deliveryCal(
      {dynamic data,
        String? route,
        Map<String, String> extraHeaders = const {}}) async {
    try {
      Map<String, String> headers = deliveryHeaders();
      if (extraHeaders.isNotEmpty) {
        headers.clear();
        headers.addAll(extraHeaders);
      }
      Response response =
      await post(Uri.parse(route!), body: data, headers: headers);
      showWarningMessage(route!);
      showInfoMessage(data);
      showWarningMessage(response.body);
      showInfoMessage(response.statusCode);
      if (response.statusCode == 200) {
        return ApiResponse(true, data: jsonDecode(response.body));
      }else {
        return ApiResponse(false);
      }

    } catch (ex) {
      showErrorMessage("Exception $ex");
    }
    return ApiResponse(false);
  }


  Future<ApiResponse> deleteData(String route, dynamic data) async {
    String url = baseUrlFunction() + route;
    try {
      Map<String, String> headers = getDefaultHeaders();
      Response response =
      await delete(Uri.parse(url), body: data, headers: headers);
      showInfoMessage(response.body);
      if (response.statusCode == 200) {
        return ApiResponse(true, data: jsonDecode(response.body));
      } else {
        showErrorMessage(response.body);
        return ApiResponse(false);
      }
    } catch (ex) {
      showErrorMessage("Exception $ex");
      return ApiResponse(false);
    }
  }

  Future<ApiResponse> updateData(String route, Map data) async {
    String url = baseUrlFunction() + route;
    try {
      Map<String, String> headers = getDefaultHeaders();
      headers.addAll({'Content-Type': 'application/x-www-form-urlencoded'});
      Response response = await put(Uri.parse(url),
          body: data, headers: headers, encoding: Encoding.getByName("utf-8"));
      showInfoMessage(response.body);
      if (response.statusCode == 200) {
        return ApiResponse(true, data: jsonDecode(response.body));
      } else {
        return ApiResponse(false);
      }
    } catch (ex) {
      showErrorMessage("Exception $ex");
      return ApiResponse(false);
    }
  }

   Future<ApiResponse> addWishList(
      {dynamic data,
        String? route,
        Map<String, String> extraHeaders = const {}}) async {
    try {
      Map<String, String> headers = getDefaultHeaders();
      if (extraHeaders.isNotEmpty) {
        headers.clear();
        headers.addAll(extraHeaders);
      }
      Response response =
      await post(Uri.parse(route!), body: data, headers: headers);
      showWarningMessage(route!);
      showInfoMessage(data);
      showWarningMessage(response.body);
      showInfoMessage(response.statusCode);
      if (response.statusCode == 200) {
        return ApiResponse(true, data: jsonDecode(response.body));
      }else {
        return ApiResponse(false);
      }

    } catch (ex) {
      showErrorMessage("Exception $ex");
    }
    return ApiResponse(false);
  }

  Future<ApiResponse> removeWishList(
      {dynamic data,
        String? route,
        Map<String, String> extraHeaders = const {}}) async {
    try {
      Map<String, String> headers = getDefaultHeaders();
      if (extraHeaders.isNotEmpty) {
        headers.clear();
        headers.addAll(extraHeaders);
      }
      Response response =
      await post(Uri.parse(route!), body: data, headers: headers);
      showWarningMessage(route!);
      showInfoMessage(data);
      showWarningMessage(response.body);
      showInfoMessage(response.statusCode);
      if (response.statusCode == 200) {
        return ApiResponse(true, data: jsonDecode(response.body));
      }else {
        return ApiResponse(false);
      }

    } catch (ex) {
      showErrorMessage("Exception $ex");
    }
    return ApiResponse(false);
  }

  Map<String, String> getDefaultHeaders() {
    Map<String, String> headers = {
      "accept": "application/json",
    };
    return headers;
  }

  Map<String, String> deliveryHeaders() {
    Map<String, String> headers = {
      "accept": "application/json",
      "ClientSecret": "qbSh5ucp1XlnPAy5uxvDSLDRXK1DkkkbnpwnDm75pI8r9wjgxv0nJO6fvbCmnAO6"
    };
    return headers;
  }
}

class ApiResponse{
  bool _status;
  dynamic data;
  String? message;

  ApiResponse(this._status,{this.data = const {}, this.message});

  bool getStatus(){
    return _status;
  }

  bool hasData(){
    return data.isNotEmpty;
  }

  factory ApiResponse.fromJSON(Map<String,dynamic> json){
    return ApiResponse(json["status"],data: json["data"],message: json["message"]);
  }

}