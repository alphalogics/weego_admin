import 'package:get/get.dart';
import '../api/base_api_client.dart';

abstract class BaseRepository {
  final client = Get.find<BaseApiClient>();
}