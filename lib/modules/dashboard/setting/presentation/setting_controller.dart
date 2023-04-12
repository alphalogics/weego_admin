import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weego_admin/core/models/requests/change_password_request.dart';
import 'package:weego_admin/core/models/requests/links_request.dart';
import 'package:weego_admin/core/models/responses/change_password_response.dart';
import 'package:weego_admin/core/models/responses/links_response.dart';
import 'package:weego_admin/core/utils/request_utils.dart';
import '../../../../../core/widgets/base/base_controller.dart';
import '../../../../core/api/base_state.dart';
import '../../../../core/repositories/auth_repository.dart';
import '../../../../core/repositories/link_repository.dart';
import '../../../../core/utils/message_dialog.dart';

class SettingController extends BaseController {

  final AuthRepository _authRepository;
  final LinkRepository _linkRepository;
  SettingController(this._authRepository, this._linkRepository);

  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();

  TextEditingController facebookController = TextEditingController();
  TextEditingController instagramController = TextEditingController();
  TextEditingController privacyPolicyController = TextEditingController();
  TextEditingController contactUsController = TextEditingController();

  final changePasswordKey = GlobalKey<FormState>();
  var isOldPasswordObscure = true.obs;
  var isNewPasswordObscure = true.obs;

  final facebookKey = GlobalKey<FormState>();
  final instagramKey = GlobalKey<FormState>();
  final privacyPolicyKey = GlobalKey<FormState>();
  final contactUsKey = GlobalKey<FormState>();

  var changePasswordState = BaseState<ChangePasswordResponse>();
  var saveLinksState = BaseState<LinksResponse>();
  var getLinksState = BaseState<LinksResponse>();

  @override
  void onInit() {
    // TODO: implement onInit
    onGetAllLinks();
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  void onGetAllLinks() {
    executeRequestWithState<LinksResponse>(
        state: getLinksState,
        future: _linkRepository.getLinks(),
      onSuccess: (res) {
          privacyPolicyController.text = res.result!.privacyPolicy!;
          contactUsController.text = res.result!.contactUs!;
          facebookController.text = res.result!.facebook!;
          instagramController.text = res.result!.instagram!;
      },
    );
  }

  void onShowOrHideOldPasswordPressed() {
    isOldPasswordObscure.value = !isOldPasswordObscure.value;
  }

  void onShowOrHideNewPasswordPressed() {
    isNewPasswordObscure.value = !isNewPasswordObscure.value;
  }

  void onChangePasswordValidate() {
    final isValid = changePasswordKey.currentState!.validate();
    if(isValid) {
      onChangePasswordPressed();
    }
  }


  void onChangePasswordPressed() {
    var request = ChangePasswordRequest(oldPassword: oldPasswordController.text, newPassword: newPasswordController.text);
    executeRequestWithState<ChangePasswordResponse>(
        loaderMessage: 'Changing Password...',
        state: changePasswordState,
        future: _authRepository.changePassword(request),
      onSuccess: (res) {
          print('Change Password State: ${res.message}');
          showMessageDialog(mainMessage: '${res.message}', type: MessageDialogType.success);
          oldPasswordController.text = '';
          newPasswordController.text = '';
      },
      onFailed: (msg) {
          print('Change Password State: $msg');
          showMessageDialog(type: MessageDialogType.error, mainMessage: 'Old Password may Incorrect');
      }
    );
  }

  void onChangePrivacyPolicy() {
    final isValid = privacyPolicyKey.currentState!.validate();
    if(isValid) {
      var request = LinksRequest(privacyPolicy: privacyPolicyController.text.trim());
      updateLinks(request);
    }
  }

  void onChangeContactUs() {
    final isValid = contactUsKey.currentState!.validate();
    if(isValid) {
      var request = LinksRequest(contactUs: contactUsController.text.trim());
      updateLinks(request);
    }
  }

  void onChangeFacebook() {
    final isValid = facebookKey.currentState!.validate();
    if(isValid) {
      var request = LinksRequest(facebook: facebookController.text.trim());
      updateLinks(request);
    }
  }

  void onChangeInstagram() {
    final isValid = instagramKey.currentState!.validate();
    if(isValid) {
      var request = LinksRequest(instagram: instagramController.text.trim());
      updateLinks(request);
    }
  }

  void updateLinks(LinksRequest request) {
    executeRequestWithState<LinksResponse>(
        state: saveLinksState,
        loaderMessage: 'Changing Link...',
        future: _linkRepository.saveLinks(request),
      onSuccess: (res) {
          print('Change Link State: ${res.message}');
          showMessageDialog(mainMessage: '${res.message}', type: MessageDialogType.success);
      },
        onFailed: (msg) {
          print('Change Link State: $msg');
          showMessageDialog(type: MessageDialogType.error, mainMessage: 'Something went wrong, Try Again');
        }
    );
  }

}