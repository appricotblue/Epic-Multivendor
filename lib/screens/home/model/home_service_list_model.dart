/// success : true
/// errorMsg : ""
/// service_banners : [{"image_name":"20230228053720_Service Banner.png"}]
/// service_categories : [{"id":3,"types":"test type","status":"1","image_name":"test.png","image_url":"","created_at":"2023-03-17 13:04:34","updated_at":"2023-03-17 13:04:34"}]
/// services : [{"id":1,"title":"services","service_type_id":"3","brand_id":1,"description":"test data","price":"100","status":"1","image":"test.png","is_wishlist":false,"is_booking":true,"created_at":"2023-03-17 13:05:30","updated_at":"2023-03-17 13:05:30"},{"id":4,"title":"test data","service_type_id":"1","brand_id":null,"description":"test data","price":"100","status":null,"image":null,"is_wishlist":false,"is_booking":false,"created_at":"2023-03-25 10:08:19","updated_at":"2023-03-25 10:08:19"},{"id":5,"title":null,"service_type_id":null,"brand_id":null,"description":null,"price":null,"status":null,"image":null,"is_wishlist":false,"is_booking":false,"created_at":"2023-03-25 10:08:35","updated_at":"2023-03-25 10:08:35"}]

class HomeServiceListModel {
  HomeServiceListModel({
      bool? success, 
      String? errorMsg, 
      List<ServiceBanners>? serviceBanners, 
      List<ServiceCategories>? serviceCategories, 
      List<Services>? services,}){
    _success = success;
    _errorMsg = errorMsg;
    _serviceBanners = serviceBanners;
    _serviceCategories = serviceCategories;
    _services = services;
}

