import 'package:get/get.dart';

class NavigationServices extends GetxService {

  Rx<bool> updateSizeList = true.obs;
  Rx<bool> updateLiveScore = true.obs;

  Future<NavigationServices> init() async {
    return this;
  }

}