import 'dart:convert';

/// video_link : ""
/// title : ""
/// description : ""

VideoRequest videoRequestFromJson(String str) => VideoRequest.fromJson(json.decode(str));
String videoRequestToJson(VideoRequest data) => json.encode(data.toJson());
class VideoRequest {
  VideoRequest({
      this.videoLink, 
      this.title, 
      this.description,});

  VideoRequest.fromJson(dynamic json) {
    videoLink = json['video_link'];
    title = json['title'];
    description = json['description'];
  }
  String? videoLink;
  String? title;
  String? description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['video_link'] = videoLink;
    map['title'] = title;
    map['description'] = description;
    return map;
  }

}