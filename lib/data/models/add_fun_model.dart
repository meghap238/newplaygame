class AddFundModel {
  int? status;
  bool? success;
  Data? data;
  String? message;

  AddFundModel({this.status, this.success, this.data, this.message});

  AddFundModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
    details =
    json['details'] != null ? new Details.fromJson(json['details']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.details != null) {
      data['details'] = this.details!.toJson();
    }
    return data;
  }
}

class Details {
  String? userId;
  int? amount;
  String? reqType;
  String? reqStatus;
  String? sId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Details(
      {this.userId,
        this.amount,
        this.reqType,
        this.reqStatus,
        this.sId,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Details.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    amount = json['amount'];
    reqType = json['reqType'];
    reqStatus = json['reqStatus'];
    sId = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['amount'] = this.amount;
    data['reqType'] = this.reqType;
    data['reqStatus'] = this.reqStatus;
    data['_id'] = this.sId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}