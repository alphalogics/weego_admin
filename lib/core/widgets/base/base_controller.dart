import 'dart:async';
import 'package:get/get.dart';

class BaseController<T> extends GetxController {
  List<StreamSubscription?> streams = [];
  late final T input;

  @override
  void onInit() {
    super.onInit();
    input = Get.arguments;
  }

  @override
  void onReady() {}

  @override
  void onClose() {
    streams.forEach((element) {
      element!.cancel();
    });
    super.onClose();
  }

  @override
  void onDetached() {}

  @override
  void onInactive() {}

  @override
  void onPaused() {}

  @override
  void onResumed() {}

  @override
  void update([List<Object>? ids, bool condition = true]) {}
}
