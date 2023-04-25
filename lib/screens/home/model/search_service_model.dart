class SearchServiceModel {
  bool? success;
  String? errorMsg;
  List<Services>? services;

  SearchServiceModel({this.success, this.errorMsg, this.services});

  SearchServiceModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    errorMsg = json['errorMsg'];
    if (json['services'] != null) {
      services = <Services>[];
      json['services'].forEach((v) {
        services!.add(new Services.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['errorMsg'] = this.errorMsg;
    if (this.services != null) {
      data['services'] = this.services!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Services {
  int? id;
  String? title;
  String? serviceTypeId;
  String? serviceType;
  String? serviceTypeImage;
  Null? brandId;
  String? description;
  String? details;
  String? price;
  String? status;
  String? image;
  bool? isWishlist;
  bool? isBooking;
  int? reviewCount;
  String? shopLocation;
  String? createdAt;
  String? updatedAt;

  Services(
      {this.id,
      this.title,
      this.serviceTypeId,
      this.serviceType,
      this.serviceTypeImage,
      this.brandId,
      this.description,
      this.details,
      this.price,
      this.status,
      this.image,
      this.isWishlist,
      this.isBooking,
      this.reviewCount,
      this.shopLocation,
      this.createdAt,
      this.updatedAt});

  Services.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    serviceTypeId = json['service_type_id'];
    serviceType = json['service_type'];
    serviceTypeImage = json['service_type_image'];
    brandId = json['brand_id'];
    description = json['description'];
    details = json['details'];
    price = json['price'];
    status = json['status'];
    image = json['image'];
    isWishlist = json['is_wishlist'];
    isBooking = json['is_booking'];
    reviewCount = json['review_count'];
    shopLocation = json['shop_location'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['service_type_id'] = this.serviceTypeId;
    data['service_type'] = this.serviceType;
    data['service_type_image'] = this.serviceTypeImage;
    data['brand_id'] = this.brandId;
    data['description'] = this.description;
    data['details'] = this.details;
    data['price'] = this.price;
    data['status'] = this.status;
    data['image'] = this.image;
    data['is_wishlist'] = this.isWishlist;
    data['is_booking'] = this.isBooking;
    data['review_count'] = this.reviewCount;
    data['shop_location'] = this.shopLocation;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}