import 'dart:convert';

/// message : "Your password updated successfully!"
/// success : true

ChangePasswordResponse changePasswordResponseFromJson(String str) => ChangePasswordResponse.fromJson(json.decode(str));
String changePasswordResponseToJson(ChangePasswordResponse data) => json.encode(data.toJson());
class ChangePasswordResponse {
  ChangePasswordResponse({
      this.message, 
      this.success,});

  ChangePasswordResponse.fromJson(dynamic json) {
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