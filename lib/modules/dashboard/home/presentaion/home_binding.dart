import 'package:get/get.dart';
import '../../../../core/repositories/header_repository.dart';
import '../../../../core/repositories/link_repository.dart';
import 'home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LinkRepository>(() => LinkRepositoryImpl());
    Get.lazyPut<HeaderRepository>(() => HeaderRepositoryImpl());
    Get.lazyPut(() => HomeController(Get.find<LinkRepository>(), Get.find<HeaderRepository>()));
  }

}