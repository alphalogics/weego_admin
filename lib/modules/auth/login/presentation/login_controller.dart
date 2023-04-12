import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../core/api/base_state.dart';
import '../../../../core/models/requests/login_request.dart';
import '../../../../core/models/responses/login_response.dart';
import '../../../../core/repositories/auth_repository.dart';
import '../../../../core/routings/app_route.dart';
import '../../../../core/utils/message_dialog.dart';
import '../../../../core/utils/request_utils.dart';
import '../../../../core/widgets/base/base_controller.dart';

class LoginController extends BaseController {

  final AuthRepository _authRepository;
  LoginController(this._authRepository);
  
  var loginState = BaseState<LoginResponse>();

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  var isPasswordObscure = true.obs;

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

  void onShowOrHidePasswordPressed() {
    isPasswordObscure.value = !isPasswordObscure.value;
  }

  void onLoginValidate() {
    final isValid = formKey.currentState!.validate();
    if(isValid) {
      onLoginPressed();
    }
  }

  void onLoginPressed() {
    var request = LoginRequest(username: usernameController.text, password: passwordController.text);
    executeRequestWithState<LoginResponse>(
      loaderMessage: 'Logging in...',
      state: loginState,
      future: _authRepository.login(request),
      onSuccess: (res) {
        print('Success Status: ${res.success}');
        Get.offAllNamed(Routes.adminHome);
      },
      onFailed: (msg) {
        print('Success Status: $msg');
        showMessageDialog(mainMessage: 'Username or Password may Incorrect', type: MessageDialogType.error);
      }
    );
  }

}