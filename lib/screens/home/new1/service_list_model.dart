class ServiceListModel {
  bool? success;
  String? errorMsg;
  List<AllServicesList>? services;
  Pagination? pagination;

  ServiceListModel(
      {this.success, this.errorMsg, this.services, this.pagination});

  ServiceListModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    errorMsg = json['errorMsg'];
    if (json['services'] != null) {
      services = <AllServicesList>[];
      json['services'].forEach((v) {
        services!.add(new AllServicesList.fromJson(v));
      });
    }
    pagination = json['pagination'] != null
        ? new Pagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['errorMsg'] = this.errorMsg;
    if (this.services != null) {
      data['services'] = this.services!.map((v) => v.toJson()).toList();
    }
    if (this.pagination != null) {
      data['pagination'] = this.pagination!.toJson();
    }
    return data;
  }
}

class AllServicesList {
  int? id;
  String? title;
  String? serviceTypeId;
  String? serviceType;
  String? serviceTypeImage;
  // Null? brandId;
  String? description;
  // Null? details;
  String? price;
  String? status;
  String? image;
  bool? isWishlist;
  bool? isBooking;
  int? reviewCount;
  String? shopLocation;
  String? createdAt;
  String? updatedAt;

  AllServicesList(
      {this.id,
      this.title,
      this.serviceTypeId,
      this.serviceType,
      this.serviceTypeImage,
      // this.brandId,
      this.description,
      // this.details,
      this.price,
      this.status,
      this.image,
      this.isWishlist,
      this.isBooking,
      this.reviewCount,
      this.shopLocation,
      this.createdAt,
      this.updatedAt});

  AllServicesList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    serviceTypeId = json['service_type_id'];
    serviceType = json['service_type'];
    serviceTypeImage = json['service_type_image'];
    // brandId = json['brand_id'];
    description = json['description'];
    // details = json['details'];
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
    // data['brand_id'] = this.brandId;
    data['description'] = this.description;
    // data['details'] = this.details;
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

class Pagination {
  int? currentPage;
  int? lastPage;
  int? perPage;

  Pagination({this.currentPage, this.lastPage, this.perPage});

  Pagination.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    lastPage = json['last_page'];
    perPage = json['per_page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    data['last_page'] = this.lastPage;
    data['per_page'] = this.perPage;
    return data;
  }
}
