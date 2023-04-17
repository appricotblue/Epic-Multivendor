
class SettingsModel {
    bool? success;
    String? errorMsg;
    String? privacyPolicy;
    String? termsAndCondtions;
    String? refundAndCancellation;
    String? contactUs;
    String? aboutUs;
    String? razorpayKey;
    String? razorpaySecret;
    String? subscriptionAmount;

    SettingsModel({this.success, this.errorMsg, this.privacyPolicy, this.termsAndCondtions, this.refundAndCancellation, this.contactUs, this.aboutUs, this.razorpayKey, this.razorpaySecret, this.subscriptionAmount});

    SettingsModel.fromJson(Map<String, dynamic> json) {
        success = json["success"];
        errorMsg = json["errorMsg"];
        privacyPolicy = json["privacy_policy"];
        termsAndCondtions = json["terms_and_condtions"];
        refundAndCancellation = json["refund_and_cancellation"];
        contactUs = json["contact_us"];
        aboutUs = json["about_us"];
        razorpayKey = json["razorpay_key"];
        razorpaySecret = json["razorpay_secret"];
        subscriptionAmount = json["subscription_amount"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["success"] = success;
        _data["errorMsg"] = errorMsg;
        _data["privacy_policy"] = privacyPolicy;
        _data["terms_and_condtions"] = termsAndCondtions;
        _data["refund_and_cancellation"] = refundAndCancellation;
        _data["contact_us"] = contactUs;
        _data["about_us"] = aboutUs;
        _data["razorpay_key"] = razorpayKey;
        _data["razorpay_secret"] = razorpaySecret;
        _data["subscription_amount"] = subscriptionAmount;
        return _data;
    }
}