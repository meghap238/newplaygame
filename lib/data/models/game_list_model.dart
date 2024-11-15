class HomeGameModel {
  int? status;
  bool? success;
  List<Data>? data;
  String? message;

  HomeGameModel({this.status, this.success, this.data, this.message});

  HomeGameModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  String? providerName;
  String? providerResult;
  int? resultStatus;
  bool? isClosed;
  String? displayText;
  String? colorCode;
  String? providerId;
  String? openBidTime;
  String? closeBidTime;

  Data(
      {this.providerName,
        this.providerResult,
        this.resultStatus,
        this.isClosed,
        this.displayText,
        this.colorCode,
        this.providerId,
        this.openBidTime,
        this.closeBidTime});

  Data.fromJson(Map<String, dynamic> json) {
    providerName = json['providerName'];
    providerResult = json['providerResult'];
    resultStatus = json['resultStatus'];
    isClosed = json['isClosed'];
    displayText = json['displayText'];
    colorCode = json['colorCode'];
    providerId = json['providerId'];
    openBidTime = json['OpenBidTime'];
    closeBidTime = json['CloseBidTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['providerName'] = this.providerName;
    data['providerResult'] = this.providerResult;
    data['resultStatus'] = this.resultStatus;
    data['isClosed'] = this.isClosed;
    data['displayText'] = this.displayText;
    data['colorCode'] = this.colorCode;
    data['providerId'] = this.providerId;
    data['OpenBidTime'] = this.openBidTime;
    data['CloseBidTime'] = this.closeBidTime;
    return data;
  }
}