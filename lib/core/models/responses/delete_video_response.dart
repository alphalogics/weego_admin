import 'dart:convert';

/// message : "Video Deleted!"
/// success : true

DeleteVideoResponse deleteVideoResponseFromJson(String str) => DeleteVideoResponse.fromJson(json.decode(str));
String deleteVideoResponseToJson(DeleteVideoResponse data) => json.encode(data.toJson());
class DeleteVideoResponse {
  DeleteVideoResponse({
      this.message, 
      this.success,});

  DeleteVideoResponse.fromJson(dynamic json) {
    message = json['message'];
    success = json['success'];
  }
  String? message;
  bool? success;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['success'] = success;
    return map;
  }

}