class SearchShopModel {
  bool? success;
  String? errorMsg;
  List<ShopData>? shopData;

  SearchShopModel({this.success, this.errorMsg, this.shopData});

  SearchShopModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    errorMsg = json['errorMsg'];
    if (json['shop_data'] != null) {
      shopData = <ShopData>[];
      json['shop_data'].forEach((v) {
        shopData!.add(new ShopData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['errorMsg'] = this.errorMsg;
    if (this.shopData != null) {
      data['shop_data'] = this.shopData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ShopData {
  int? id;
  String? name;
  String? phone;
  String? alternatePhone;
  String? email;
  String? address;
  String? pinCode;
  String? location;
  String? latitude;
  String? longitude;
  String? isActive;
  String? description;
  String? shopType;
  String? radius;
  String? image;
  String? createdAt;
  String? updatedAt;

  ShopData(
      {this.id,
      this.name,
      this.phone,
      this.alternatePhone,
      this.email,
      this.address,
      this.pinCode,
      this.location,
      this.latitude,
      this.longitude,
      this.isActive,
      this.description,
      this.shopType,
      this.radius,
      this.image,
      this.createdAt,
      this.updatedAt});

  ShopData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    alternatePhone = json['alternate_phone'];
    email = json['email'];
    address = json['address'];
    pinCode = json['pin_code'];
    location = json['location'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    isActive = json['is_active'];
    description = json['description'];
    shopType = json['shop_type'];
    radius = json['radius'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['alternate_phone'] = this.alternatePhone;
    data['email'] = this.email;
    data['address'] = this.address;
    data['pin_code'] = this.pinCode;
    data['location'] = this.location;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['is_active'] = this.isActive;
    data['description'] = this.description;
    data['shop_type'] = this.shopType;
    data['radius'] = this.radius;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}