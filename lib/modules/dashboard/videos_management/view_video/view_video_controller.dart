import 'package:get/get.dart';
import 'package:weego_admin/core/models/responses/get_single_video_response.dart';
import 'package:weego_admin/core/repositories/videos_repository.dart';
import '../../../../core/api/base_state.dart';
import '../../../../core/shared_preference/app_shared_preference.dart';
import '../../../../core/utils/message_dialog.dart';
import '../../../../core/utils/request_utils.dart';
import '../../../../core/widgets/base/base_controller.dart';

class ViewVideoController extends BaseController {

  final VideosRepository _videosRepository;
  ViewVideoController(this._videosRepository);

  var singleVideoState = BaseState<GetSingleVideoResponse>();

  Rx<GetSingleVideoResponse> videoResponse = Rx<GetSingleVideoResponse>(GetSingleVideoResponse());

  String videoId = AppSharedPreferences.getSelectedVideoId()!;

  @override
  void onInit() {
    // onGettingVideoDetail('AppSharedPreferences.getSelectedVideoId()!');
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    videoId = AppSharedPreferences.getSelectedVideoId()!;
    onGettingVideoDetail(videoId);
    super.onReady();
  }

  void onGettingVideoDetail(String videoId) {
    videoId = AppSharedPreferences.getSelectedVideoId()!;
    executeRequestWithState<GetSingleVideoResponse>(
        state: singleVideoState,
        loaderMessage: 'Getting Video Info...',
        future: _videosRepository.getVideo(videoId),
      onSuccess: (res) {
        videoResponse.value = res;
      },
      onFailed: (msg) {
        showMessageDialog(mainMessage: 'Something went wrong, Try Again', type: MessageDialogType.error);
      }

    );
  }

}