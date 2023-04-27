class SearchProductModel {
  bool? success;
  String? errorMsg;
  List<Products>? products;

  SearchProductModel({this.success, this.errorMsg, this.products});

  SearchProductModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    errorMsg = json['errorMsg'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['errorMsg'] = this.errorMsg;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
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
    status = json['status'];
    featured = json['featured'];
    isNew = json['is_new'];
    featuredImageName = json['featured_image_name'];
    walletAmount = json['wallet_amount'];
    discount = json['discount'];
    isWishlist = json['is_wishlist'];
    isCart = json['is_cart'];
    if (json['attributes'] != null) {
      attributes = <Attributes>[];
      json['attributes'].forEach((v) {
        attributes!.add(new Attributes.fromJson(v));
      });
    }
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
    data['status'] = this.status;
    data['featured'] = this.featured;
    data['is_new'] = this.isNew;
    data['featured_image_name'] = this.featuredImageName;
    data['wallet_amount'] = this.walletAmount;
    data['discount'] = this.discount;
    data['is_wishlist'] = this.isWishlist;
    data['is_cart'] = this.isCart;
    if (this.attributes != null) {
      data['attributes'] = this.attributes!.map((v) => v.toJson()).toList();
    }
    data['quantity'] = this.quantity;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Attributes {
  int? id;
  String? name;
  int? value;

  Attributes({this.id, this.name, this.value});

  Attributes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['value'] = this.value;
    return data;
  }
}