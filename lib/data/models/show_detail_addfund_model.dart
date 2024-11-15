class ShowDetailAddFundModel {
  int? status;
  bool? success;
  Data? data;
  String? message;

  ShowDetailAddFundModel({this.status, this.success, this.data, this.message});

  ShowDetailAddFundModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    success = json['success'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = this.status;
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  Details? details;

  Data({this.details});

  Data.fromJson(Map<String, dynamic> json) {
    details = json['details'] != null ? Details.fromJson(json['details']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (details != null) {
      data['details'] = details!.toJson();
    }
    return data;
  }
}

class Details {
  String? sId;
  int? mobile;
  String? deviceId;
  bool? isBlock;
  int? walletBalance;
  bool? isRegister;
  List<ChangeDetail>? changeDetails;
  int? otp;
  bool? isVerified;
  String? createdAt;
  String? updatedAt;
  String? mpin;
  String? city;
  String? language;
  String? name;
  String? state;
  String? walletBalUpdatedAt;
  String? username;
  Details(
      {this.sId,
        this.mobile,
        this.deviceId,
        this.isBlock,
        this.walletBalance,
        this.isRegister,
        this.changeDetails,
        this.otp,
        this.isVerified,
        this.createdAt,
        this.updatedAt,
        this.mpin,
        this.city,
        this.language,
        this.name,
        this.state,
        this.walletBalUpdatedAt,
      this.username});

  Details.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    mobile = json['mobile'];
    deviceId = json['deviceId'];
    isBlock = json['isBlock'];
    walletBalance = json['wallet_balance'];
    isRegister = json['isRegister'];
    if (json['changeDetails'] != null) {
      changeDetails = (json['changeDetails'] as List)
          .map((v) => ChangeDetail.fromJson(v))
          .toList();
    }
    otp = json['otp'];
    isVerified = json['isVerified'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    mpin = json['mpin'];
    city = json['city'];
    language = json['language'];
    name = json['name'];
    state = json['state'];
    walletBalUpdatedAt = json['wallet_bal_updated_at'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['mobile'] = mobile;
    data['deviceId'] = deviceId;
    data['isBlock'] = isBlock;
    data['wallet_balance'] = walletBalance;
    data['isRegister'] = isRegister;
    if (changeDetails != null) {
      data['changeDetails'] = changeDetails!.map((v) => v.toJson()).toList();
    }
    data['otp'] = otp;
    data['isVerified'] = isVerified;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['mpin'] = mpin;
    data['city'] = city;
    data['language'] = language;
    data['name'] = name;
    data['state'] = state;
    data['wallet_bal_updated_at'] = walletBalUpdatedAt;
    data['username'] = username;
    return data;
  }
}

class ChangeDetail {
  String? field;
  String? oldValue;
  String? newValue;

  ChangeDetail({this.field, this.oldValue, this.newValue});

  ChangeDetail.fromJson(Map<String, dynamic> json) {
    field = json['field'];
    oldValue = json['old_value'];
    newValue = json['new_value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['field'] = field;
    data['old_value'] = oldValue;
    data['new_value'] = newValue;
    return data;
  }
}
