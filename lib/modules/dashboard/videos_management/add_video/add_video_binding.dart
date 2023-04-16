import 'package:get/get.dart';
import 'package:weego_admin/core/repositories/videos_repository.dart';
import 'package:weego_admin/core/services/navigation_service.dart';
import 'add_video_controller.dart';

class AddVideoBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VideosRepository>(() => VideosRepositoryImpl());
    Get.lazyPut(() => AddVideoController(Get.find<VideosRepository>(), Get.find<NavigationServices>()));
  }

}