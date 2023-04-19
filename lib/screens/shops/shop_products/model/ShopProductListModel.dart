class ShopProductListModel {
  bool? success;
  String? errorMsg;
  List<Banners>? banners;
  List<Category>? categories;
  List<Products>? products;

  ShopProductListModel(
      {this.success,
      this.errorMsg,
      this.banners,
      this.categories,
      this.products});

  ShopProductListModel.fromJson(Map<String, dynamic> json) {
    success = json["success"];
    errorMsg = json["errorMsg"];
    banners = json["banners"] == null
        ? null
        : (json["banners"] as List).map((e) => Banners.fromJson(e)).toList();
        
    categories = json["categories"] == null
        ? null
        : (json["categories"] as List).map((e) => Category.fromJson(e)).toList();
    products = json["products"] == null
        ? null
        : (json["products"] as List).map((e) => Products.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["success"] = success;
    _data["errorMsg"] = errorMsg;
    if (banners != null) {
      _data["banners"] = banners?.map((e) => e.toJson()).toList();
    }
    if (categories != null) {
      _data["categories"] = categories;
    }
    if (products != null) {
      _data["products"] = products?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Products {
  int? id;
  String? name;
  String? description;
  int? price;
  int? salePrice;
  dynamic unit;
  int? stock;
  int? category;
  int? subCategory;
  String? status;
  String? featured;
  String? isNew;
  String? featuredImageName;
  dynamic walletAmount;
  dynamic discount;
  bool? isWishlist;
  bool? isCart;
  List<Attributes>? attributes;
  int? quantity;
  String? createdAt;
  String? updatedAt;

  Products(
      {this.id,
      this.name,
      this.description,
      this.price,
      this.salePrice,
      this.unit,
      this.stock,
      this.category,
      this.subCategory,
      this.status,
      this.featured,
      this.isNew,
      this.featuredImageName,
      this.walletAmount,
      this.discount,
      this.isWishlist,
      this.isCart,
      this.attributes,
      this.quantity,
      this.createdAt,
      this.updatedAt});

  int? _attributeCount;

  int get attributeCount => _attributeCount ?? 0;

  set attributeCount(int value) {
    _attributeCount = value;
  }

    int? _quantityCount;

  int get quantityCount => _quantityCount ?? 0;

  set quantityCount(int value) {
    _quantityCount = value;
  }

  String? _productPrice;

  bool? _isSelected;

  bool get isSelected => _isSelected ?? false;

  set isSelected(bool value) {
    _isSelected = value;
  }
  

  String get productPrice => _productPrice ?? "";

  set productPrice(String value) {
    _productPrice = value;
  }

  Products.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    description = json["description"];
    price = json["price"];
    salePrice = json["sale_price"];
    unit = json["unit"];
    stock = json["stock"];
    category = json["category"];
    subCategory = json["sub_category"];
    status = json["status"];
    featured = json["featured"];
    isNew = json["is_new"];
    featuredImageName = json["featured_image_name"];
    walletAmount = json["wallet_amount"];
    discount = json["discount"];
    isWishlist = json["is_wishlist"];
    isCart = json["is_cart"];
    attributes = json["attributes"] == null
        ? null
        : (json["attributes"] as List)
            .map((e) => Attributes.fromJson(e))
            .toList();
    quantity = json["quantity"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["description"] = description;
    _data["price"] = price;
    _data["sale_price"] = salePrice;
    _data["unit"] = unit;
    _data["stock"] = stock;
    _data["category"] = category;
    _data["sub_category"] = subCategory;
    _data["status"] = status;
    _data["featured"] = featured;
    _data["is_new"] = isNew;
    _data["featured_image_name"] = featuredImageName;
    _data["wallet_amount"] = walletAmount;
    _data["discount"] = discount;
    _data["is_wishlist"] = isWishlist;
    _data["is_cart"] = isCart;
    if (attributes != null) {
      _data["attributes"] = attributes?.map((e) => e.toJson()).toList();
    }
    _data["quantity"] = quantity;
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    return _data;
  }
}

class Attributes {
  int? id;
  dynamic name;
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

class Banners {
  int? id;
  int? shopId;
  String? image;

  Banners({this.id, this.shopId, this.image});

  Banners.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    shopId = json["shop_id"];
    image = json["image"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["shop_id"] = shopId;
    _data["image"] = image;
    return _data;
  }
}

class Category {
    Category({
        required this.id,
        required this.category,
        required this.imageName,
    });

    int id;
    String category;
    String imageName;

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        category: json["category"],
        imageName: json["image_name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "category": category,
        "image_name": imageName,
    };
}
