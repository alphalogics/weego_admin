import '../api/base_repository.dart';
import '../api/urls.dart';
import 'package:dio/dio.dart' as dio;
import '../models/requests/news_request.dart';
import '../models/responses/general_news_response.dart';
import '../models/responses/get_all_news_response.dart';
import '../models/responses/get_single_news_response.dart';

abstract class NewsRepository {
  Future<GeneralNewsResponse> addNews(dio.FormData request);
  Future<GetAllNewsResponse> getAllNews();
  Future<GetSingleNewsResponse> getSingleNews(String newsId);
  Future<GeneralNewsResponse> updateNews(String newsId, dio.FormData request);
  Future<GeneralNewsResponse> deleteNews(String newsId);
}

class NewsRepositoryImpl extends BaseRepository implements NewsRepository {
  @override
  Future<GeneralNewsResponse> addNews(dio.FormData request) async {
    var response = await client.multipartFormPost(URLs.saveNews, body: request);
    return GeneralNewsResponse.fromJson(response);
  }

  @override
  Future<GeneralNewsResponse> deleteNews(String newsId) async {
    var response = await client.delete(URLs.deleteNews(newsId));
    return GeneralNewsResponse.fromJson(response);
  }

  @override
  Future<GetAllNewsResponse> getAllNews() async {
    var response = await client.get(URLs.getNews);
    return GetAllNewsResponse.fromJson(response);
  }

  @override
  Future<GetSingleNewsResponse> getSingleNews(String newsId) async {
    var response = await client.get(URLs.getSingleNews(newsId));
    return GetSingleNewsResponse.fromJson(response);
  }

  @override
  Future<GeneralNewsResponse> updateNews(String newsId, dio.FormData request) async {
    var response = await client.multipartFormPut(URLs.updateNews(newsId), body: request);
    return GeneralNewsResponse.fromJson(response);
  }

}