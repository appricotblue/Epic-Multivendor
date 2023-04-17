/// success : true
/// errorMsg : ""
/// order_id : "#0000004"

class PlaceOrderModel {
  PlaceOrderModel({
      bool? success, 
      String? errorMsg, 
      String? orderId,}){
    _success = success;
    _errorMsg = errorMsg;
    _orderId = orderId;
}

  PlaceOrderModel.fromJson(dynamic json) {
    _success = json['success'];
    _errorMsg = json['errorMsg'];
    _orderId = json['order_id'];
  }
  bool? _success;
  String? _errorMsg;
  String? _orderId;
PlaceOrderModel copyWith({  bool? success,
  String? errorMsg,
  String? orderId,
}) => PlaceOrderModel(  success: success ?? _success,
  errorMsg: errorMsg ?? _errorMsg,
  orderId: orderId ?? _orderId,
);
  bool? get success => _success;
  String? get errorMsg => _errorMsg;
  String? get orderId => _orderId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['errorMsg'] = _errorMsg;
    map['order_id'] = _orderId;
    return map;
  }

}