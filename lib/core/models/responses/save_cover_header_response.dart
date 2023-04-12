import 'dart:convert';

/// message : "Data saved successfully!"
/// img : "icecream-booking-bg-hd-02.png"
/// success : true

SaveCoverHeaderResponse saveCoverHeaderResponseFromJson(String str) => SaveCoverHeaderResponse.fromJson(json.decode(str));
String saveCoverHeaderResponseToJson(SaveCoverHeaderResponse data) => json.encode(data.toJson());
class SaveCoverHeaderResponse {
  SaveCoverHeaderResponse({
      this.message, 
      this.img, 
      this.success,});

  SaveCoverHeaderResponse.fromJson(dynamic json) {
    message = json['message'];
    img = json['img'];
    success = json['success'];
  }
  String? message;
  String? img;
  bool? success;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['img'] = img;
    map['success'] = success;
    return map;
  }

}