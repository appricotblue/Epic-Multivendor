
import 'package:epic_multivendor/apis/api_endpoints.dart';
import 'package:epic_multivendor/screens/splash/model/settings_model.dart';
import 'package:flutter/material.dart';
import '../../apis/http_request.dart';
import '../../helper/helper_logger.dart';

class SplashProvider extends ChangeNotifier {
  bool isLoading = false;
  setLoading(bool status) {
    isLoading = status;
    notifyListeners();
  }

  SettingsModel? settingsModel;
  Future<SettingsModel> mySettingsFUNC(BuildContext context) async {
    try {
      ApiResponse apiResponse = await ApiHelper()
          .getData(ApiEndPoints.settings);
      if (apiResponse.data != null) {
        settingsModel = SettingsModel.fromJson(apiResponse.data);
        notifyListeners();
      }
      setLoading(false);
    } catch (ex) {
      setLoading(false);
      showErrorMessage("Something went wrong");
    }
    return settingsModel!;
  }
}
