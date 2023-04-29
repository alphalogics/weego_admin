import 'package:weego_admin/core/api/base_repository.dart';
import '../api/urls.dart';
import '../models/requests/change_password_request.dart';
import '../models/requests/login_request.dart';
import '../models/responses/change_password_response.dart';
import '../models/responses/login_response.dart';

abstract class AuthRepository {
  Future<LoginResponse> login(LoginRequest request);
  Future<ChangePasswordResponse> changePassword(ChangePasswordRequest request);
}

class AuthRepositoryImpl extends BaseRepository implements AuthRepository {
  @override
  Future<ChangePasswordResponse> changePassword(ChangePasswordRequest request) async {
    var response = await client.post(URLs.changePassword, body: request.toJson());
    return ChangePasswordResponse.fromJson(response);
  }

  @override
  Future<LoginResponse> login(LoginRequest request) async {
    var response = await client.post(URLs.login, body: request.toJson());
    return LoginResponse.fromJson(response);
  }

}