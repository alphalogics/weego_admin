import 'package:get/get.dart';
import '../../../../core/repositories/auth_repository.dart';
import 'login_controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRepository>(() => AuthRepositoryImpl());
    Get.lazyPut(() => LoginController(Get.find<AuthRepository>()));
  }

}