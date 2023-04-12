import 'dart:convert';

/// user : {"_id":"64233ed0cf19c418a33468c0","firstName":"admin","lastName":"last admin","username":"admin","password":"","fullName":"admin last admin","createdAt":"2023-03-28T19:24:00.960Z","updatedAt":"2023-03-30T16:29:16.260Z","__v":0,"id":"64233ed0cf19c418a33468c0"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NDIzM2VkMGNmMTljNDE4YTMzNDY4YzAiLCJpYXQiOjE2ODA0NTcxNDEsImV4cCI6MTcxMjAxNDc0MX0.9nna27of4F2YtE1SgaNaHCcH8MlLbd8EeL_fI8xGaOE"
/// message : "SignIn successfully!"
/// success : true

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));
String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());
class LoginResponse {
  LoginResponse({
      this.user, 
      this.token, 
      this.message, 
      this.success,});

  LoginResponse.fromJson(dynamic json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
    message = json['message'];
    success = json['success'];
  }
  User? user;
  String? token;
  String? message;
  bool? success;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['token'] = token;
    map['message'] = message;
    map['success'] = success;
    return map;
  }

}

/// _id : "64233ed0cf19c418a33468c0"
/// firstName : "admin"
/// lastName : "last admin"
/// username : "admin"
/// password : ""
/// fullName : "admin last admin"
/// createdAt : "2023-03-28T19:24:00.960Z"
/// updatedAt : "2023-03-30T16:29:16.260Z"
/// __v : 0
/// id : "64233ed0cf19c418a33468c0"

User userFromJson(String str) => User.fromJson(json.decode(str));
String userToJson(User data) => json.encode(data.toJson());
class User {
  User({
    this.id,
    this.firstName,
    this.lastName,
    this.username,
    this.password,
    this.fullName,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.userId,});

  User.fromJson(dynamic json) {
    id = json['_id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    username = json['username'];
    password = json['password'];
    fullName = json['fullName'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    userId = json['id'];
  }
  String? id;
  String? firstName;
  String? lastName;
  String? username;
  String? password;
  String? fullName;
  String? createdAt;
  String? updatedAt;
  num? v;
  String? userId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['username'] = username;
    map['password'] = password;
    map['fullName'] = fullName;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    map['id'] = userId;
    return map;
  }

}