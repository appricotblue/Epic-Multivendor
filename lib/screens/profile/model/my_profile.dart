/// success : true
/// errorMsg : ""
/// profile_data : {"id":1,"name":"rilna","email":"rilna@gmail.com","email_verified_at":null,"password":null,"phone":"9876543210","location":null,"latitude":null,"longitude":null,"remember_token":null,"wallet_amount":100,"created_at":"2022-12-09 05:58:31","updated_at":"2023-02-27 10:57:00"}

class MyProfileModel {
  MyProfileModel({
    bool? success,
    String? errorMsg,
    ProfileData? profileData,}){
    _success = success;
    _errorMsg = errorMsg;
    _profileData = profileData;
  }

  MyProfileModel.fromJson(dynamic json) {
    _success = json['success'];
    _errorMsg = json['errorMsg'];
    _profileData = json['profile_data'] != null ? ProfileData.fromJson(json['profile_data']) : null;
  }
  bool? _success;
  String? _errorMsg;
  ProfileData? _profileData;
  MyProfileModel copyWith({  bool? success,
    String? errorMsg,
    ProfileData? profileData,
  }) => MyProfileModel(  success: success ?? _success,
    errorMsg: errorMsg ?? _errorMsg,
    profileData: profileData ?? _profileData,
  );
  bool? get success => _success;
  String? get errorMsg => _errorMsg;
  ProfileData? get profileData => _profileData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['errorMsg'] = _errorMsg;
    if (_profileData != null) {
      map['profile_data'] = _profileData?.toJson();
    }
    return map;
  }

}

/// id : 1
/// name : "rilna"
/// email : "rilna@gmail.com"
/// email_verified_at : null
/// password : null
/// phone : "9876543210"
/// location : null
/// latitude : null
/// longitude : null
/// remember_token : null
/// wallet_amount : 100
/// created_at : "2022-12-09 05:58:31"
/// updated_at : "2023-02-27 10:57:00"

class ProfileData {
  ProfileData({
    num? id,
    String? name,
    String? email,
    dynamic emailVerifiedAt,
    dynamic password,
    String? phone,
    dynamic location,
    dynamic latitude,
    dynamic longitude,
    dynamic rememberToken,
    num? walletAmount,
    String? createdAt,
    String? updatedAt,}){
    _id = id;
    _name = name;
    _email = email;
    _emailVerifiedAt = emailVerifiedAt;
    _password = password;
    _phone = phone;
    _location = location;
    _latitude = latitude;
    _longitude = longitude;
    _rememberToken = rememberToken;
    _walletAmount = walletAmount;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  ProfileData.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _email = json['email'];
    _emailVerifiedAt = json['email_verified_at'];
    _password = json['password'];
    _phone = json['phone'];
    _location = json['location'];
    _latitude = json['latitude'];
    _longitude = json['longitude'];
    _rememberToken = json['remember_token'];
    _walletAmount = json['wallet_amount'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  String? _name;
  String? _email;
  dynamic _emailVerifiedAt;
  dynamic _password;
  String? _phone;
  dynamic _location;
  dynamic _latitude;
  dynamic _longitude;
  dynamic _rememberToken;
  num? _walletAmount;
  String? _createdAt;
  String? _updatedAt;
  ProfileData copyWith({  num? id,
    String? name,
    String? email,
    dynamic emailVerifiedAt,
    dynamic password,
    String? phone,
    dynamic location,
    dynamic latitude,
    dynamic longitude,
    dynamic rememberToken,
    num? walletAmount,
    String? createdAt,
    String? updatedAt,
  }) => ProfileData(  id: id ?? _id,
    name: name ?? _name,
    email: email ?? _email,
    emailVerifiedAt: emailVerifiedAt ?? _emailVerifiedAt,
    password: password ?? _password,
    phone: phone ?? _phone,
    location: location ?? _location,
    latitude: latitude ?? _latitude,
    longitude: longitude ?? _longitude,
    rememberToken: rememberToken ?? _rememberToken,
    walletAmount: walletAmount ?? _walletAmount,
    createdAt: createdAt ?? _createdAt,
    updatedAt: updatedAt ?? _updatedAt,
  );
  num? get id => _id;
  String? get name => _name;
  String? get email => _email;
  dynamic get emailVerifiedAt => _emailVerifiedAt;
  dynamic get password => _password;
  String? get phone => _phone;
  dynamic get location => _location;
  dynamic get latitude => _latitude;
  dynamic get longitude => _longitude;
  dynamic get rememberToken => _rememberToken;
  num? get walletAmount => _walletAmount;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['email'] = _email;
    map['email_verified_at'] = _emailVerifiedAt;
    map['password'] = _password;
    map['phone'] = _phone;
    map['location'] = _location;
    map['latitude'] = _latitude;
    map['longitude'] = _longitude;
    map['remember_token'] = _rememberToken;
    map['wallet_amount'] = _walletAmount;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}