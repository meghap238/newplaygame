/*
class GetOtpModel {
  GetOtpModel({
    required this.status,
    required this.success,
    required this.data,
    required this.message,
  });
  late final int status;
  late final bool success;
  late final Data data;
  late final String message;

  GetOtpModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    success = json['success'];
    data = Data.fromJson(json['data']);
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['success'] = success;
    _data['data'] = data.toJson();
    _data['message'] = message;
    return _data;
  }
}

class Data {
  Data({
    required this.details,
  });
  late final Details details;

  Data.fromJson(Map<String, dynamic> json){
    details = Details.fromJson(json['details']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['details'] = details.toJson();
    return _data;
  }
}

class Details {
  Details({
    required this.mobile,
    required this.deviceId,
    required this.isBlock,
    required this.walletBalance,
    required this.changeDetails,
    required this.otp,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int mobile;
  late final String deviceId;
  late final bool isBlock;
  late final int walletBalance;
  late final List<dynamic> changeDetails;
  late final int otp;
  late final String id;
  late final String createdAt;
  late final String updatedAt;

  Details.fromJson(Map<String, dynamic> json){
    mobile = json['mobile'];
    deviceId = json['deviceId'];
    isBlock = json['isBlock'];
    walletBalance = json['wallet_balance'];
    changeDetails = List.castFrom<dynamic, dynamic>(json['changeDetails']);
    otp = json['otp'];
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['mobile'] = mobile;
    _data['deviceId'] = deviceId;
    _data['isBlock'] = isBlock;
    _data['wallet_balance'] = walletBalance;
    _data['changeDetails'] = changeDetails;
    _data['otp'] = otp;
    _data['id'] = id;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    return _data;
  }
}*/
class GetLoginModel {
  GetLoginModel({
    required this.status,
    required this.success,
    required this.data,
    required this.message,
  });
  late final int status;
  late final bool success;
  late final Data data;
  late final String message;

  GetLoginModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    success = json['success'];
    data = Data.fromJson(json['data']);
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['success'] = success;
    _data['data'] = data.toJson();
    _data['message'] = message;
    return _data;
  }
}

class Data {
  Data({
    required this.details,
  });
  late final Details details;

  Data.fromJson(Map<String, dynamic> json){
    details = Details.fromJson(json['details']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['details'] = details.toJson();
    return _data;
  }
}

class Details {
  Details({
    required this.mobile,
    required this.deviceId,
    required this.isBlock,
    required this.walletBalance,
    required this.changeDetails,
    required this.otp,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int mobile;
  late final String deviceId;
  late final bool isBlock;
  late final int walletBalance;
  late final List<dynamic> changeDetails;
  late final int otp;
  late final String id;
  late final String createdAt;
  late final String updatedAt;

  Details.fromJson(Map<String, dynamic> json){
    mobile = json['mobile'];
    deviceId = json['deviceId'];
    isBlock = json['isBlock'];
    walletBalance = json['wallet_balance'];
    changeDetails = List.castFrom<dynamic, dynamic>(json['changeDetails']);
    otp = json['otp'];
    id = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['mobile'] = mobile;
    _data['deviceId'] = deviceId;
    _data['isBlock'] = isBlock;
    _data['wallet_balance'] = walletBalance;
    _data['changeDetails'] = changeDetails;
    _data['otp'] = otp;
    _data['_id'] = id;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    return _data;
  }
}