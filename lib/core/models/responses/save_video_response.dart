import 'dart:convert';

/// message : "Video saved successfully!"
/// success : true

SaveVideoResponse saveVideoResponseFromJson(String str) => SaveVideoResponse.fromJson(json.decode(str));
String saveVideoResponseToJson(SaveVideoResponse data) => json.encode(data.toJson());
class SaveVideoResponse {
  SaveVideoResponse({
      this.message, 
      this.success,});

  SaveVideoResponse.fromJson(dynamic json) {
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