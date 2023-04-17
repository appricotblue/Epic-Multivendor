/// success : true
/// errorMsg : ""
/// services : [{"id":1,"service_title":"service","price":"100.00","image_url":"http://phpstack-732301-3097288.cloudwaysapps.com/image_uploads/20221209013139_Epic_icon.png"},{"id":2,"service_title":"service","price":"100.00","image_url":"http://phpstack-732301-3097288.cloudwaysapps.com/image_uploads/20221209013139_Epic_icon.png"},{"id":3,"service_title":"service","price":"100.00","image_url":"http://phpstack-732301-3097288.cloudwaysapps.com/image_uploads/20221209013139_Epic_icon.png"}]

class MyServiceListModel {
  MyServiceListModel({
      bool? success, 
      String? errorMsg, 
      List<Services>? services,}){
    _success = success;
    _errorMsg = errorMsg;
    _services = services;
}

  MyServiceListModel.fromJson(dynamic json) {
    _success = json['success'];
    _errorMsg = json['errorMsg'];
    if (json['services'] != null) {
      _services = [];
      json['services'].forEach((v) {
        _services?.add(Services.fromJson(v));
      });
    }
  }
  bool? _success;
  String? _errorMsg;
  List<Services>? _services;
MyServiceListModel copyWith({  bool? success,
  String? errorMsg,
  List<Services>? services,
}) => MyServiceListModel(  success: success ?? _success,
  errorMsg: errorMsg ?? _errorMsg,
  services: services ?? _services,
);
  bool? get success => _success;
  String? get errorMsg => _errorMsg;
  List<Services>? get services => _services;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['errorMsg'] = _errorMsg;
    if (_services != null) {
      map['services'] = _services?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 1
/// service_title : "service"
/// price : "100.00"
/// image_url : "http://phpstack-732301-3097288.cloudwaysapps.com/image_uploads/20221209013139_Epic_icon.png"

class Services {
  Services({
      num? id, 
      String? serviceTitle, 
      String? price, 
      String? imageUrl,}){
    _id = id;
    _serviceTitle = serviceTitle;
    _price = price;
    _imageUrl = imageUrl;
}

  Services.fromJson(dynamic json) {
    _id = json['id'];
    _serviceTitle = json['service_title'];
    _price = json['price'];
    _imageUrl = json['image_url'];
  }
  num? _id;
  String? _serviceTitle;
  String? _price;
  String? _imageUrl;
Services copyWith({  num? id,
  String? serviceTitle,
  String? price,
  String? imageUrl,
}) => Services(  id: id ?? _id,
  serviceTitle: serviceTitle ?? _serviceTitle,
  price: price ?? _price,
  imageUrl: imageUrl ?? _imageUrl,
);
  num? get id => _id;
  String? get serviceTitle => _serviceTitle;
  String? get price => _price;
  String? get imageUrl => _imageUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['service_title'] = _serviceTitle;
    map['price'] = _price;
    map['image_url'] = _imageUrl;
    return map;
  }

}