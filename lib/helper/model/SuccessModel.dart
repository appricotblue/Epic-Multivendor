/// success : true
/// errorMsg : ""

class SuccessModel {
  SuccessModel({
      bool? success, 
      String? errorMsg,}){
    _success = success;
    _errorMsg = errorMsg;
}

  SuccessModel.fromJson(dynamic json) {
    _success = json['success'];
    _errorMsg = json['errorMsg'];
  }
  bool? _success;
  String? _errorMsg;
SuccessModel copyWith({  bool? success,
  String? errorMsg,
}) => SuccessModel(  success: success ?? _success,
  errorMsg: errorMsg ?? _errorMsg,
);
  bool? get success => _success;
  String? get errorMsg => _errorMsg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['errorMsg'] = _errorMsg;
    return map;
  }

}