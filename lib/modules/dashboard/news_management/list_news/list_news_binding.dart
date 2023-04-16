import 'package:get/get.dart';
import 'package:weego_admin/core/services/navigation_service.dart';

import '../../../../core/repositories/news_repository.dart';
import '../../../../core/repositories/videos_repository.dart';
import 'list_news_conreoller.dart';

class ListNewsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewsRepository>(() => NewsRepositoryImpl());
    Get.lazyPut(() => ListNewsController(Get.find<NewsRepository>(), Get.find<NavigationServices>()));
  }

}