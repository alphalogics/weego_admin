import 'package:flutter/cupertino.dart';
import '../../../../../../core/widgets/base/base_controller.dart';
import '../../../../core/api/base_state.dart';
import '../../../../core/models/requests/video_request.dart';
import '../../../../core/models/responses/save_video_response.dart';
import '../../../../core/repositories/videos_repository.dart';
import '../../../../core/utils/message_dialog.dart';
import '../../../../core/utils/request_utils.dart';

class AddVideoController extends BaseController {

  final VideosRepository _videosRepository;
  AddVideoController(this._videosRepository);

  var addVideoKey = GlobalKey<FormState>();

  TextEditingController videoLinkController = TextEditingController();
  TextEditingController videoTitleController = TextEditingController();
  TextEditingController videoDescriptionController = TextEditingController();

  var addVideoState = BaseState<SaveVideoResponse>();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  void onAddNewVideoPressed() {
    final isValid = addVideoKey.currentState!.validate();
    if(isValid) {
      saveVideoData();
    }
  }

  void saveVideoData() {

    VideoRequest request = VideoRequest(
      videoLink: videoLinkController.text.trim(),
      title: videoTitleController.text.trim(),
      description: videoDescriptionController.text.trim()
    );

    executeRequestWithState<SaveVideoResponse>(
        state: addVideoState,
        loaderMessage: 'Saving Video Info...',
        future: _videosRepository.saveVideo(request),
      onSuccess: (res) {
        showMessageDialog(mainMessage: '${res.message}', type: MessageDialogType.success);
        videoLinkController.text = "";
        videoTitleController.text = "";
        videoDescriptionController.text = "";
      },
      onFailed: (msg) {
        showMessageDialog(mainMessage: 'Something went wrong, Try Again', type: MessageDialogType.error);
      }
    );

  }

}