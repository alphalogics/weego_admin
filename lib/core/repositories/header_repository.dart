import 'package:weego_admin/core/api/urls.dart';
import 'package:dio/dio.dart' as dio;
import '../api/base_repository.dart';
import '../models/requests/cover_header_request.dart';
import '../models/responses/cover_header_response.dart';
import '../models/responses/save_cover_header_response.dart';

abstract class HeaderRepository {
  Future<CoverHeaderResponse> getCoverHeader();
  Future<SaveCoverHeaderResponse> updateCoverHeader(dio.FormData request);
}

class HeaderRepositoryImpl extends BaseRepository implements HeaderRepository {

  @override
  Future<CoverHeaderResponse> getCoverHeader() async {
    var response = await client.get(URLs.getHeader);
    return CoverHeaderResponse.fromJson(response);
  }

  @override
  Future<SaveCoverHeaderResponse> updateCoverHeader(dio.FormData request) async {
    var response = await client.multipartFormPut(URLs.updateHeader, body: request);
    return SaveCoverHeaderResponse.fromJson(response);
  }

}