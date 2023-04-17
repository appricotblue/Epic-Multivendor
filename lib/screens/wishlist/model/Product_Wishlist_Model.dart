/// success : true
/// errorMsg : ""
/// wish_list_data : [{"id":1,"title":"product","featured_image_url":"http://phpstack-732301-3097288.cloudwaysapps.com/image_uploads/20221209074125_Epic_icon.png","price":1000,"is_wishlist":"true","created_at":"2022-12-09 07:41:25"}]

class ProductWishlistModel {
  ProductWishlistModel({
    bool? success,
    String? errorMsg,
    List<WishListData>? wishListData,
  }) {
    _success = success;
    _errorMsg = errorMsg;
    _wishListData = wishListData;
  }

  ProductWishlistModel.fromJson(dynamic json) {
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
  ProductWishlistModel copyWith({
    bool? success,
    String? errorMsg,
    List<WishListData>? wishListData,
  }) =>
      ProductWishlistModel(
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
/// title : "product"
/// featured_image_url : "http://phpstack-732301-3097288.cloudwaysapps.com/image_uploads/20221209074125_Epic_icon.png"
/// price : 1000
/// is_wishlist : "true"
/// created_at : "2022-12-09 07:41:25"

class WishListData {
  WishListData({
    num? id,
    String? title,
    String? featuredImageUrl,
    num? price,
    String? isWishlist,
    String? createdAt,
  }) {
    _id = id;
    _title = title;
    _featuredImageUrl = featuredImageUrl;
    _price = price;
    _isWishlist = isWishlist;
    _createdAt = createdAt;
  }

  WishListData.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _featuredImageUrl = json['featured_image_url'];
    _price = json['price'];
    _isWishlist = json['is_wishlist'];
    _createdAt = json['created_at'];
  }
  num? _id;
  String? _title;
  String? _featuredImageUrl;
  num? _price;
  String? _isWishlist;
  String? _createdAt;
  WishListData copyWith({
    num? id,
    String? title,
    String? featuredImageUrl,
    num? price,
    String? isWishlist,
    String? createdAt,
  }) =>
      WishListData(
        id: id ?? _id,
        title: title ?? _title,
        featuredImageUrl: featuredImageUrl ?? _featuredImageUrl,
        price: price ?? _price,
        isWishlist: isWishlist ?? _isWishlist,
        createdAt: createdAt ?? _createdAt,
      );
  num? get id => _id;
  String? get title => _title;
  String? get featuredImageUrl => _featuredImageUrl;
  num? get price => _price;
  String? get isWishlist => _isWishlist;
  String? get createdAt => _createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['featured_image_url'] = _featuredImageUrl;
    map['price'] = _price;
    map['is_wishlist'] = _isWishlist;
    map['created_at'] = _createdAt;
    return map;
  }
}
