import 'dart:async';
import 'package:get/get.dart';
import '../../../core/routings/app_route.dart';
import '../../../core/widgets/base/base_controller.dart';

class SplashController extends BaseController {

  String title = 'WeeGo 365';

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // AppSingleton.currentItemIndex = 0;
    // AppSharedPreferences.setCurrentPageIndex(0);
    super.onReady();
  }

  void startTimer() {
    Timer(const Duration(seconds: 3), () {
      // Get.offAllNamed(Routes.liveScore);
      Get.offAllNamed(Routes.login);
    });
  }

}