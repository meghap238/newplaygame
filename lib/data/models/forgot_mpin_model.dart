class forgotMpinModel {
  int? status;
  bool? success;
  String? message;

  forgotMpinModel({this.status, this.success, this.message});

  forgotMpinModel.fromJson(Map<String, dynamic> json) {
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