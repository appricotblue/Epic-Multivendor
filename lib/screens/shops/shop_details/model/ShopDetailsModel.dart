/// success : true
/// errorMsg : ""
/// product_data : {"id":1,"name":"Apple","description":"The apple is one of the pome (fleshy) fruits. Apples at harvest vary widely in size, shape, colour, and acidity, but most are fairly round and some shade of red or yellow. The thousands of varieties fall into three broad classes: cider, cooking, and dessert varieties.","price":140,"sale_price":100,"unit":"kg","stock":0,"category":5,"sub_category":5,"status":"Available","featured":"false","is_new":"1","featured_image_name":"20230228061022_download (8).jpg","wallet_amount":0,"discount":null,"is_wishlist":false,"is_cart":false,"attributes":[],"quantity":1,"created_at":"2023-02-28 18:10:22","updated_at":"2023-02-28 18:13:21"}

class ShopDetailsModel {
  ShopDetailsModel({
      bool? success, 
      String? errorMsg, 
      ProductData? productData,
      List<String>? productImages,
  }){
    _success = success;
    _errorMsg = errorMsg;
    _productData = productData;
    _productImages = productImages;
   
    
}

  ShopDetailsModel.fromJson(dynamic json) {
    _success = json['success'];
    _errorMsg = json['errorMsg'];
    _productData = json['product_data'] != null ? ProductData.fromJson(json['product_data']) : null;
    _productImages= List<String>.from(json["product_images"].map((x) => x));

  }
  bool? _success;
  String? _errorMsg;
  ProductData? _productData;
  List<String>? _productImages;
  ShopDetailsModel copyWith({  bool? success,
  String? errorMsg,
  ProductData? productData,
  List<String>? productImages,

}) => ShopDetailsModel(  
  success: success ?? _success,
  errorMsg: errorMsg ?? _errorMsg,
  productData: productData ?? _productData,
  productImages:productImages ?? _productImages
);
  bool? get success => _success;
  String? get errorMsg => _errorMsg;
  ProductData? get productData => _productData;
  List<String>? get productImages => _productImages;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['errorMsg'] = _errorMsg;
    map['productImages'] = _productImages;
    if (_productData != null) {
      map['product_data'] = _productData?.toJson();
    }
    return map;
  }

}

/// id : 1
/// name : "Apple"
/// description : "The apple is one of the pome (fleshy) fruits. Apples at harvest vary widely in size, shape, colour, and acidity, but most are fairly round and some shade of red or yellow. The thousands of varieties fall into three broad classes: cider, cooking, and dessert varieties."
/// price : 140
/// sale_price : 100
/// unit : "kg"
/// stock : 0
/// category : 5
/// sub_category : 5
/// status : "Available"
/// featured : "false"
/// is_new : "1"
/// featured_image_name : "20230228061022_download (8).jpg"
/// wallet_amount : 0
/// discount : null
/// is_wishlist : false
/// is_cart : false
/// attributes : []
/// quantity : 1
/// created_at : "2023-02-28 18:10:22"
/// updated_at : "2023-02-28 18:13:21"

