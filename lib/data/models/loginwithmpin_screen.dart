// class LoginWithMpinModel {
//   int? status;
//   bool? success;
//   Data? data;
//   String? message;
//
//   LoginWithMpinModel({this.status, this.success, this.data, this.message});
//
//   LoginWithMpinModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     success = json['success'];
//     data = json['data'] != null ? new Data.fromJson(json['data']) : null;
//     message = json['message'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     data['success'] = this.success;
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     data['message'] = this.message;
//     return data;
//   }
// }
//
// class Data {
//   String? token;
//
//   Data({this.token});
//
//   Data.fromJson(Map<String, dynamic> json) {
//     token = json['token'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['token'] = this.token;
//     return data;
//   }
// }


class LoginWithMpinModel {
  int? status;
  bool? success;
  Data? data;
  String? message;

  LoginWithMpinModel({this.status, this.success, this.data, this.message});

  LoginWithMpinModel.fromJson(Map<String, dynamic> json) {
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
  String? token;
  String? id;

  Data({this.token, this.id});

  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['id'] = this.id;
    return data;
  }
}