import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

/// image : ""
/// title : ""
/// description : ""

CoverHeaderRequest coverHeaderRequestFromJson(String str) => CoverHeaderRequest.fromJson(json.decode(str));
String coverHeaderRequestToJson(CoverHeaderRequest data) => json.encode(data.toJson());
class CoverHeaderRequest {
  CoverHeaderRequest({
      this.image, 
      this.title, 
      this.description,});

  CoverHeaderRequest.fromJson(dynamic json) {
    image = json['image'];
    title = json['title'];
    description = json['description'];
  }
  MultipartFile? image;
  String? title;
  String? description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['image'] = image;
    map['title'] = title;
    map['description'] = description;
    return map;
  }

}