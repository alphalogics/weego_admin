import 'package:get/get.dart';
import 'package:weego_admin/core/repositories/videos_repository.dart';
import 'package:weego_admin/modules/dashboard/videos_management/view_video/view_video_controller.dart';

class ViewVideoBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VideosRepository>(() => VideosRepositoryImpl());
    Get.lazyPut(() => ViewVideoController(Get.find<VideosRepository>()));
  }

}