import 'package:get/get.dart';
import 'package:weego_admin/core/services/navigation_service.dart';

import '../../../../core/repositories/news_repository.dart';
import 'edit_news_controller.dart';

class EditNewsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewsRepository>(() => NewsRepositoryImpl());
    Get.lazyPut(() => EditNewsController(Get.find<NewsRepository>(), Get.find<NavigationServices>()));
  }

}