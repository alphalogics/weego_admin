import 'dart:convert';

/// oldPassword : "admin"
/// newPassword : "admin"

ChangePasswordRequest changePasswordRequestFromJson(String str) => ChangePasswordRequest.fromJson(json.decode(str));
String changePasswordRequestToJson(ChangePasswordRequest data) => json.encode(data.toJson());
class ChangePasswordRequest {
  ChangePasswordRequest({
      this.oldPassword, 
      this.newPassword,});

  ChangePasswordRequest.fromJson(dynamic json) {
    oldPassword = json['oldPassword'];
    newPassword = json['newPassword'];
  }
  String? oldPassword;
  String? newPassword;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['oldPassword'] = oldPassword;
    map['newPassword'] = newPassword;
    return map;
  }

}