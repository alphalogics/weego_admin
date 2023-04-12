import 'package:flutter/cupertino.dart';
import 'package:weego_admin/core/shared_preference/app_shared_preference.dart';

import '../../../../../../core/widgets/base/base_controller.dart';
import '../../../../core/api/base_state.dart';
import '../../../../core/models/requests/video_request.dart';
import '../../../../core/models/responses/get_single_video_response.dart';
import '../../../../core/models/responses/save_video_response.dart';
import '../../../../core/repositories/videos_repository.dart';
import '../../../../core/utils/message_dialog.dart';
import '../../../../core/utils/request_utils.dart';

class EditVideoController extends BaseController {

  final VideosRepository _videosRepository;
  EditVideoController(this._videosRepository);

  var editVideoKey = GlobalKey<FormState>();

  TextEditingController videoLinkController = TextEditingController();
  TextEditingController videoTitleController = TextEditingController();
  TextEditingController videoDescriptionController = TextEditingController();

  var editVideoState = BaseState<SaveVideoResponse>();
  var singleVideoState = BaseState<GetSingleVideoResponse>();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    onGettingVideoDetail('AppSharedPreferences.getSelectedVideoId()!');
    super.onReady();
  }

  void onGettingVideoDetail(String videoId) {
    executeRequestWithState<GetSingleVideoResponse>(
        state: singleVideoState,
        loaderMessage: 'Getting Video Info...',
        future: _videosRepository.getVideo('6425ba2a4a988d2608df9e18'),
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

    VideoRequest request = VideoRequest(
        videoLink: videoLinkController.text.trim(),
        title: videoTitleController.text.trim(),
        description: videoDescriptionController.text.trim()
    );

    executeRequestWithState<SaveVideoResponse>(
        state: editVideoState,
        loaderMessage: 'Updating Video Info...',
        future: _videosRepository.updateVideo('6425ba2a4a988d2608df9e18', request),
        onSuccess: (res) {
          showMessageDialog(mainMessage: '${res.message}', type: MessageDialogType.success);
        },
        onFailed: (msg) {
          showMessageDialog(mainMessage: 'Something went wrong, Try Again', type: MessageDialogType.error);
        }
    );

  }

}