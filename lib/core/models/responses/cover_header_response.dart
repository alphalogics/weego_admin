import 'dart:convert';

/// result : {"_id":"6425b99b3b238b9899c74544","image":"ice cream ر10-03.jpg","title":"Title Here T1","description":"Description Here D1","createdAt":"2023-03-30T16:32:27.487Z","updatedAt":"2023-04-05T16:40:31.899Z","__v":0,"id":"6425b99b3b238b9899c74544"}
/// message : "Header Data!"
/// success : true

CoverHeaderResponse coverHeaderResponseFromJson(String str) => CoverHeaderResponse.fromJson(json.decode(str));
String coverHeaderResponseToJson(CoverHeaderResponse data) => json.encode(data.toJson());
class CoverHeaderResponse {
  CoverHeaderResponse({
      this.result, 
      this.message, 
      this.success,});

  CoverHeaderResponse.fromJson(dynamic json) {
    result = json['result'] != null ? Result.fromJson(json['result']) : null;
    message = json['message'];
    success = json['success'];
  }
  Result? result;
  String? message;
  bool? success;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (result != null) {
      map['result'] = result?.toJson();
    }
    map['message'] = message;
    map['success'] = success;
    return map;
  }

}

/// _id : "6425b99b3b238b9899c74544"
/// image : "ice cream ر10-03.jpg"
/// title : "Title Here T1"
/// description : "Description Here D1"
/// createdAt : "2023-03-30T16:32:27.487Z"
/// updatedAt : "2023-04-05T16:40:31.899Z"
/// __v : 0
/// id : "6425b99b3b238b9899c74544"

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
    this.coverId,});

  Result.fromJson(dynamic json) {
    id = json['_id'];
    image = json['image'];
    title = json['title'];
    description = json['description'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    coverId = json['id'];
  }
  String? id;
  String? image;
  String? title;
  String? description;
  String? createdAt;
  String? updatedAt;
  num? v;
  String? coverId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['image'] = image;
    map['title'] = title;
    map['description'] = description;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    map['id'] = coverId;
    return map;
  }

}