class TrackOrderModel {
  String? message;
  Data? data;
  bool? isSuccess;
  bool? error;

  TrackOrderModel({this.message, this.data, this.isSuccess, this.error});

  TrackOrderModel.fromJson(Map<String, dynamic> json) {
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
  String? status;
  Null? locationCoordinates;
  Null? driver;

  Data({this.status, this.locationCoordinates, this.driver});

  Data.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    locationCoordinates = json['location_coordinates'];
    driver = json['driver'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['location_coordinates'] = this.locationCoordinates;
    data['driver'] = this.driver;
    return data;
  }
}