import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import '../../../../core/constant/app_colors.dart';
import '../../../../core/routings/app_route.dart';
import '../../../../core/widgets/base/base_scaffold.dart';
import '../../../../core/widgets/button/app_fill_button.dart';
import '../../../../core/widgets/input/app_input_field.dart';
import '../../../../core/widgets/spacings/app_spacer.dart';
import '../../../../core/widgets/text/app_text.dart';
import '../../../../core/widgets/utils/row_expanded.dart';
import 'login_controller.dart';

class LoginPage extends GetView<LoginController> {

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      shouldIncludeScrolling: false,
      body: Center(
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: SizedBox(),),
              Expanded(
                flex: 2,
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/branding/logo.png', width: 200,),
                      verticalSpaceRegular,
                      AppText.headingFour('Admin Login', color: kcBlackColor,),
                      verticalSpaceMedium,
                      AppInputField(
                        controller: controller.usernameController,
                        title: 'Username:',
                        hintText: 'Enter username',
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        validator: ValidationBuilder().required(
                            'This field is required').build(),
                      ),
                      verticalSpaceMedium,
                      Obx(() {
                        return AppInputField(
                          controller: controller.passwordController,
                          title: 'Password:',
                          hintText: 'Enter password',
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.done,
                          validator: ValidationBuilder()
                              .minLength(8,
                              'Password must be at least 8 characters long'.tr)
                              .build(),
                          obscureText: controller.isPasswordObscure.value,
                          suffixIcon: IconButton(
                            icon: Icon(controller.isPasswordObscure.value
                                ? Icons.visibility_off_outlined
                                : Icons.remove_red_eye_outlined),
                            onPressed: () {
                              controller.onShowOrHidePasswordPressed();
                            },
                          ),
                        );
                      }),
                      verticalSpaceLarge,
                      RowExpanded(
                        child: AppFilledButton(
                          isRounded: false,
                          btnText: 'Login',
                          onPressed: () {
                            controller.onLoginValidate();
                            // Get.offAllNamed(Routes.adminHome);
                          },
                        ),
                      ),
                    ],
                  ),
                ),),
              Expanded(
                flex: 1,
                child: SizedBox(),),
            ],
          )),
    );
  }
}