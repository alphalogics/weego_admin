import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../api/base_api_client.dart';
import '../services/navigation_service.dart';

class InitialBinding implements Bindings {

  @override
  void dependencies() async {
    Get.put<BaseApiClient>(BaseApiClientImpl(Dio()), permanent: true);
    await Get.putAsync(() => NavigationServices().init());
  }

}