import 'dart:convert';

import 'package:epic_multivendor/helper/model/SuccessModel.dart';
import 'package:epic_multivendor/screens/my_order&service_details/model/my_service_details.dart';
import 'package:epic_multivendor/screens/my_order&services/model/ServiceBookingDetailsModel.dart';
import 'package:epic_multivendor/screens/my_service_details/my_service_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../apis/api_endpoints.dart';
import '../../apis/http_request.dart';
import '../../helper/helper_logger.dart';
import 'model/my-order-details.dart';
import 'package:http/http.dart' as http;

class MyOrderDetailsProvider extends ChangeNotifier {
  bool isLoading = true;
  setLoading(bool status) {
    isLoading = status;
    notifyListeners();
  }

  MyOrderDetailsModel? myOrderDetailsModel;
  MyServiceDetailsModel? myServiceDetailsModel;
  ServiceBookingDetailsModel? serviceBookingDetailsModel;
  SuccessModel? successModel;

  /// PRODUCT WISHLIST
  ///
  ///
  Future<MyOrderDetailsModel> myOrderListDetails({orderId}) async {
    try {
      setLoading(true);
      ApiResponse apiResponse = await ApiHelper().postData(
          data: {"order_id": "$orderId"},
          route: ApiEndPoints.myOrderListDetails);
      if (apiResponse.data != null) {
        myOrderDetailsModel = MyOrderDetailsModel.fromJson(apiResponse.data);
      }
      setLoading(false);
    } catch (ex) {
      setLoading(false);
      showErrorMessage("Something went wrong");
    }
    return myOrderDetailsModel!;
  }

  Future<MyServiceDetailsModel> myServiceDetails({userId,serviceId}) async {
    try {
      setLoading(true);
      ApiResponse apiResponse = await ApiHelper().postData(data: {
        "user_id": "$userId", "service_id": "$serviceId"
      }, route: ApiEndPoints.myserviceDetails);
      if (apiResponse.data != null) {
        myServiceDetailsModel =
            MyServiceDetailsModel.fromJson(apiResponse.data);
      }
      setLoading(false);
    } catch (ex) {
      setLoading(false);
      showErrorMessage("Something went wrong");
    }
    return myServiceDetailsModel!;
  }

  Future<ServiceBookingDetailsModel> serviceBookingDetails({serviceBookingId}) async {
    print("=====$serviceBookingId");
    try {
      setLoading(true);
      ApiResponse apiResponse = await ApiHelper().postData(
          data: {"service_booking_id": "$serviceBookingId"},
          route:ApiEndPoints.serviceBookingDetails);
      if (apiResponse.data != null) {
        serviceBookingDetailsModel = ServiceBookingDetailsModel.fromJson(apiResponse.data);
      }
      setLoading(false);
    } catch (ex) {
      setLoading(false);
      showErrorMessage("Something went wrong");
    }
    return serviceBookingDetailsModel!;
  }

  Future<SuccessModel?> updateBookingPaymentStatus(context,{bookingId}) async {
    var headers = {
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST', Uri.parse('http://phpstack-732301-3293226.cloudwaysapps.com/api/update/service-bookings/payemnt-status'));
    request.body = json.encode({
      "service_booking_id": "$bookingId"
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      context.read<MyOrderDetailsProvider>().serviceBookingDetails(
        serviceBookingId:  bookingId
      );
      
    }
    else {
      print(response.reasonPhrase);
       
    }
    return successModel;
  }
}
