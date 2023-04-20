/// success : true
/// errorMsg : ""
/// cart_data : [{"id":3,"product_id":1,"product_title":"product","quantity":1,"product_amount":100,"product_image":"http://phpstack-732301-3097288.cloudwaysapps.com/image_uploads/20221209074125_Epic_icon.png","total_amount":100,"attribute":"test"}]

class CartListModel {
  CartListModel({
      bool? success, 
      String? errorMsg, 
      int? gst,
      List<CartData>? cartData,}){
    _success = success;
    _errorMsg = errorMsg;
    _gst = gst;
    _cartData = cartData;
}

  CartListModel.fromJson(dynamic json) {
    _success = json['success'];
    _errorMsg = json['errorMsg'];
    _gst      = json['gst'];
    if (json['cart_data'] != null) {
      _cartData = [];
      json['cart_data'].forEach((v) {
        _cartData?.add(CartData.fromJson(v));
      });
    }
  }
  bool? _success;
  String? _errorMsg;
  int? _gst;
  List<CartData>? _cartData;
  CartListModel copyWith({  bool? success,
    String? errorMsg,
    int? gst,
    List<CartData>? cartData,
  }) => CartListModel(  success: success ?? _success,
    errorMsg: errorMsg ?? _errorMsg,
    gst: gst ?? _gst,
    cartData: cartData ?? _cartData,
  );
  bool? get success => _success;
  String? get errorMsg => _errorMsg;
  int? get gst => _gst;
  List<CartData>? get cartData => _cartData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['errorMsg'] = _errorMsg;
    map['gst'] = _gst;
    if (_cartData != null) {
      map['cart_data'] = _cartData?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 3
/// product_id : 1
/// product_title : "product"
/// quantity : 1
/// product_amount : 100
/// product_image : "http://phpstack-732301-3097288.cloudwaysapps.com/image_uploads/20221209074125_Epic_icon.png"
/// total_amount : 100
/// attribute : "test"

class CartData {
  CartData({
      num? id, 
      num? productId, 
      String? productTitle, 
      num? quantity, 
      num? productAmount, 
      String? productImage, 
      num? totalAmount, 
      String? attribute,}){
    _id = id;
    _productId = productId;
    _productTitle = productTitle;
    _quantity = quantity;
    _productAmount = productAmount;
    _productImage = productImage;
    _totalAmount = totalAmount;
    _attribute = attribute;
}

  CartData.fromJson(dynamic json) {
    _id = json['id'];
    _productId = json['product_id'];
    _productTitle = json['product_title'];
    _quantity = json['quantity'];
    _productAmount = json['product_amount'];
    _productImage = json['product_image'];
    _totalAmount = json['total_amount'];
    _attribute = json['attribute'];
  }
  num? _id;
  num? _productId;
  String? _productTitle;
  num? _quantity;
  num? _productAmount;
  String? _productImage;
  num? _totalAmount;
  String? _attribute;
CartData copyWith({  num? id,
  num? productId,
  String? productTitle,
  num? quantity,
  num? productAmount,
  String? productImage,
  num? totalAmount,
  String? attribute,
}) => CartData(  id: id ?? _id,
  productId: productId ?? _productId,
  productTitle: productTitle ?? _productTitle,
  quantity: quantity ?? _quantity,
  productAmount: productAmount ?? _productAmount,
  productImage: productImage ?? _productImage,
  totalAmount: totalAmount ?? _totalAmount,
  attribute: attribute ?? _attribute,
);
  num? get id => _id;
  num? get productId => _productId;
  String? get productTitle => _productTitle;
  num? get quantity => _quantity;
  num? get productAmount => _productAmount;
  String? get productImage => _productImage;
  num? get totalAmount => _totalAmount;
  String? get attribute => _attribute;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['product_id'] = _productId;
    map['product_title'] = _productTitle;
    map['quantity'] = _quantity;
    map['product_amount'] = _productAmount;
    map['product_image'] = _productImage;
    map['total_amount'] = _totalAmount;
    map['attribute'] = _attribute;
    return map;
  }

}