import 'package:get/get.dart';
import 'package:weego_admin/core/repositories/videos_repository.dart';
import 'edit_video_controller.dart';

class EditVideoBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VideosRepository>(() => VideosRepositoryImpl());
    Get.lazyPut(() => EditVideoController(Get.find<VideosRepository>()));
  }

}