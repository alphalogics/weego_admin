import 'dart:io';
import 'dart:typed_data';
import 'package:dio/dio.dart' as client;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/widgets/base/base_controller.dart';
import '../../../../core/api/base_state.dart';
import '../../../../core/models/responses/general_news_response.dart';
import '../../../../core/models/responses/get_single_news_response.dart';
import '../../../../core/repositories/news_repository.dart';
import '../../../../core/routings/app_route.dart';
import '../../../../core/shared_preference/app_shared_preference.dart';
import '../../../../core/utils/message_dialog.dart';
import '../../../../core/utils/request_utils.dart';

class EditNewsController extends BaseController {

  final NewsRepository _newsRepository;
  EditNewsController(this._newsRepository);

  var editNewsKey = GlobalKey<FormState>();

  TextEditingController newsTitleController = TextEditingController();
  TextEditingController newsDescriptionController = TextEditingController();

  var addNewsState = BaseState<GeneralNewsResponse>();
  var viewNewsState = BaseState<GetSingleNewsResponse>();

  Rx<Uint8List> webImage = Rx(Uint8List(8));
  File? pickedImage;
  RxBool isPickedImage = RxBool(false);
  XFile? image;
  String? filename;
  String? filepath;

  String newsId = AppSharedPreferences.getSelectedNewsId()!;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    newsId = AppSharedPreferences.getSelectedNewsId()!;
    onGettingVideoDetail(newsId);
    super.onReady();
  }

  Future<void> pickingImageForWeb() async {
    final ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      var img = await image.readAsBytes();
      webImage.value = img;
      filename = image.name;
      filepath = image.path;
      pickedImage = File('a');
      isPickedImage.value = true;
    } else {
      isPickedImage.value = false;
    }
  }

  void test() {
    print('text');
  }

  void onUpdateNewsPressed() {

    newsId = AppSharedPreferences.getSelectedNewsId()!;

    client.FormData data;

    if(isPickedImage.value) {
      data = client.FormData.fromMap({
        'image': client.MultipartFile.fromBytes(webImage.value, filename: filename),
        'title': newsTitleController.text,
        'description': newsDescriptionController.text,
      });
    }
    else {
      data = client.FormData.fromMap({
        'title': newsTitleController.text,
        'description': newsDescriptionController.text,
      });
    }

    executeRequestWithState<GeneralNewsResponse>(
      state: addNewsState,
      loaderMessage: 'Updating News Info...',
      future: _newsRepository.updateNews(newsId, data),
      onSuccess: (res) {
        print('Saving News Info: ${res.message}');
        showMessageDialog(
            mainMessage: '${res.message}', type: MessageDialogType.success);
        // Get.offNamed(Routes.listNews);
      },
      onFailed: (msg) {
        print('Saving News Info: $msg');
        showMessageDialog(
            type: MessageDialogType.error,
            mainMessage: 'Something went wrong, Try Again');
      },
    );

  }

  void onGettingVideoDetail(String newsId) {

    newsId = AppSharedPreferences.getSelectedNewsId()!;

    executeRequestWithState<GetSingleNewsResponse>(
        state: viewNewsState,
        loaderMessage: 'Getting News Info...',
        future: _newsRepository.getSingleNews(newsId),
        onSuccess: (res) {
          newsTitleController.text = res.result!.title!;
          newsDescriptionController.text = res.result!.description!;
        },
        onFailed: (msg) {
          showMessageDialog(mainMessage: 'Something went wrong, Try Again', type: MessageDialogType.error);
        }

    );
  }

}