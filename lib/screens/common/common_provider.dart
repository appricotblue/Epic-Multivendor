import 'package:flutter/cupertino.dart';

class CommonProvider extends ChangeNotifier {
  bool isLoading = true;
  setLoading(bool status) {
    isLoading = status;
    notifyListeners();
  }
}
