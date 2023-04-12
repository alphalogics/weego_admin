import 'dart:convert';

/// result : {"_id":"6425b9423b238b9899c7453b","live_stream":"https:://11","privacy_policy":"https:://22","contact_us":"https:://33","facebook":"https:://44","instagram":"https:://55","youtube":"https:://66","createdAt":"2023-03-30T16:30:58.426Z","updatedAt":"2023-04-03T19:33:57.886Z","__v":0,"id":"6425b9423b238b9899c7453b"}
/// message : "Links Data!"
/// success : true

LinksResponse linksResponseFromJson(String str) => LinksResponse.fromJson(json.decode(str));
String linksResponseToJson(LinksResponse data) => json.encode(data.toJson());
class LinksResponse {
  LinksResponse({
      this.result, 
      this.message, 
      this.success,});

  LinksResponse.fromJson(dynamic json) {
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

/// _id : "6425b9423b238b9899c7453b"
/// live_stream : "https:://11"
/// privacy_policy : "https:://22"
/// contact_us : "https:://33"
/// facebook : "https:://44"
/// instagram : "https:://55"
/// youtube : "https:://66"
/// createdAt : "2023-03-30T16:30:58.426Z"
/// updatedAt : "2023-04-03T19:33:57.886Z"
/// __v : 0
/// id : "6425b9423b238b9899c7453b"

Result resultFromJson(String str) => Result.fromJson(json.decode(str));
String resultToJson(Result data) => json.encode(data.toJson());
class Result {
  Result({
    this.id,
    this.liveStream,
    this.privacyPolicy,
    this.contactUs,
    this.facebook,
    this.instagram,
    this.youtube,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.linkId,});

  Result.fromJson(dynamic json) {
    id = json['_id'];
    liveStream = json['live_stream'];
    privacyPolicy = json['privacy_policy'];
    contactUs = json['contact_us'];
    facebook = json['facebook'];
    instagram = json['instagram'];
    youtube = json['youtube'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    linkId = json['id'];
  }
  String? id;
  String? liveStream;
  String? privacyPolicy;
  String? contactUs;
  String? facebook;
  String? instagram;
  String? youtube;
  String? createdAt;
  String? updatedAt;
  num? v;
  String? linkId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['live_stream'] = liveStream;
    map['privacy_policy'] = privacyPolicy;
    map['contact_us'] = contactUs;
    map['facebook'] = facebook;
    map['instagram'] = instagram;
    map['youtube'] = youtube;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    map['id'] = linkId;
    return map;
  }

}