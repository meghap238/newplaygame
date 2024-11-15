class VerifiedOtpModel {
  int? status;
  bool? success;
  String? message;

  VerifiedOtpModel({this.status, this.success, this.message});

  VerifiedOtpModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['success'] = this.success;
    data['message'] = this.message;
    return data;
  }
}