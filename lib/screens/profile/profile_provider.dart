import 'package:epic_multivendor/apis/api_endpoints.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../apis/http_request.dart';
import '../../helper/helper_logger.dart';
import '../../helper/model/SuccessModel.dart';
import '../login/login.dart';
import 'model/my_profile.dart';

class ProfileProvider extends ChangeNotifier {
  bool isLoading = false;
  setLoading(bool status) {
    isLoading = status;
    notifyListeners();
  }

  MyProfileModel? myProfileModel;
  SuccessModel? successModel;

  Future<MyProfileModel> myProfileFUNC(userId) async {
    try {
      ApiResponse apiResponse = await ApiHelper().postData(
          data: {"user_id": "$userId"},
          route:
              "https://phpstack-1215628-4317594.cloudwaysapps.com/api/get/profile-data");
      if (apiResponse.data != null) {
        myProfileModel = MyProfileModel.fromJson(apiResponse.data);
      }
      setLoading(false);
    } catch (ex) {
      setLoading(false);
      showErrorMessage("Something went wrong");
    }
    return myProfileModel!;
  }

  Future<SuccessModel> updateMyProfileFUNC({userId, name, phone, email}) async {
    try {
      ApiResponse apiResponse = await ApiHelper().postData(data: {
        
          "user_id": "$userId",
          "name": "$name",
          "email": "$email",
          "phone": "$phone"
        
          },
          route:
              "https://phpstack-1215628-4317594.cloudwaysapps.com/api/update/profile-data");
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

  
/// LOG OUT
  logout(context) async {
    final pref = await SharedPreferences.getInstance();
    pref.remove("userId");
    pref.getString("placeName");
    pref.getString("lat");
    pref.getString("lng");
    pref.clear().then((value) => Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const Login())));
  }
}
