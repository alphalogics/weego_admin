import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:weego_admin/core/shared_preference/app_shared_preference.dart';

import '../../../../../../core/widgets/base/base_controller.dart';
import '../../../../core/api/base_state.dart';
import '../../../../core/models/requests/video_request.dart';
import '../../../../core/models/responses/get_single_video_response.dart';
import '../../../../core/models/responses/save_video_response.dart';
import '../../../../core/repositories/videos_repository.dart';
import '../../../../core/routings/app_route.dart';
import '../../../../core/services/navigation_service.dart';
import '../../../../core/utils/message_dialog.dart';
import '../../../../core/utils/request_utils.dart';

class EditVideoController extends BaseController {

  final VideosRepository _videosRepository;
  final NavigationServices _navigationServices;
  EditVideoController(this._videosRepository, this._navigationServices);

  var editVideoKey = GlobalKey<FormState>();

  TextEditingController videoLinkController = TextEditingController();
  TextEditingController videoTitleController = TextEditingController();
  TextEditingController videoDescriptionController = TextEditingController();

  var editVideoState = BaseState<SaveVideoResponse>();
  var singleVideoState = BaseState<GetSingleVideoResponse>();

  String videoId = AppSharedPreferences.getSelectedVideoId()!;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
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
          videoLinkController.text = res.result!.videoLink!;
          videoTitleController.text = res.result!.title!;
          videoDescriptionController.text = res.result!.description!;
        },
        onFailed: (msg) {
          showMessageDialog(mainMessage: 'Something went wrong, Try Again', type: MessageDialogType.error);
        }

    );
  }

  void onEditVideoPressed() {
    final isValid = editVideoKey.currentState!.validate();
    if(isValid) {
      editVideoData();
    }
  }

  void editVideoData() {

    videoId = AppSharedPreferences.getSelectedVideoId()!;

    VideoRequest request = VideoRequest(
        videoLink: videoLinkController.text.trim(),
        title: videoTitleController.text.trim(),
        description: videoDescriptionController.text.trim()
    );

    executeRequestWithState<SaveVideoResponse>(
        state: editVideoState,
        loaderMessage: 'Updating Video Info...',
        future: _videosRepository.updateVideo(videoId, request),
        onSuccess: (res) {
          showMessageDialog(mainMessage: '${res.message}', type: MessageDialogType.success);
          _navigationServices.selectedVideoKey.refresh();
        },
        onFailed: (msg) {
          showMessageDialog(mainMessage: 'Something went wrong, Try Again', type: MessageDialogType.error);
        }
    );

  }

}