
class CategoryServiceModel {
  bool? success;
  String? errorMsg;
  List<Brands>? brands;
  List<FeaturedServices>? featuredServices;
  List<Services>? services;

  CategoryServiceModel({this.success, this.errorMsg, this.brands, this.featuredServices, this.services});

  CategoryServiceModel.fromJson(Map<String, dynamic> json) {
    success = json["success"];
    errorMsg = json["errorMsg"];
    brands = json["brands"] == null ? null : (json["brands"] as List).map((e) => Brands.fromJson(e)).toList();
    featuredServices = json["featured_services"] == null ? null : (json["featured_services"] as List).map((e) => FeaturedServices.fromJson(e)).toList();
    services = json["services"] == null ? null : (json["services"] as List).map((e) => Services.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["success"] = success;
    _data["errorMsg"] = errorMsg;
    if(brands != null) {
      _data["brands"] = brands?.map((e) => e.toJson()).toList();
    }
    if(featuredServices != null) {
      _data["featured_services"] = featuredServices?.map((e) => e.toJson()).toList();
    }
    if(services != null) {
      _data["services"] = services?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Services {
  int? id;
  String? title;
  String? serviceTypeId;
  int? brandId;
  String? description;
  String? price;
  String? status;
  String? image;
  bool? isWishlist;
  bool? isBooking;
  String? createdAt;
  String? updatedAt;

  Services({this.id, this.title, this.serviceTypeId, this.brandId, this.description, this.price, this.status, this.image, this.isWishlist, this.isBooking, this.createdAt, this.updatedAt});

  Services.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    serviceTypeId = json["service_type_id"];
    brandId = json["brand_id"];
    description = json["description"];
    price = json["price"];
    status = json["status"];
    image = json["image"];
    isWishlist = json["is_wishlist"];
    isBooking = json["is_booking"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["title"] = title;
    _data["service_type_id"] = serviceTypeId;
    _data["brand_id"] = brandId;
    _data["description"] = description;
    _data["price"] = price;
    _data["status"] = status;
    _data["image"] = image;
    _data["is_wishlist"] = isWishlist;
    _data["is_booking"] = isBooking;
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    return _data;
  }
}

class FeaturedServices {
  int? id;
  String? title;
  String? serviceTypeId;
  int? brandId;
  String? description;
  String? price;
  String? status;
  String? image;
  bool? isWishlist;
  bool? isBooking;
  String? createdAt;
  String? updatedAt;

  FeaturedServices({this.id, this.title, this.serviceTypeId, this.brandId, this.description, this.price, this.status, this.image, this.isWishlist, this.isBooking, this.createdAt, this.updatedAt});

  FeaturedServices.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    serviceTypeId = json["service_type_id"];
    brandId = json["brand_id"];
    description = json["description"];
    price = json["price"];
    status = json["status"];
    image = json["image"];
    isWishlist = json["is_wishlist"];
    isBooking = json["is_booking"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["title"] = title;
    _data["service_type_id"] = serviceTypeId;
    _data["brand_id"] = brandId;
    _data["description"] = description;
    _data["price"] = price;
    _data["status"] = status;
    _data["image"] = image;
    _data["is_wishlist"] = isWishlist;
    _data["is_booking"] = isBooking;
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    return _data;
  }
}

class Brands {
  int? id;
  int? serviceTypeId;
  String? brandName;
  String? image;
  String? createdAt;
  String? updatedAt;

  Brands({this.id, this.serviceTypeId, this.brandName, this.image, this.createdAt, this.updatedAt});

  Brands.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    serviceTypeId = json["service_type_id"];
    brandName = json["brand_name"];
    image = json["image"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["service_type_id"] = serviceTypeId;
    _data["brand_name"] = brandName;
    _data["image"] = image;
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    return _data;
  }
}