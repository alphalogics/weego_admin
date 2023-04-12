import '../api/base_repository.dart';
import '../api/urls.dart';
import '../models/requests/video_request.dart';
import '../models/responses/delete_video_response.dart';
import '../models/responses/get_all_videos_response.dart';
import '../models/responses/get_single_video_response.dart';
import '../models/responses/save_video_response.dart';

abstract class VideosRepository {
  Future<SaveVideoResponse> saveVideo(VideoRequest request);
  Future<GetAllVideosResponse> getAllVideos();
  Future<GetSingleVideoResponse> getVideo(String videoId);
  Future<DeleteVideoResponse> deleteVideo(String videoId);
  Future<SaveVideoResponse> updateVideo(String videoId, VideoRequest request);
}

class VideosRepositoryImpl extends BaseRepository implements VideosRepository {
  @override
  Future<SaveVideoResponse> saveVideo(VideoRequest request) async {
    var response = await client.post(URLs.saveVideos, body: request);
    return SaveVideoResponse.fromJson(response);
  }

  @override
  Future<GetAllVideosResponse> getAllVideos() async {
    var response = await client.get(URLs.getVideos);
    return GetAllVideosResponse.fromJson(response);
  }

  @override
  Future<DeleteVideoResponse> deleteVideo(String videoId) async {
    var response = await client.delete(URLs.deleteVideos(videoId));
    return DeleteVideoResponse.fromJson(response);
  }

  @override
  Future<SaveVideoResponse> updateVideo(String videoId, VideoRequest request) async {
    var response = await client.put(URLs.updateVideos(videoId), body: request);
    return SaveVideoResponse.fromJson(response);
  }

  @override
  Future<GetSingleVideoResponse> getVideo(String videoId) async {
    var response = await client.get(URLs.getSingleVideos(videoId));
    return GetSingleVideoResponse.fromJson(response);
  }

}