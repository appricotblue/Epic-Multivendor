/// success : true
/// errorMsg : ""
/// wish_list_data : [{"id":1,"title":"service","price":"100.00","status":"Pending","image_url":"http://phpstack-732301-3097288.cloudwaysapps.com/image_uploads/20221209013139_Epic_icon.png","is_wishlist":"true","created_at":"2022-12-09 13:31:39"}]

class ServiceWishlistModel {
  ServiceWishlistModel({
    bool? success,
    String? errorMsg,
    List<WishListData>? wishListData,
  }) {
    _success = success;
    _errorMsg = errorMsg;
    _wishListData = wishListData;
  }

  ServiceWishlistModel.fromJson(dynamic json) {
    _success = json['success'];
    _errorMsg = json['errorMsg'];
    if (json['wish_list_data'] != null) {
      _wishListData = [];
      json['wish_list_data'].forEach((v) {
        _wishListData?.add(WishListData.fromJson(v));
      });
    }
  }
  bool? _success;
  String? _errorMsg;
  List<WishListData>? _wishListData;
  ServiceWishlistModel copyWith({
    bool? success,
    String? errorMsg,
    List<WishListData>? wishListData,
  }) =>
      ServiceWishlistModel(
        success: success ?? _success,
        errorMsg: errorMsg ?? _errorMsg,
        wishListData: wishListData ?? _wishListData,
      );
  bool? get success => _success;
  String? get errorMsg => _errorMsg;
  List<WishListData>? get wishListData => _wishListData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['errorMsg'] = _errorMsg;
    if (_wishListData != null) {
      map['wish_list_data'] = _wishListData?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : 1
/// title : "service"
/// price : "100.00"
/// status : "Pending"
/// image_url : "http://phpstack-732301-3097288.cloudwaysapps.com/image_uploads/20221209013139_Epic_icon.png"
/// is_wishlist : "true"
/// created_at : "2022-12-09 13:31:39"

class WishListData {
  WishListData({
    num? id,
    String? title,
    String? price,
    String? status,
    String? imageUrl,
    String? isWishlist,
    String? createdAt,
  }) {
    _id = id;
    _title = title;
    _price = price;
    _status = status;
    _imageUrl = imageUrl;
    _isWishlist = isWishlist;
    _createdAt = createdAt;
  }

  WishListData.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _price = json['price'];
    _status = json['status'];
    _imageUrl = json['image_url'];
    _isWishlist = json['is_wishlist'];
    _createdAt = json['created_at'];
  }
  num? _id;
  String? _title;
  String? _price;
  String? _status;
  String? _imageUrl;
  String? _isWishlist;
  String? _createdAt;
  WishListData copyWith({
    num? id,
    String? title,
    String? price,
    String? status,
    String? imageUrl,
    String? isWishlist,
    String? createdAt,
  }) =>
      WishListData(
        id: id ?? _id,
        title: title ?? _title,
        price: price ?? _price,
        status: status ?? _status,
        imageUrl: imageUrl ?? _imageUrl,
        isWishlist: isWishlist ?? _isWishlist,
        createdAt: createdAt ?? _createdAt,
      );
  num? get id => _id;
  String? get title => _title;
  String? get price => _price;
  String? get status => _status;
  String? get imageUrl => _imageUrl;
  String? get isWishlist => _isWishlist;
  String? get createdAt => _createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['price'] = _price;
    map['status'] = _status;
    map['image_url'] = _imageUrl;
    map['is_wishlist'] = _isWishlist;
    map['created_at'] = _createdAt;
    return map;
  }
}