  HomeServiceListModel.fromJson(dynamic json) {
    _success = json['success'];
    _errorMsg = json['errorMsg'];
    if (json['service_banners'] != null) {
      _serviceBanners = [];
      json['service_banners'].forEach((v) {
        _serviceBanners?.add(ServiceBanners.fromJson(v));
      });
    }
    if (json['service_categories'] != null) {
      _serviceCategories = [];
      json['service_categories'].forEach((v) {
        _serviceCategories?.add(ServiceCategories.fromJson(v));
      });
    }
    if (json['services'] != null) {
      _services = [];
      json['services'].forEach((v) {
        _services?.add(Services.fromJson(v));
      });
    }
  }
  bool? _success;
  String? _errorMsg;
  List<ServiceBanners>? _serviceBanners;
  List<ServiceCategories>? _serviceCategories;
  List<Services>? _services;
HomeServiceListModel copyWith({  bool? success,
  String? errorMsg,
  List<ServiceBanners>? serviceBanners,
  List<ServiceCategories>? serviceCategories,
  List<Services>? services,
}) => HomeServiceListModel(  success: success ?? _success,
  errorMsg: errorMsg ?? _errorMsg,
  serviceBanners: serviceBanners ?? _serviceBanners,
  serviceCategories: serviceCategories ?? _serviceCategories,
  services: services ?? _services,
);
  bool? get success => _success;
  String? get errorMsg => _errorMsg;
  List<ServiceBanners>? get serviceBanners => _serviceBanners;
  List<ServiceCategories>? get serviceCategories => _serviceCategories;
  List<Services>? get services => _services;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['errorMsg'] = _errorMsg;
    if (_serviceBanners != null) {
      map['service_banners'] = _serviceBanners?.map((v) => v.toJson()).toList();
    }
    if (_serviceCategories != null) {
      map['service_categories'] = _serviceCategories?.map((v) => v.toJson()).toList();
    }
    if (_services != null) {
      map['services'] = _services?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 1
/// title : "services"
/// service_type_id : "3"
/// brand_id : 1
/// description : "test data"
/// price : "100"
/// status : "1"
/// image : "test.png"
/// is_wishlist : false
/// is_booking : true
/// created_at : "2023-03-17 13:05:30"
/// updated_at : "2023-03-17 13:05:30"

class Services {
  Services({
      num? id, 
      String? title, 
      String? serviceTypeId, 
      num? brandId, 
      String? description, 
      String? price, 
      String? status, 
      String? image, 
      bool? isWishlist, 
      bool? isBooking, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _title = title;
    _serviceTypeId = serviceTypeId;
    _brandId = brandId;
    _description = description;
    _price = price;
    _status = status;
    _image = image;
    _isWishlist = isWishlist;
    _isBooking = isBooking;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Services.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _serviceTypeId = json['service_type_id'];
    _brandId = json['brand_id'];
    _description = json['description'];
    _price = json['price'];
    _status = json['status'];
    _image = json['image'];
    _isWishlist = json['is_wishlist'];
    _isBooking = json['is_booking'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  String? _title;
  String? _serviceTypeId;
  num? _brandId;
  String? _description;
  String? _price;
  String? _status;
  String? _image;
  bool? _isWishlist;
  bool? _isBooking;
  String? _createdAt;
  String? _updatedAt;
Services copyWith({  num? id,
  String? title,
  String? serviceTypeId,
  num? brandId,
  String? description,
  String? price,
  String? status,
  String? image,
  bool? isWishlist,
  bool? isBooking,
  String? createdAt,
  String? updatedAt,
}) => Services(  id: id ?? _id,
  title: title ?? _title,
  serviceTypeId: serviceTypeId ?? _serviceTypeId,
  brandId: brandId ?? _brandId,
  description: description ?? _description,
  price: price ?? _price,
  status: status ?? _status,
  image: image ?? _image,
  isWishlist: isWishlist ?? _isWishlist,
  isBooking: isBooking ?? _isBooking,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  String? get title => _title;
  String? get serviceTypeId => _serviceTypeId;
  num? get brandId => _brandId;
  String? get description => _description;
  String? get price => _price;
  String? get status => _status;
  String? get image => _image;
  bool? get isWishlist => _isWishlist;
  bool? get isBooking => _isBooking;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['service_type_id'] = _serviceTypeId;
    map['brand_id'] = _brandId;
    map['description'] = _description;
    map['price'] = _price;
    map['status'] = _status;
    map['image'] = _image;
    map['is_wishlist'] = _isWishlist;
    map['is_booking'] = _isBooking;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}

/// id : 3
/// types : "test type"
/// status : "1"
/// image_name : "test.png"
/// image_url : ""
/// created_at : "2023-03-17 13:04:34"
/// updated_at : "2023-03-17 13:04:34"

class ServiceCategories {
  ServiceCategories({
      num? id, 
      String? types, 
      String? status, 
      String? imageName, 
      String? imageUrl, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _types = types;
    _status = status;
    _imageName = imageName;
    _imageUrl = imageUrl;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  ServiceCategories.fromJson(dynamic json) {
    _id = json['id'];
    _types = json['types'];
    _status = json['status'];
    _imageName = json['image_name'];
    _imageUrl = json['image_url'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  String? _types;
  String? _status;
  String? _imageName;
  String? _imageUrl;
  String? _createdAt;
  String? _updatedAt;
ServiceCategories copyWith({  num? id,
  String? types,
  String? status,
  String? imageName,
  String? imageUrl,
  String? createdAt,
  String? updatedAt,
}) => ServiceCategories(  id: id ?? _id,
  types: types ?? _types,
  status: status ?? _status,
  imageName: imageName ?? _imageName,
  imageUrl: imageUrl ?? _imageUrl,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  String? get types => _types;
  String? get status => _status;
  String? get imageName => _imageName;
  String? get imageUrl => _imageUrl;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['types'] = _types;
    map['status'] = _status;
    map['image_name'] = _imageName;
    map['image_url'] = _imageUrl;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}

/// image_name : "20230228053720_Service Banner.png"

class ServiceBanners {
  ServiceBanners({
      String? imageName,}){
    _imageName = imageName;
}

  ServiceBanners.fromJson(dynamic json) {
    _imageName = json['image_name'];
  }
  String? _imageName;
ServiceBanners copyWith({  String? imageName,
}) => ServiceBanners(  imageName: imageName ?? _imageName,
);
  String? get imageName => _imageName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['image_name'] = _imageName;
    return map;
  }

}