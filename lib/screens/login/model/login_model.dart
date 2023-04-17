class LoginModel {
  LoginModel(
      {this.success,
        this.msg,
        this.userId,
        this.isPremium,
        this.otp,
        this.phone});

  LoginModel.fromJson(dynamic json) {
    success = json['success'];
    msg = json['msg'];
    userId = json['user_id'];
    isPremium = json['is_premium'];
    otp = json['otp '];
    phone = json['phone'];
  }
  bool? success;
  String? msg;
  String? userId;
  String? isPremium;
  int? otp;
  String? phone;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['msg'] = msg;
    map['user_id'] = userId;
    map['is_premium'] = isPremium;
    map['otp '] = otp;
    map['phone '] = phone;
    return map;
  }
}

