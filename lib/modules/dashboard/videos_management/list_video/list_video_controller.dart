import 'package:get/get.dart';
import 'package:weego_admin/core/models/responses/get_all_videos_response.dart';
import 'package:weego_admin/core/repositories/videos_repository.dart';
import '../../../../../../core/widgets/base/base_controller.dart';
import '../../../../core/api/base_state.dart';
import '../../../../core/models/responses/delete_video_response.dart';
import '../../../../core/routings/app_route.dart';
import '../../../../core/services/navigation_service.dart';
import '../../../../core/shared_preference/app_shared_preference.dart';
import '../../../../core/utils/message_dialog.dart';
import '../../../../core/utils/request_utils.dart';

class ListVideoController extends BaseController {

  final VideosRepository _videosRepository;
  final NavigationServices _navigationServices;
  ListVideoController(this._videosRepository, this._navigationServices);

  var getAllVideosState = BaseState<GetAllVideosResponse>();
  var deleteVideosState = BaseState<DeleteVideoResponse>();

  Rx<GetAllVideosResponse> allVideos =
      Rx<GetAllVideosResponse>(GetAllVideosResponse());

  String text = "test";

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    initEventListeners();
    getAllVideos();
    super.onReady();
  }

  void initEventListeners() {
    _navigationServices.selectedVideoKey.listen((value) {
      // searchTextController.text = '';
      getAllVideosUpdate();
    });
  }

  void getAllVideos() {
    executeRequestWithState<GetAllVideosResponse>(
        state: getAllVideosState,
        loaderMessage: 'loading videos...',
        future: _videosRepository.getAllVideos(),
        onSuccess: (res) {
          print('Get All Videos: ${res.result!.length}');
          allVideos.value = res;
        },
        onFailed: (msg) {
          showMessageDialog(
              mainMessage: 'Something went wrong, Try Again',
              type: MessageDialogType.error);
        });
  }

  void getAllVideosUpdate() {
    executeRequestWithState<GetAllVideosResponse>(
        state: getAllVideosState,
        future: _videosRepository.getAllVideos(),
        onSuccess: (res) {
          print('Get All Videos: ${res.result!.length}');
          allVideos.value = res;
        },
        onFailed: (msg) {
          showMessageDialog(mainMessage: 'Something went wrong, Try Again', type: MessageDialogType.error);
        });
  }

  void onViewVideoPressed(String videoId) async {
    await AppSharedPreferences.setSelectedVideoId(videoId);
    // _navigationServices.selectedVideoKey.refresh();
    Get.toNamed(Routes.viewVideo);
  }

  void onEditVideoPressed(String videoId) async {
    await AppSharedPreferences.setSelectedVideoId(videoId);
    Get.toNamed(Routes.editVideo);
    // getAllVideos();
  }

  void onDeleteVideoPressed(String videoId) {
    executeRequestWithState<DeleteVideoResponse>(
        state: deleteVideosState,
        loaderMessage: 'Deleting Video...',
        future: _videosRepository.deleteVideo(videoId),
        onSuccess: (res) {
          showMessageDialog(mainMessage: res.message, type: MessageDialogType.success);
          getAllVideos();
        },
        onFailed: (msg) {
          showMessageDialog(mainMessage: 'Something went wrong, Try Again', type: MessageDialogType.error);
        });
  }
}
