import 'package:get/get.dart';
import 'package:weego_admin/modules/dashboard/setting/presentation/setting_controller.dart';
import '../../../../core/repositories/auth_repository.dart';
import '../../../../core/repositories/link_repository.dart';

class SettingBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRepository>(() => AuthRepositoryImpl());
    Get.lazyPut<LinkRepository>(() => LinkRepositoryImpl());
    Get.lazyPut(() => SettingController(Get.find<AuthRepository>(), Get.find<LinkRepository>()));
  }

}