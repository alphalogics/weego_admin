import 'dart:io';
import 'dart:typed_data';
import 'package:dio/dio.dart' as client;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/widgets/base/base_controller.dart';
import '../../../../core/api/base_state.dart';
import '../../../../core/models/requests/cover_header_request.dart';
import '../../../../core/models/requests/links_request.dart';
import '../../../../core/models/responses/cover_header_response.dart';
import '../../../../core/models/responses/links_response.dart';
import '../../../../core/models/responses/save_cover_header_response.dart';
import '../../../../core/repositories/header_repository.dart';
import '../../../../core/repositories/link_repository.dart';
import '../../../../core/utils/message_dialog.dart';
import '../../../../core/utils/request_utils.dart';

class HomeController extends BaseController {
  final LinkRepository _linkRepository;
  final HeaderRepository _headerRepository;

  HomeController(this._linkRepository, this._headerRepository);

  Rx<Uint8List> webImage = Rx(Uint8List(8));

  // Uint8List webImage = Uint8List(8);
  File? pickedImage;
  RxBool isPickedImage = RxBool(false);

  // File? pickedImage;

  var liveStreamKey = GlobalKey<FormState>();
  var youtubeKey = GlobalKey<FormState>();
  var coverKey = GlobalKey<FormState>();

  TextEditingController liveStreamController = TextEditingController();
  TextEditingController youtubeController = TextEditingController();
  TextEditingController coverTitleController = TextEditingController();
  TextEditingController coverDesController = TextEditingController();

  var saveLinksState = BaseState<LinksResponse>();
  var getLinksState = BaseState<LinksResponse>();
  var getCoverHeaderState = BaseState<CoverHeaderResponse>();
  var saveCoverHeaderState = BaseState<SaveCoverHeaderResponse>();

  var imageLink = 'http://uploads.ilaayn.com/'.obs;

  XFile? image;
  String? filename;
  String? filepath;

  @override
  void onInit() {
    onGetCoverHeader();
    onGetAllLinks();
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

  Future<void> pickingImageForMobile() async {
    final ImagePicker picker = ImagePicker();
    image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      var img = File(image!.path);
      pickedImage = img;
      isPickedImage.value = true;
    } else {
      isPickedImage.value = false;
    }
  }

  void onGetCoverHeader() {
    executeRequestWithState<CoverHeaderResponse>(
        state: getCoverHeaderState,
        future: _headerRepository.getCoverHeader(),
        onSuccess: (res) {
          imageLink.value = 'http://uploads.ilaayn.com/${res.result!.image!}';
          coverTitleController.text = res.result!.title!;
          coverDesController.text = res.result!.description!;
        });
  }

  void onGetAllLinks() {
    executeRequestWithState<LinksResponse>(
      state: getLinksState,
      future: _linkRepository.getLinks(),
      onSuccess: (res) {
        liveStreamController.text = res.result!.liveStream!;
        youtubeController.text = res.result!.youtube!;
      },
    );
  }

  // void onUpdateCoverHeaderPressed() {
  //   if(image != null) {
  //     onSaveCoverHeaderInfo();
  //   }
  //   else {
  //     showMessageDialog(
  //         type: MessageDialogType.error,
  //         mainMessage: 'Selected File Is Incorrect, Try Again');
  //   }
  // }

  void onSaveCoverHeaderInfo() async {
    // String filename = image!.path.split('/').last;
    // String filepath = image!.path;
    client.FormData data;

    if(isPickedImage.value) {
      data = client.FormData.fromMap({
        'image': client.MultipartFile.fromBytes(webImage.value, filename: filename),
        'title': coverTitleController.text,
        'description': coverDesController.text,
      });
    }
    else {
      data = client.FormData.fromMap({
        'title': coverTitleController.text,
        'description': coverDesController.text,
      });
    }

    // client.FormData data = client.FormData.fromMap({
    //   'image': client.MultipartFile.fromBytes(webImage.value, filename: filename),
    //   'title': coverTitleController.text,
    //   'description': coverDesController.text,
    // });

    executeRequestWithState<SaveCoverHeaderResponse>(
        state: saveCoverHeaderState,
        loaderMessage: 'Saving Cover Header Info...',
        future: _headerRepository.updateCoverHeader(data),
        onSuccess: (res) {
          print('Saving Cover Header Info: ${res.message}');
          showMessageDialog(
              mainMessage: '${res.message}', type: MessageDialogType.success);
        },
        onFailed: (msg) {
          print('Saving Cover Header Info: $msg');
          showMessageDialog(
              type: MessageDialogType.error,
              mainMessage: 'Something went wrong, Try Again');
        },
    );
  }

  void onChangeLiveStream() {
    final isValid = liveStreamKey.currentState!.validate();
    if (isValid) {
      updateLinks(LinksRequest(liveStream: liveStreamController.text.trim()));
    }
  }

  void onChangeYoutube() {
    final isValid = youtubeKey.currentState!.validate();
    if (isValid) {
      updateLinks(LinksRequest(youtube: youtubeController.text.trim()));
    }
  }

  void updateLinks(LinksRequest request) {
    executeRequestWithState<LinksResponse>(
        state: saveLinksState,
        loaderMessage: 'Changing Link...',
        future: _linkRepository.saveLinks(request),
        onSuccess: (res) {
          print('Change Link State: ${res.message}');
          showMessageDialog(
              mainMessage: '${res.message}', type: MessageDialogType.success);
        },
        onFailed: (msg) {
          print('Change Link State: $msg');
          showMessageDialog(
              type: MessageDialogType.error,
              mainMessage: 'Something went wrong, Try Again');
        });
  }
}
