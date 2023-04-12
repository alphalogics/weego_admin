import 'dart:convert';

/// message : "News saved successfully!"
/// success : true

GeneralNewsResponse generalNewsResponseFromJson(String str) => GeneralNewsResponse.fromJson(json.decode(str));
String generalNewsResponseToJson(GeneralNewsResponse data) => json.encode(data.toJson());
class GeneralNewsResponse {
  GeneralNewsResponse({
      this.message, 
      this.success,});

  GeneralNewsResponse.fromJson(dynamic json) {
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