class ShopProductList {
  bool? success;
  String? errorMsg;
  List<Products>? products;
  Pagination? pagination;

  ShopProductList(
      {this.success, this.errorMsg, this.products, this.pagination});

  ShopProductList.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    errorMsg = json['errorMsg'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
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
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    if (this.pagination != null) {
      data['pagination'] = this.pagination!.toJson();
    }
    return data;
  }
}

class Products {
  int? id;
  String? name;
  String? description;
  int? price;
  int? salePrice;
  String? unit;
  int? stock;
  int? category;
  int? subCategory;
  String? categoryType;
  String? status;
  String? featured;
  String? isNew;
  String? featuredImageName;
  int? walletAmount;
  Null? discount;
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
      this.categoryType,
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


      int? _quantityCount;

  int get quantityCount => _quantityCount ?? 0;

  set quantityCount(int value) {
    _quantityCount = value;
  }
  String? _productPrice;
   String get productPrice => _productPrice ?? "";

  set productPrice(String value) {
    _productPrice = value;
  }

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    salePrice = json['sale_price'];
    unit = json['unit'];
    stock = json['stock'];
    category = json['category'];
    subCategory = json['sub_category'];
    categoryType = json['category_type'];
    status = json['status'];
    featured = json['featured'];
    isNew = json['is_new'];
    featuredImageName = json['featured_image_name'];
    walletAmount = json['wallet_amount'];
    discount = json['discount'];
    isWishlist = json['is_wishlist'];
    isCart = json['is_cart'];
    attributes = json["attributes"] == null
        ? null
        : (json["attributes"] as List)
            .map((e) => Attributes.fromJson(e))
            .toList();
    quantity = json['quantity'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['price'] = this.price;
    data['sale_price'] = this.salePrice;
    data['unit'] = this.unit;
    data['stock'] = this.stock;
    data['category'] = this.category;
    data['sub_category'] = this.subCategory;
    data['category_type'] = this.categoryType;
    data['status'] = this.status;
    data['featured'] = this.featured;
    data['is_new'] = this.isNew;
    data['featured_image_name'] = this.featuredImageName;
    data['wallet_amount'] = this.walletAmount;
    data['discount'] = this.discount;
    data['is_wishlist'] = this.isWishlist;
    data['is_cart'] = this.isCart;
    if (attributes != null) {
      data["attributes"] = attributes?.map((e) => e.toJson()).toList();
    }
    data['quantity'] = this.quantity;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
class Attributes {
  int? id;
  dynamic name;
  int? value;

  Attributes({this.id, this.name, this.value});

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
