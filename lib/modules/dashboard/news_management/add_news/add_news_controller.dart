import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart' as client;
import 'package:weego_admin/core/models/responses/general_news_response.dart';
import '../../../../../core/widgets/base/base_controller.dart';
import '../../../../core/api/base_state.dart';
import '../../../../core/repositories/news_repository.dart';
import '../../../../core/routings/app_route.dart';
import '../../../../core/services/navigation_service.dart';
import '../../../../core/utils/message_dialog.dart';
import '../../../../core/utils/request_utils.dart';

class AddNewsController extends BaseController {

  final NewsRepository _newsRepository;
  final NavigationServices _navigationServices;
  AddNewsController(this._newsRepository, this._navigationServices);

  var addNewsKey = GlobalKey<FormState>();

  TextEditingController newsTitleController = TextEditingController();
  TextEditingController newsDescriptionController = TextEditingController();

  var addNewsState = BaseState<GeneralNewsResponse>();

  Rx<Uint8List> webImage = Rx(Uint8List(8));
  File? pickedImage;
  RxBool isPickedImage = RxBool(false);
  XFile? image;
  String? filename;
  String? filepath;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
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

  void onAddNewNewsPressed() {
    if(filename == null) {
      showMessageDialog(
          type: MessageDialogType.error,
          mainMessage: 'Image may not selected');
    }
    var validate = addNewsKey.currentState!.validate();
    if(validate) {
      onAddNews();
    }
  }

  void onAddNews() {

    client.FormData data = client.FormData.fromMap({
      'image': client.MultipartFile.fromBytes(webImage.value, filename: filename),
      'title': newsTitleController.text,
      'description': newsDescriptionController.text,
    });

    executeRequestWithState<GeneralNewsResponse>(
      state: addNewsState,
      loaderMessage: 'Saving News Info...',
      future: _newsRepository.addNews(data),
      onSuccess: (res) {
        print('Saving News Info: ${res.message}');
        showMessageDialog(mainMessage: '${res.message}', type: MessageDialogType.success);
        _navigationServices.selectedNewsKey.refresh();
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

}