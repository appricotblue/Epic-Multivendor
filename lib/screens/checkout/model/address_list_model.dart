class AddressListModel {
  AddressListModel({
    this.success,
    this.errorMsg,
    this.addressList,});

  AddressListModel.fromJson(dynamic json) {
    success = json['success'];
    errorMsg = json['errorMsg'];
    if (json['address_list'] != null) {
      addressList = [];
      json['address_list'].forEach((v) {
        addressList!.add(AddressList.fromJson(v));
      });
    }
  }
  bool? success;
  String? errorMsg;
  List<AddressList>? addressList;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['errorMsg'] = errorMsg;
    if (addressList != null) {
      map['address_list'] = addressList!.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class AddressList {
  AddressList({
    this.id,
    this.userId,
    this.address,
    this.location,
    this.latitude,
    this.longitude,
    this.pincode,
    this.createdAt,
    this.updatedAt,});

  AddressList.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    address = json['address'];
    location = json['location'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    pincode = json['pincode'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  int? userId;
  String? address;
  String? location;
  String? latitude;
  String? longitude;
  String? pincode;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_id'] = userId;
    map['address'] = address;
    map['location'] = location;
    map['latitude'] = latitude;
    map['longitude'] = longitude;
    map['pincode'] = pincode;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}