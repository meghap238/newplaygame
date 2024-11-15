class CardListModel {
  int? status;
  bool? success;
  Data? data;
  String? message;

  CardListModel({this.status, this.success, this.data, this.message});

  CardListModel.fromJson(Map<String, dynamic> json) {
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
  List<CardList>? card;

  Data({this.card});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['card'] != null) {
      card = <CardList>[];
      json['card'].forEach((v) {
        card!.add(new CardList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.card != null) {
      data['card'] = this.card!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CardList {
  String? sId;
  String? cardName;
  String? cardImage;

  CardList({this.sId, this.cardName, this.cardImage});

  CardList.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    cardName = json['cardName'];
    cardImage = json['cardImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['cardName'] = this.cardName;
    data['cardImage'] = this.cardImage;
    return data;
  }
}

