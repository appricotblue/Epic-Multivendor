
class MyServiceDetailsModel {
    bool? success;
    String? errorMsg;
    ServiceData? serviceData;

    MyServiceDetailsModel({this.success, this.errorMsg, this.serviceData});

    MyServiceDetailsModel.fromJson(Map<String, dynamic> json) {
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
    String? serviceType;
    String? serviceTypeImage;
    dynamic brandId;
    String? description;
    String? details;
    String? price;
    String? status;
    String? image;
    bool? isWishlist;
    bool? isBooking;
    int? reviewCount;
    String? createdAt;
    String? updatedAt;

    ServiceData({this.id, this.title, this.serviceTypeId, this.serviceType, this.serviceTypeImage, this.brandId, this.description, this.details, this.price, this.status, this.image, this.isWishlist, this.isBooking, this.reviewCount, this.createdAt, this.updatedAt});

    ServiceData.fromJson(Map<String, dynamic> json) {
        id = json["id"];
        title = json["title"];
        serviceTypeId = json["service_type_id"];
        serviceType = json["service_type"];
        serviceTypeImage = json["service_type_image"];
        brandId = json["brand_id"];
        description = json["description"];
        details = json["details"];
        price = json["price"];
        status = json["status"];
        image = json["image"];
        isWishlist = json["is_wishlist"];
        isBooking = json["is_booking"];
        reviewCount = json["review_count"];
        createdAt = json["created_at"];
        updatedAt = json["updated_at"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["id"] = id;
        _data["title"] = title;
        _data["service_type_id"] = serviceTypeId;
        _data["service_type"] = serviceType;
        _data["service_type_image"] = serviceTypeImage;
        _data["brand_id"] = brandId;
        _data["description"] = description;
        _data["details"] = details;
        _data["price"] = price;
        _data["status"] = status;
        _data["image"] = image;
        _data["is_wishlist"] = isWishlist;
        _data["is_booking"] = isBooking;
        _data["review_count"] = reviewCount;
        _data["created_at"] = createdAt;
        _data["updated_at"] = updatedAt;
        return _data;
    }
}