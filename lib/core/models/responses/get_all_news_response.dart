import 'dart:convert';

/// result : [{"_id":"6425c2bff4bfe4d7fdb7dcfe","image":"icecream-booking-01.png","title":"Title new","description":"Description new","createdAt":"2023-03-30T17:11:27.008Z","updatedAt":"2023-03-30T17:11:27.008Z","__v":0,"id":"6425c2bff4bfe4d7fdb7dcfe"}]
/// message : "News Data!"
/// success : true

GetAllNewsResponse getAllNewsResponseFromJson(String str) => GetAllNewsResponse.fromJson(json.decode(str));
String getAllNewsResponseToJson(GetAllNewsResponse data) => json.encode(data.toJson());
class GetAllNewsResponse {
  GetAllNewsResponse({
      this.result, 
      this.message, 
      this.success,});

  GetAllNewsResponse.fromJson(dynamic json) {
    if (json['result'] != null) {
      result = [];
      json['result'].forEach((v) {
        result?.add(Result.fromJson(v));
      });
    }
    message = json['message'];
    success = json['success'];
  }
  List<Result>? result;
  String? message;
  bool? success;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (result != null) {
      map['result'] = result?.map((v) => v.toJson()).toList();
    }
    map['message'] = message;
    map['success'] = success;
    return map;
  }

}

/// _id : "6425c2bff4bfe4d7fdb7dcfe"
/// image : "icecream-booking-01.png"
/// title : "Title new"
/// description : "Description new"
/// createdAt : "2023-03-30T17:11:27.008Z"
/// updatedAt : "2023-03-30T17:11:27.008Z"
/// __v : 0
/// id : "6425c2bff4bfe4d7fdb7dcfe"

Result resultFromJson(String str) => Result.fromJson(json.decode(str));
String resultToJson(Result data) => json.encode(data.toJson());
class Result {
  Result({
    this.id,
    this.image,
    this.title,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.newsId,});

  Result.fromJson(dynamic json) {
    id = json['_id'];
    image = json['image'];
    title = json['title'];
    description = json['description'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    newsId = json['id'];
  }
  String? id;
  String? image;
  String? title;
  String? description;
  String? createdAt;
  String? updatedAt;
  num? v;
  String? newsId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['image'] = image;
    map['title'] = title;
    map['description'] = description;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    map['id'] = newsId;
    return map;
  }

}