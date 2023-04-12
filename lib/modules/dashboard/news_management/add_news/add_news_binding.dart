import 'package:get/get.dart';
import '../../../../core/repositories/news_repository.dart';
import 'add_news_controller.dart';

class AddNewsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewsRepository>(() => NewsRepositoryImpl());
    Get.lazyPut(() => AddNewsController(Get.find<NewsRepository>()));
  }

}