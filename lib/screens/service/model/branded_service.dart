
class BrandedServiceModel {
  bool? success;
  String? errorMsg;
  List<Services>? services;

  BrandedServiceModel({this.success, this.errorMsg, this.services});

  BrandedServiceModel.fromJson(Map<String, dynamic> json) {
    success = json["success"];
    errorMsg = json["errorMsg"];
    services = json["services"] == null ? null : (json["services"] as List).map((e) => Services.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["success"] = success;
    _data["errorMsg"] = errorMsg;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["title"] = title;
    data["service_type_id"] = serviceTypeId;
    data["brand_id"] = brandId;
    data["description"] = description;
    data["price"] = price;
    data["status"] = status;
    data["image"] = image;
    data["is_wishlist"] = isWishlist;
    data["is_booking"] = isBooking;
    data["created_at"] = createdAt;
    data["updated_at"] = updatedAt;
    return data;
  }
}