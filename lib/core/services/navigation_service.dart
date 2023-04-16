import 'package:get/get.dart';

class NavigationServices extends GetxService {

  Rx<bool> updateSizeList = true.obs;
  Rx<bool> updateLiveScore = true.obs;

  Rx<String> selectedVideoKey = ''.obs;
  Rx<String> selectedNewsKey = ''.obs;

  Future<NavigationServices> init() async {
    return this;
  }

}