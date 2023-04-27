class UserModel {
  String? userId;
  String? phone;
  String? otp;
  String? placeName;
  String? lat;
  String? lng;

  /// FOR SHOP CATEGORY
  String? shopCategoryTypeId;
  String? shopCategoryType;
  String? shopCategoryTypeImage;
  String? shopProductId;
  String? shopProductImage;
  String? shopProductTitle;
  String? shopProductPrice;

  /// For shop product
  String? shopId;
  String? shopName;
  String? shopImage;
  String? addressId;
  int? orderAmount;
  /// For service category
  String? serviceCategoryId;
  String? serviceCategoryName;
  String? serviceCategoryImage;
  String? serviceBrandId;
  String? serviceId;
  String? servicePrice;
  String? serviceImage;
  String? serviceTitle;
  String? serviceType;
  String? name;
  String? number;
  String? email;
  String? query;
  String? catgeoryId;
  String? subCategoryId;

  UserModel(
      {this.userId,
      this.phone,
      this.otp,
      this.lat,
      this.lng,
      this.placeName,
      this.shopCategoryTypeId,
      this.shopCategoryType,
      this.shopCategoryTypeImage,
      this.shopProductId,
      this.shopProductImage,
      this.shopProductTitle,
      this.shopProductPrice,
      this.shopId,
      this.shopName,
      this.shopImage,
      this.addressId,
      this.orderAmount,
      this.serviceCategoryId,
      this.serviceCategoryName,
      this.serviceCategoryImage,
      this.serviceBrandId,
      this.serviceId,
      this.servicePrice,
      this.serviceImage,
      this.serviceTitle,
      this.serviceType,
      this.name,
      this.number,
      this.email,
      this.query,
      this.catgeoryId,
      this.subCategoryId
      });

  void updateWith({
    String? userId,
    String? phone,
    String? otp,
    String? placeName,
    String? lat,
    String? lng,
    String? categoryTypeId,
    String? categoryType,
    String? categoryTypeImage,
    String? shopProductId,
    String? shopProductImage,
    String? shopProductTitle,
    String? shopProductPrice,
    String? shopId,
    String? shopName,
    String? shopImage,
    String? addressId,
    int? orderAmount,
    String? serviceCategoryId,
    String? serviceCategoryName,
    String? serviceCategoryImage,
    String? serviceBrandId,
    String? serviceId,
    String? servicePrice,
    String? serviceImage,
    String? serviceTitle,
    String? serviceType,
    String? name,
    String? number,
    String? email,
    String? query,
    String? catgeoryId,
    String? subCategoryId,
  }) {
    this.userId = userId ?? this.userId;
    this.phone = phone ?? this.phone;
    this.otp = otp ?? this.otp;
    this.placeName = placeName ?? this.placeName;
    this.lat = lat ?? this.lat;
    this.lng = lng ?? this.lng;
    this.shopCategoryTypeId = categoryTypeId ?? this.shopCategoryTypeId;
    this.shopCategoryType = categoryType ?? this.shopCategoryType;
    this.shopCategoryTypeImage =
        categoryTypeImage ?? this.shopCategoryTypeImage;
    this.shopProductId = shopProductId ?? this.shopProductId;
    this.shopProductImage = shopProductImage ?? this.shopProductImage;
    this.shopProductTitle = shopProductTitle ?? this.shopProductTitle;
    this.shopProductPrice = shopProductPrice ?? this.shopProductPrice;
    this.shopId = shopId ?? this.shopId;
    this.shopName = shopName ?? this.shopName;
    this.shopImage = shopImage ?? this.shopImage;
    this.addressId = addressId ?? this.addressId;
    this.orderAmount = orderAmount ?? this.orderAmount;
    this.serviceCategoryId = serviceCategoryId ?? this.serviceCategoryId;
    this.serviceCategoryName = serviceCategoryName ?? this.serviceCategoryName;
    this.serviceCategoryImage =
        serviceCategoryImage ?? this.serviceCategoryImage;
    this.serviceBrandId = serviceBrandId ?? this.serviceBrandId;
    this.serviceId = serviceId ?? this.serviceId;
    this.servicePrice = servicePrice ?? this.servicePrice;
    this.serviceImage = serviceImage ?? this.serviceImage;
    this.serviceTitle = serviceTitle ?? this.serviceTitle;
    this.serviceType = serviceType ?? this.serviceType;
    this.name = name ?? this.name;
    this.number = number ?? this.number;
    this.email = email ?? this.email;
    this.query = query ?? this.query;
    this.catgeoryId = catgeoryId ?? this.catgeoryId;
    this.subCategoryId = subCategoryId ?? this.subCategoryId;
  }

  //write
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'userId': userId,
      'phone': phone,
      'otp': otp,
      'placeName': placeName,
      'lat': lat,
      'lng': lng,
      'shopCategoryTypeId': shopCategoryTypeId,
      'shopCategoryType': shopCategoryType,
      'shopCategoryTypeImage': shopCategoryTypeImage,
      'shopProductId': shopProductId,
      'shopProductImage': shopProductImage,
      'shopProductTitle': shopProductTitle,
      'shopProductPrice': shopProductPrice,
      'shopId': shopId,
      'shopName': shopName,
      'shopImage':shopImage,
      'addressId': addressId,
      'orderAmount': orderAmount,
      'serviceCategoryId': serviceCategoryId,
      'serviceCategoryName': serviceCategoryName,
      'serviceCategoryImage': serviceCategoryImage,
      'serviceBrandId': serviceBrandId,
      'serviceId': serviceId,
      'servicePrice': servicePrice,
      'serviceImage': serviceImage,
      'serviceTitle': serviceTitle,
      'serviceType':serviceType,
      'name': name,
      'number': number,
      'email': email,
      'query': query,
      'catgeoryId':catgeoryId,
      'subCategoryId':subCategoryId
    };
  }

  // read
  factory UserModel.fromJson(
    Map<String, dynamic> value,
  ) {
    return UserModel(
        userId: value['userId'],
        phone: value['phone'],
        otp: value['otp'],
        placeName: value['placeName'],
        lat: value['lat'],
        lng: value['lng'],
        shopCategoryTypeId: value['shopCategoryTypeId'],
        shopCategoryType: value['shopCategoryType'],
        shopCategoryTypeImage: value['shopCategoryTypeImage'],
        shopProductId: value['shopProductId'],
        shopProductImage: value['shopProductImage'],
        shopProductTitle: value['shopProductTitle'],
        shopProductPrice: value['shopProductPrice'],
        shopId: value['shopId'],
        shopName: value['shopName'],
        shopImage:value['shopImage'],
        addressId: value['addressId'],
        orderAmount: value['orderAmount'],
        serviceCategoryId: value['serviceCategoryId'],
        serviceCategoryName: value['serviceCategoryName'],
        serviceCategoryImage: value['serviceCategoryImage'],
        serviceBrandId: value['serviceBrandId'],
        serviceId: value['serviceId'],
        servicePrice: value['servicePrice'],
        serviceImage: value['serviceImage'],
        serviceTitle: value['serviceTitle'],
        name: value['name'],
        number: value['number'],
        email: value['email'],
        query: value['query'],
        catgeoryId:value['catgeoryId'],
        subCategoryId :value['subCategoryId']
      );
  }
}
