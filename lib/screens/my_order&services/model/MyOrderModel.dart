/// success : true
/// errorMsg : 0
/// orders : [{"id":1,"order_id":"#0000001","user_id":1,"user_name":"rilna","order_amount":"1200","payment_status":"Unpaid","order_status_id":"1","order_status":"On the way","order_type":"self_pickup","time_slot":"10:00 AM - 08:00 PM","delivery_date":"05-10-2022","delivery_address_id":1,"delivery_address":"address","payment_method":"Cash On Delivery","delivery_boy_id":1,"created_at":"2022-12-12 06:20:23","updated_at":"2023-02-04 15:36:45"},{"id":2,"order_id":"#0000002","user_id":1,"user_name":"rilna","order_amount":"1200","payment_status":"Unpaid","order_status_id":"1","order_status":"On the way","order_type":"self_pickup","time_slot":"10:00 AM - 08:00 PM","delivery_date":"05-10-2022","delivery_address_id":1,"delivery_address":"Delivery address , Kannur , Kerala , India , 670018","payment_method":"Cash On Delivery","delivery_boy_id":1,"created_at":"2022-12-12 06:21:49","updated_at":"2023-02-03 17:24:30"},{"id":20,"order_id":"#0000003","user_id":1,"user_name":null,"order_amount":"100","payment_status":"Unpaid","order_status_id":null,"order_status":"Delivered","order_type":null,"time_slot":null,"delivery_date":null,"delivery_address_id":null,"delivery_address":null,"payment_method":null,"delivery_boy_id":1,"created_at":null,"updated_at":"2023-02-03 17:24:40"}]

class MyOrderModel {
  MyOrderModel({
      bool? success, 
      num? errorMsg, 
      List<Orders>? orders,}){
    _success = success;
    _errorMsg = errorMsg;
    _orders = orders;
}

