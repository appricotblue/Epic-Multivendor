
class ServiceDetailsModel {
  bool? success;
  String? errorMsg;
  ServiceData? serviceData;

  ServiceDetailsModel({this.success, this.errorMsg, this.serviceData});

  ServiceDetailsModel.fromJson(Map<String, dynamic> json) {
    success = json["success"];
    errorMsg = json["errorMsg"];
    serviceData = json["service_data"] == null ? null : ServiceData.fromJson(json["service_data"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["success"] = success;
    _data["errorMsg"] = errorMsg;
    if(serviceData != null) {
      _data["service_data"] = serviceData?.toJson();
    }
    return _data;
  }
}

class ServiceData {
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

  ServiceData({this.id, this.title, this.serviceTypeId, this.brandId, this.description, this.price, this.status, this.image, this.isWishlist, this.isBooking, this.createdAt, this.updatedAt});

  ServiceData.fromJson(Map<String, dynamic> json) {
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