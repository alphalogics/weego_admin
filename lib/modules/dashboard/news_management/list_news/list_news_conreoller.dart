import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:weego_admin/core/widgets/base/base_controller.dart';

import '../../../../core/api/base_state.dart';
import '../../../../core/models/responses/delete_video_response.dart';
import '../../../../core/models/responses/general_news_response.dart';
import '../../../../core/models/responses/get_all_news_response.dart';
import '../../../../core/repositories/news_repository.dart';
import '../../../../core/routings/app_route.dart';
import '../../../../core/shared_preference/app_shared_preference.dart';
import '../../../../core/utils/message_dialog.dart';
import '../../../../core/utils/request_utils.dart';

class ListNewsController extends BaseController {

  final NewsRepository _newsRepository;
  ListNewsController(this._newsRepository);

  var getAllNewsState = BaseState<GetAllNewsResponse>();
  var deleteNewsState = BaseState<GeneralNewsResponse>();

  Rx<GetAllNewsResponse> allNews = Rx<GetAllNewsResponse>(GetAllNewsResponse());

  @override
  void onReady() {
    getAllNews();
    super.onReady();
  }

  void getAllNews() {
    executeRequestWithState<GetAllNewsResponse>(
      state: getAllNewsState,
      loaderMessage: 'Getting News...',
      future: _newsRepository.getAllNews(),
      onSuccess: (res) {
        allNews.value = res;
      },
      onFailed: (msg) {
        showMessageDialog(
            mainMessage: 'Something went wrong, Try Again',
            type: MessageDialogType.error);
      }
    );
  }

  void onViewNewsPressed(String newsId) async {
    await AppSharedPreferences.setSelectedNewsId(newsId);
    Get.toNamed(Routes.viewNews);
  }

  void onEditNewsPressed(String newsId) async {
    await AppSharedPreferences.setSelectedNewsId(newsId);
    Get.toNamed(Routes.editNews);
  }

  void onDeleteNewsPressed(String newsId) {
    executeRequestWithState<GeneralNewsResponse>(
        state: deleteNewsState,
        loaderMessage: 'Deleting News...',
        future: _newsRepository.deleteNews(newsId),
        onSuccess: (res) {
          showMessageDialog(
              mainMessage: res.message, type: MessageDialogType.success);
        },
        onFailed: (msg) {
          showMessageDialog(
              mainMessage: 'Something went wrong, Try Again',
              type: MessageDialogType.error);
        });
  }

}