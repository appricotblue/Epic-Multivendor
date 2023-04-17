import 'dart:convert';

import 'package:either_dart/either.dart';
import 'package:epic_multivendor/apis/api_endpoints.dart';
import 'package:epic_multivendor/helper/model/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../apis/http_request.dart';
import '../../helper/helper_logger.dart';
import 'model/login_model.dart';

class LoginProvider extends ChangeNotifier {
  bool isLoading = false;
  setLoading(bool status) {
    isLoading = status;
    notifyListeners();
  }
  var userModel = Get.find<UserModel>();
  LoginModel? loginModel;

  Future<LoginModel> loginFUNC(phone) async {
    final prefs = await SharedPreferences.getInstance();
    try {
      setLoading(true);
      ApiResponse apiResponse = await ApiHelper().postData(
          data: {"phone": "$phone"}, route: ApiEndPoints.login);
      if (apiResponse.data != null) {
        loginModel = LoginModel.fromJson(apiResponse.data);
        userModel.updateWith(otp: loginModel?.otp.toString(),userId: loginModel?.userId?.toString());
      }
      setLoading(false);
    } catch (ex) {
      setLoading(false);
      showErrorMessage("Something went wrong");
    }
    return loginModel!;
  }


}
