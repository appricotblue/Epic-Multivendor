
class MyOrderDetailsModel {
    bool? success;
    int? errorMsg;
    Orders? orders;
    List<Products>? products;

    MyOrderDetailsModel({this.success, this.errorMsg, this.orders, this.products});

    MyOrderDetailsModel.fromJson(Map<String, dynamic> json) {
        success = json["success"];
        errorMsg = json["errorMsg"];
        orders = json["orders"] == null ? null : Orders.fromJson(json["orders"]);
        products = json["products"] == null ? null : (json["products"] as List).map((e) => Products.fromJson(e)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["success"] = success;
        _data["errorMsg"] = errorMsg;
        if(orders != null) {
            _data["orders"] = orders?.toJson();
        }
        if(products != null) {
            _data["products"] = products?.map((e) => e.toJson()).toList();
        }
        return _data;
    }
}

class Products {
    int? productId;
    String? title;
    int? price;
    String? featuredImageUrl;
    String? isFeatured;
    String? status;
    int? quantity;

    Products({this.productId, this.title, this.price, this.featuredImageUrl, this.isFeatured, this.status, this.quantity});

    Products.fromJson(Map<String, dynamic> json) {
        productId = json["product_id"];
        title = json["title"];
        price = json["price"];
        featuredImageUrl = json["featured_image_url"];
        isFeatured = json["is_featured"];
        status = json["status"];
        quantity = json["quantity"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["product_id"] = productId;
        _data["title"] = title;
        _data["price"] = price;
        _data["featured_image_url"] = featuredImageUrl;
        _data["is_featured"] = isFeatured;
        _data["status"] = status;
        _data["quantity"] = quantity;
        return _data;
    }
}

class Orders {
    int? id;
    String? orderId;
    int? userId;
    int? vendorId;
    String? userName;
    String? userPhone;
    String? userEmail;
    String? orderAmount;
    String? paymentStatus;
    String? orderStatusId;
    String? orderStatus;
    String? orderType;
    dynamic timeSlot;
    dynamic deliveryDate;
    int? deliveryAddressId;
    dynamic deliveryAddress;
    String? paymentMethod;
    int? deliveryBoyId;
    String? deliveryPin;
    String? orderKey;
    String? createdAt;
    String? updatedAt;

    Orders({
      this.id, 
      this.orderId, 
      this.userId, 
      this.vendorId, 
      this.userName, 
      this.userPhone, 
      this.userEmail, 
      this.orderAmount, 
      this.paymentStatus, 
      this.orderStatusId, 
      this.orderStatus, 
      this.orderType, 
      this.timeSlot, 
      this.deliveryDate, 
      this.deliveryAddressId, 
      this.deliveryAddress, 
      this.paymentMethod, 
      this.deliveryBoyId, 
      this.deliveryPin, 
      this.orderKey,
      this.createdAt, 
      this.updatedAt
    });

    Orders.fromJson(Map<String, dynamic> json) {
        id = json["id"];
        orderId = json["order_id"];
        userId = json["user_id"];
        vendorId = json["vendor_id"];
        userName = json["user_name"];
        userPhone = json["user_phone"];
        userEmail = json["user_email"];
        orderAmount = json["order_amount"];
        paymentStatus = json["payment_status"];
        orderStatusId = json["order_status_id"];
        orderStatus = json["order_status"];
        orderType = json["order_type"];
        timeSlot = json["time_slot"];
        deliveryDate = json["delivery_date"];
        deliveryAddressId = json["delivery_address_id"];
        deliveryAddress = json["delivery_address"];
        paymentMethod = json["payment_method"];
        deliveryBoyId = json["delivery_boy_id"];
        deliveryPin = json["delivery_pin"];
        orderKey    = json["order_key"];
        createdAt = json["created_at"];
        updatedAt = json["updated_at"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["id"] = id;
        _data["order_id"] = orderId;
        _data["user_id"] = userId;
        _data["vendor_id"] = vendorId;
        _data["user_name"] = userName;
        _data["user_phone"] = userPhone;
        _data["user_email"] = userEmail;
        _data["order_amount"] = orderAmount;
        _data["payment_status"] = paymentStatus;
        _data["order_status_id"] = orderStatusId;
        _data["order_status"] = orderStatus;
        _data["order_type"] = orderType;
        _data["time_slot"] = timeSlot;
        _data["delivery_date"] = deliveryDate;
        _data["delivery_address_id"] = deliveryAddressId;
        _data["delivery_address"] = deliveryAddress;
        _data["payment_method"] = paymentMethod;
        _data["delivery_boy_id"] = deliveryBoyId;
        _data["delivery_pin"] = deliveryPin;
        _data["order_key"] = orderKey;
        _data["created_at"] = createdAt;
        _data["updated_at"] = updatedAt;
        return _data;
    }
}