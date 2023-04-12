import 'dart:convert';

/// result : [{"_id":"6425ba2a4a988d2608df9e18","video_link":"https://youtube.com","title":"Titile here2","description":"Description here2","createdAt":"2023-03-30T16:34:50.658Z","updatedAt":"2023-03-30T16:34:50.658Z","__v":0,"id":"6425ba2a4a988d2608df9e18"}]
/// message : "Videos Data!"
/// success : true

GetAllVideosResponse getAllVideosResponseFromJson(String str) => GetAllVideosResponse.fromJson(json.decode(str));
String getAllVideosResponseToJson(GetAllVideosResponse data) => json.encode(data.toJson());
class GetAllVideosResponse {
  GetAllVideosResponse({
      this.result, 
      this.message, 
      this.success,});

  GetAllVideosResponse.fromJson(dynamic json) {
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

/// _id : "6425ba2a4a988d2608df9e18"
/// video_link : "https://youtube.com"
/// title : "Titile here2"
/// description : "Description here2"
/// createdAt : "2023-03-30T16:34:50.658Z"
/// updatedAt : "2023-03-30T16:34:50.658Z"
/// __v : 0
/// id : "6425ba2a4a988d2608df9e18"

Result resultFromJson(String str) => Result.fromJson(json.decode(str));
String resultToJson(Result data) => json.encode(data.toJson());
class Result {
  Result({
    this.id,
    this.videoLink,
    this.title,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.videoId,});

  Result.fromJson(dynamic json) {
    id = json['_id'];
    videoLink = json['video_link'];
    title = json['title'];
    description = json['description'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    videoId = json['id'];
  }
  String? id;
  String? videoLink;
  String? title;
  String? description;
  String? createdAt;
  String? updatedAt;
  num? v;
  String? videoId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['video_link'] = videoLink;
    map['title'] = title;
    map['description'] = description;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    map['id'] = videoId;
    return map;
  }

}