import 'dart:convert';

/// privacy_policy : ""
/// contact_us : ""
/// facebook : ""
/// instagram : ""
/// youtube : ""

LinksRequest linksRequestFromJson(String str) => LinksRequest.fromJson(json.decode(str));
String linksRequestToJson(LinksRequest data) => json.encode(data.toJson());
class LinksRequest {
  LinksRequest({
    this.liveStream,
      this.privacyPolicy, 
      this.contactUs, 
      this.facebook, 
      this.instagram, 
      this.youtube,});

  LinksRequest.fromJson(dynamic json) {
    liveStream = json['live_stream'];
    privacyPolicy = json['privacy_policy'];
    contactUs = json['contact_us'];
    facebook = json['facebook'];
    instagram = json['instagram'];
    youtube = json['youtube'];
  }
  String? liveStream;
  String? privacyPolicy;
  String? contactUs;
  String? facebook;
  String? instagram;
  String? youtube;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['live_stream'] = liveStream;
    map['privacy_policy'] = privacyPolicy;
    map['contact_us'] = contactUs;
    map['facebook'] = facebook;
    map['instagram'] = instagram;
    map['youtube'] = youtube;
    return map;
  }

}