class DeliveryCalculationModel {
  String? message;
  Data? data;
  bool? isSuccess;
  bool? error;

  DeliveryCalculationModel(
      {this.message, this.data, this.isSuccess, this.error});

  DeliveryCalculationModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    isSuccess = json['is_success'];
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['is_success'] = this.isSuccess;
    data['error'] = this.error;
    return data;
  }
}

class Data {
  double? deliveryAmount;
  String? distance;
  String? estimatedTime;

  Data({this.deliveryAmount, this.distance, this.estimatedTime});

  Data.fromJson(Map<String, dynamic> json) {
    deliveryAmount = json['delivery_amount'];
    distance = json['distance'];
    estimatedTime = json['estimated_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['delivery_amount'] = this.deliveryAmount;
    data['distance'] = this.distance;
    data['estimated_time'] = this.estimatedTime;
    return data;
  }
}