class ProductData {
  ProductData({
      int? id, 
      String? name, 
      String? description, 
      int? price, 
      int? salePrice, 
      String? unit, 
      num? stock, 
      num? category, 
      num? subCategory, 
      String? status, 
      String? featured, 
      String? isNew, 
      String? featuredImageName, 
      num? walletAmount, 
      dynamic discount, 
      bool? isWishlist, 
      bool? isCart, 
      List<Attributes>? attributes, 
      num? quantity, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _name = name;
    _description = description;
    _price = price;
    _salePrice = salePrice;
    _unit = unit;
    _stock = stock;
    _category = category;
    _subCategory = subCategory;
    _status = status;
    _featured = featured;
    _isNew = isNew;
    _featuredImageName = featuredImageName;
    _walletAmount = walletAmount;
    _discount = discount;
    _isWishlist = isWishlist;
    _isCart = isCart;
    _attributes = attributes;
    _quantity = quantity;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  int? _attributeCount;

  int get attributeCount => _attributeCount ?? 0;

  set attributeCount(int value) {
    _attributeCount = value;
  }

  ProductData.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _description = json['description'];
    _price = json['price'];
    _salePrice = json['sale_price'];
    _unit = json['unit'];
    _stock = json['stock'];
    _category = json['category'];
    _subCategory = json['sub_category'];
    _status = json['status'];
    _featured = json['featured'];
    _isNew = json['is_new'];
    _featuredImageName = json['featured_image_name'];
    _walletAmount = json['wallet_amount'];
    _discount = json['discount'];
    _isWishlist = json['is_wishlist'];
    _isCart = json['is_cart'];
    _attributes = json["attributes"] == null
        ? null
        : (json["attributes"] as List)
            .map((e) => Attributes.fromJson(e))
            .toList();
    _quantity = json['quantity'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  String? _name;
  String? _description;
  int? _price;
  int? _salePrice;
  String? _unit;
  num? _stock;
  num? _category;
  num? _subCategory;
  String? _status;
  String? _featured;
  String? _isNew;
  String? _featuredImageName;
  num? _walletAmount;
  dynamic _discount;
  bool? _isWishlist;
  bool? _isCart;
  List<Attributes>? _attributes;
  num? _quantity;
  String? _createdAt;
  String? _updatedAt;
ProductData copyWith({  int? id,
  String? name,
  String? description,
  int? price,
  int? salePrice,
  String? unit,
  num? stock,
  num? category,
  num? subCategory,
  String? status,
  String? featured,
  String? isNew,
  String? featuredImageName,
  num? walletAmount,
  dynamic discount,
  bool? isWishlist,
  bool? isCart,
  List<Attributes>? attributes,
  num? quantity,
  String? createdAt,
  String? updatedAt,
}) => ProductData(  id: id ?? _id,
  name: name ?? _name,
  description: description ?? _description,
  price: price ?? _price,
  salePrice: salePrice ?? _salePrice,
  unit: unit ?? _unit,
  stock: stock ?? _stock,
  category: category ?? _category,
  subCategory: subCategory ?? _subCategory,
  status: status ?? _status,
  featured: featured ?? _featured,
  isNew: isNew ?? _isNew,
  featuredImageName: featuredImageName ?? _featuredImageName,
  walletAmount: walletAmount ?? _walletAmount,
  discount: discount ?? _discount,
  isWishlist: isWishlist ?? _isWishlist,
  isCart: isCart ?? _isCart,
  attributes: attributes ?? _attributes,
  quantity: quantity ?? _quantity,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  int? get id => _id;
  String? get name => _name;
  String? get description => _description;
  int? get price => _price;
  int? get salePrice => _salePrice;
  String? get unit => _unit;
  num? get stock => _stock;
  num? get category => _category;
  num? get subCategory => _subCategory;
  String? get status => _status;
  String? get featured => _featured;
  String? get isNew => _isNew;
  String? get featuredImageName => _featuredImageName;
  num? get walletAmount => _walletAmount;
  dynamic get discount => _discount;
  bool? get isWishlist => _isWishlist;
  bool? get isCart => _isCart;
  List<Attributes>? get attributes => _attributes;
  num? get quantity => _quantity;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['description'] = _description;
    map['price'] = _price;
    map['sale_price'] = _salePrice;
    map['unit'] = _unit;
    map['stock'] = _stock;
    map['category'] = _category;
    map['sub_category'] = _subCategory;
    map['status'] = _status;
    map['featured'] = _featured;
    map['is_new'] = _isNew;
    map['featured_image_name'] = _featuredImageName;
    map['wallet_amount'] = _walletAmount;
    map['discount'] = _discount;
    map['is_wishlist'] = _isWishlist;
    map['is_cart'] = _isCart;
    if (_attributes != null) {
      map['attributes'] = _attributes?.map((v) => v.toJson()).toList();
    }
    
    map['quantity'] = _quantity;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}

class Attributes {
  int? id;
  String? name;
  int? value;

  Attributes({this.id,this.name, this.value});

  Attributes.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    value = json["value"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["value"] = value;
    return _data;
  }
}