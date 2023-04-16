import 'package:get/get.dart';
import '../../../../core/repositories/videos_repository.dart';
import '../../../../core/services/navigation_service.dart';
import 'list_video_controller.dart';

class ListVideoBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VideosRepository>(() => VideosRepositoryImpl());
    Get.lazyPut(() => ListVideoController(Get.find<VideosRepository>(), Get.find<NavigationServices>()));
  }

}