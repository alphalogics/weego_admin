import 'package:get/get.dart';
import 'package:weego_admin/core/shared_preference/app_shared_preference.dart';

import '../../../../../core/widgets/base/base_controller.dart';
import '../../../../core/api/base_state.dart';
import '../../../../core/models/responses/get_single_news_response.dart';
import '../../../../core/repositories/news_repository.dart';
import '../../../../core/utils/message_dialog.dart';
import '../../../../core/utils/request_utils.dart';

class ViewNewsController extends BaseController {

  final NewsRepository _newsRepository;
  ViewNewsController(this._newsRepository);

  var viewNewsState = BaseState<GetSingleNewsResponse>();

  Rx<GetSingleNewsResponse> newsDetails = Rx<GetSingleNewsResponse>(GetSingleNewsResponse());

  String newsId = AppSharedPreferences.getSelectedNewsId()!;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    newsId = AppSharedPreferences.getSelectedNewsId()!;
    onGettingVideoDetail(newsId);
    super.onReady();
  }

  void onGettingVideoDetail(String newsId) {
    newsId = AppSharedPreferences.getSelectedNewsId()!;
    executeRequestWithState<GetSingleNewsResponse>(
        state: viewNewsState,
        loaderMessage: 'Getting News Info...',
        future: _newsRepository.getSingleNews(newsId),
        onSuccess: (res) {
          newsDetails.value = res;
        },
        onFailed: (msg) {
          showMessageDialog(mainMessage: 'Something went wrong, Try Again', type: MessageDialogType.error);
        }

    );
  }

}