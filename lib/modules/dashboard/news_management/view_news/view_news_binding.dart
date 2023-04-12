import 'package:get/get.dart';
import 'package:weego_admin/modules/dashboard/news_management/view_news/view_news_controller.dart';

import '../../../../core/repositories/news_repository.dart';

class ViewNewsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewsRepository>(() => NewsRepositoryImpl());
    Get.lazyPut(() => ViewNewsController(Get.find<NewsRepository>()));
  }

}