  MyOrderModel.fromJson(dynamic json) {
    _success = json['success'];
    _errorMsg = json['errorMsg'];
    if (json['orders'] != null) {
      _orders = [];
      json['orders'].forEach((v) {
        _orders?.add(Orders.fromJson(v));
      });
    }
  }
  bool? _success;
  num? _errorMsg;
  List<Orders>? _orders;
MyOrderModel copyWith({  bool? success,
  num? errorMsg,
  List<Orders>? orders,
}) => MyOrderModel(  success: success ?? _success,
  errorMsg: errorMsg ?? _errorMsg,
  orders: orders ?? _orders,
);
  bool? get success => _success;
  num? get errorMsg => _errorMsg;
  List<Orders>? get orders => _orders;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['errorMsg'] = _errorMsg;
    if (_orders != null) {
      map['orders'] = _orders?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 1
/// order_id : "#0000001"
/// user_id : 1
/// user_name : "rilna"
/// order_amount : "1200"
/// payment_status : "Unpaid"
/// order_status_id : "1"
/// order_status : "On the way"
/// order_type : "self_pickup"
/// time_slot : "10:00 AM - 08:00 PM"
/// delivery_date : "05-10-2022"
/// delivery_address_id : 1
/// delivery_address : "address"
/// payment_method : "Cash On Delivery"
/// delivery_boy_id : 1
/// created_at : "2022-12-12 06:20:23"
/// updated_at : "2023-02-04 15:36:45"

class Orders {
  Orders({
      num? id, 
      String? orderId, 
      num? userId, 
      String? userName, 
      String? orderAmount, 
      String? paymentStatus, 
      String? orderStatusId, 
      String? orderStatus, 
      String? orderType, 
      String? timeSlot, 
      String? deliveryDate, 
      num? deliveryAddressId, 
      String? deliveryAddress, 
      String? paymentMethod, 
      num? deliveryBoyId, 
      String? createdAt, 
      String? updatedAt,
      String? image,
      String? orderKey
      }){
    _id = id;
    _orderId = orderId;
    _userId = userId;
    _userName = userName;
    _orderAmount = orderAmount;
    _paymentStatus = paymentStatus;
    _orderStatusId = orderStatusId;
    _orderStatus = orderStatus;
    _orderType = orderType;
    _timeSlot = timeSlot;
    _deliveryDate = deliveryDate;
    _deliveryAddressId = deliveryAddressId;
    _deliveryAddress = deliveryAddress;
    _paymentMethod = paymentMethod;
    _deliveryBoyId = deliveryBoyId;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _image = image;
    _orderKey = orderKey;
}

  Orders.fromJson(dynamic json) {
    _id = json['id'];
    _orderId = json['order_id'];
    _userId = json['user_id'];
    _userName = json['user_name'];
    _orderAmount = json['order_amount'];
    _paymentStatus = json['payment_status'];
    _orderStatusId = json['order_status_id'];
    _orderStatus = json['order_status'];
    _orderType = json['order_type'];
    _timeSlot = json['time_slot'];
    _deliveryDate = json['delivery_date'];
    _deliveryAddressId = json['delivery_address_id'];
    _deliveryAddress = json['delivery_address'];
    _paymentMethod = json['payment_method'];
    _deliveryBoyId = json['delivery_boy_id'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _image = json['image'];
    _orderKey = json['order_key'];
  }
  num? _id;
  String? _orderId;
  num? _userId;
  String? _userName;
  String? _orderAmount;
  String? _paymentStatus;
  String? _orderStatusId;
  String? _orderStatus;
  String? _orderType;
  String? _timeSlot;
  String? _deliveryDate;
  num? _deliveryAddressId;
  String? _deliveryAddress;
  String? _paymentMethod;
  num? _deliveryBoyId;
  String? _createdAt;
  String? _updatedAt;
  String? _image;
  String? _orderKey;
Orders copyWith({  num? id,
  String? orderId,
  num? userId,
  String? userName,
  String? orderAmount,
  String? paymentStatus,
  String? orderStatusId,
  String? orderStatus,
  String? orderType,
  String? timeSlot,
  String? deliveryDate,
  num? deliveryAddressId,
  String? deliveryAddress,
  String? paymentMethod,
  num? deliveryBoyId,
  String? createdAt,
  String? updatedAt,
  String? image,
  String? orderKey,
}) => Orders(  id: id ?? _id,
  orderId: orderId ?? _orderId,
  userId: userId ?? _userId,
  userName: userName ?? _userName,
  orderAmount: orderAmount ?? _orderAmount,
  paymentStatus: paymentStatus ?? _paymentStatus,
  orderStatusId: orderStatusId ?? _orderStatusId,
  orderStatus: orderStatus ?? _orderStatus,
  orderType: orderType ?? _orderType,
  timeSlot: timeSlot ?? _timeSlot,
  deliveryDate: deliveryDate ?? _deliveryDate,
  deliveryAddressId: deliveryAddressId ?? _deliveryAddressId,
  deliveryAddress: deliveryAddress ?? _deliveryAddress,
  paymentMethod: paymentMethod ?? _paymentMethod,
  deliveryBoyId: deliveryBoyId ?? _deliveryBoyId,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  image: image ?? _image,
  orderKey: orderKey ?? _orderKey,
);
  num? get id => _id;
  String? get orderId => _orderId;
  num? get userId => _userId;
  String? get userName => _userName;
  String? get orderAmount => _orderAmount;
  String? get paymentStatus => _paymentStatus;
  String? get orderStatusId => _orderStatusId;
  String? get orderStatus => _orderStatus;
  String? get orderType => _orderType;
  String? get timeSlot => _timeSlot;
  String? get deliveryDate => _deliveryDate;
  num? get deliveryAddressId => _deliveryAddressId;
  String? get deliveryAddress => _deliveryAddress;
  String? get paymentMethod => _paymentMethod;
  num? get deliveryBoyId => _deliveryBoyId;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get image => _image;
  String? get orderKey => _orderKey;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['order_id'] = _orderId;
    map['user_id'] = _userId;
    map['user_name'] = _userName;
    map['order_amount'] = _orderAmount;
    map['payment_status'] = _paymentStatus;
    map['order_status_id'] = _orderStatusId;
    map['order_status'] = _orderStatus;
    map['order_type'] = _orderType;
    map['time_slot'] = _timeSlot;
    map['delivery_date'] = _deliveryDate;
    map['delivery_address_id'] = _deliveryAddressId;
    map['delivery_address'] = _deliveryAddress;
    map['payment_method'] = _paymentMethod;
    map['delivery_boy_id'] = _deliveryBoyId;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['image']  = _image;
    map['order_key'] = _orderKey;
    return map;
  }

}