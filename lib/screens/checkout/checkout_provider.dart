import 'dart:convert';

import 'package:epic_multivendor/apis/api_endpoints.dart';
import 'package:epic_multivendor/screens/checkout/model/PlaceOrderModel.dart';
import 'package:epic_multivendor/screens/checkout/model/delivery_calculation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../apis/http_request.dart';
import '../../helper/helper_logger.dart';
import '../../helper/model/SuccessModel.dart';
import 'model/address_list_model.dart';
import 'order_placed/service_order_placed.dart';

class CheckoutProvider extends ChangeNotifier{
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

  bool isLoading = true;
  setLoading(bool status) {
    isLoading = status;
    notifyListeners();
  }


  SuccessModel? successModel;
  AddressListModel? addressListModel;
  PlaceOrderModel? placeOrderModel;
  DeliveryCalculationModel? deliveryCalculationModel;

  String deliveryAmount = "0.0";


  Future<SuccessModel> addAddressFUNC({
    userID,address,pincode,lat,lng,houseNumber,landMark
}) async {
    try {
      ApiResponse apiResponse =
      await ApiHelper().postData(data: {
        "user_id": "$userID",
        "address": "$address",
        "location": "$address",
        "latitude": "$lat",
        "longitude": "$lng",
        "pincode": "$pincode",
        "house_number":"$houseNumber",
        "land_mark":"$landMark"
      }, route: ApiEndPoints.addAddress);
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

  Future<AddressListModel> getAddressFUNC({userId}) async {
    try {
      ApiResponse apiResponse =
      await ApiHelper().postData(data: {
        "user_id":"$userId"
      }, route: ApiEndPoints.getAddress);
      if (apiResponse.data != null) {
        addressListModel = AddressListModel.fromJson(apiResponse.data);
      }
      setLoading(false);
    } catch (ex) {
      setLoading(false);
      showErrorMessage("Something went wrong");
    }
    return addressListModel!;
  }

  Future<PlaceOrderModel> placeOrder({userId,orderAmount,addressId,paymentMethod,deliveryAmount}) async {
    try {
      ApiResponse apiResponse =
      await ApiHelper().postData(data: {
        "user_id":"$userId",
        "order_amount": "$orderAmount",
        "payment_status": "Unpaid",
        "order_type": "Self Pickup",
        "delivery_address_id": "$addressId",
        "payment_method": "$paymentMethod",
        "delivery_amount":"$deliveryAmount"
      }, route: ApiEndPoints.placeOrder);
      if (apiResponse.data != null) {
        placeOrderModel = PlaceOrderModel.fromJson(apiResponse.data);
      }
      setLoading(false);
    } catch (ex) {
      setLoading(false);
      showErrorMessage("Something went wrong");
    }
    return placeOrderModel!;
  }

    Future<PlaceOrderModel> buyNow({userId,orderAmount,paymentStatus,addressId,paymentMethod,productId,productAmount,quantity,deliveryAmount}) async {
    try {
      ApiResponse apiResponse =
      await ApiHelper().buyNow(data: {
        "user_id":"$userId",
        "order_amount": productAmount * quantity,
        "payment_status": "$paymentStatus",
        "order_type": "Self Pickup",
        "delivery_address_id": "$addressId",
        "payment_method": "$paymentMethod",
        "product_id": productId,
        "product_amount": productAmount,
        "quantity": "$quantity",
        "delivery_amount":"$deliveryAmount"

      }, route: ApiEndPoints.buyNow);
      if (apiResponse.data != null) {
        placeOrderModel = PlaceOrderModel.fromJson(apiResponse.data);
      }
      setLoading(false);
    } catch (ex) {
      setLoading(false);
      showErrorMessage("Something went wrong");
    }
    return placeOrderModel!;
  }

  Future<SuccessModel> serviceBooking(context,{userId,serviceId,addressId,name,email,phone,query}) async {
    var headers = {
      'Content-Type': 'application/json'
    };
    var request = http.Request(
        'POST',
        Uri.parse(
            'https://phpstack-1215628-4317594.cloudwaysapps.com/api/service-bookings'));
    request.body = json.encode({
      "user_id": "$userId",
      "service_id": "$serviceId",
      "name": "$name",
      "email":"$email",
      "phone":"$phone",
      "query":"$query",
      "user_address_id":"$addressId",
      "payment_method":"Cash On Delivery",
      "payment_status":"Unpaid"
      // "payment_method":"Razorpay",
      // "payment_status":"Paid"
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ServiceOrderPlaced(),));
    }
    else {
      print(response.reasonPhrase);
    }
    return successModel!;
  }

  Future<DeliveryCalculationModel>deliveryCalculation(context,{fromLatitude,fromLongitude,toLatitude,toLongitude}) async {
    try {
      ApiResponse apiResponse =
      await ApiHelper().deliveryCal(data: {
        "from_latitude":"$fromLatitude",
        "from_longitude": "$fromLongitude",
        "to_latitude": "$toLatitude",
        "to_longitude": "$toLongitude",
        "weight": "5"
      }, route: ApiEndPoints.deliveryCalcualtion);
      if (apiResponse.data != null) {
        deliveryCalculationModel = DeliveryCalculationModel.fromJson(apiResponse.data);
        deliveryAmount = "${deliveryCalculationModel?.data?.deliveryAmount}"; 
      }
      setLoading(false);
    } catch (ex) {
      setLoading(false);
      deliveryAmount = "0.0";
      SnackBarErrorMessage(context, "No service is available between these regions.No intercity service is available.");
      showErrorMessage("Something went wrong");
    }
    return deliveryCalculationModel!;
  }

  
  }

  