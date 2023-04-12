import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import 'package:weego_admin/modules/dashboard/setting/presentation/setting_controller.dart';
import '../../../../../core/constant/app_colors.dart';
import '../../../../../core/widgets/base/base_app_bar.dart';
import '../../../../../core/widgets/base/base_scaffold.dart';
import '../../../../../core/widgets/button/app_fill_button.dart';
import '../../../../../core/widgets/nav_drawer/left_nav_drawer.dart';
import '../../../../../core/widgets/spacings/app_spacer.dart';
import '../../../../../core/widgets/text/app_text.dart';
import '../../../../../core/widgets/utils/line.dart';
import '../../../../core/widgets/input/app_input_field.dart';

class SettingPage extends GetView<SettingController> {

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: BaseAppBar(
        title: 'Setting Page',
        leadingIcon: Row(
          children: [
            Builder(
              builder: (context) =>
                  IconButton(
                    icon: Icon(Icons.menu_rounded),
                    onPressed: () => Scaffold.of(context).openDrawer(),
                  ),
            ),
          ],
        ),
      ),
      drawer: NavDrawer(),
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: SizedBox(),),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpaceMedium,
                _changePasswordForm(),
                verticalSpaceLarge,
                Line.dark(),
                verticalSpaceLarge,
                AppText.headingFour('Change Social Links', color: kcBlackColor,),
                verticalSpaceRegular,
                _changeInstagramLinkForm(),
                verticalSpaceRegular,
                _changeFacebookLinkForm(),
                verticalSpaceLarge,
                Line.dark(),
                verticalSpaceLarge,
                AppText.headingFour('Change Other Links', color: kcBlackColor,),
                verticalSpaceRegular,
                _changePrivacyPolicyLinkForm(),
                verticalSpaceRegular,
                _changeContactUsLinkForm(),
                verticalSpaceLarge,
              ],
            ),),
          Expanded(
            flex: 1,
            child: SizedBox(),),
        ],
      ),
    );
  }

  Widget _changePasswordForm() {
    return Form(
      key: controller.changePasswordKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText.headingFour('Change Password', color: kcBlackColor,),
          verticalSpaceRegular,
          Obx(() {
            return AppInputField(
              controller: controller.oldPasswordController,
              title: 'Old Password:',
              hintText: 'Enter old password',
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              validator: ValidationBuilder()
                  .minLength(8,
                  'Password must be at least 8 characters long'.tr)
                  .build(),
              obscureText: controller.isOldPasswordObscure.value,
              suffixIcon: IconButton(
                icon: Icon(controller.isOldPasswordObscure.value
                    ? Icons.visibility_off_outlined
                    : Icons.remove_red_eye_outlined),
                onPressed: () {
                  controller.onShowOrHideOldPasswordPressed();
                },
              ),
            );
          }),
          verticalSpaceSmall,
          Obx(() {
            return AppInputField(
              controller: controller.newPasswordController,
              title: 'New Password:',
              hintText: 'Enter new password',
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
              validator: ValidationBuilder()
                  .minLength(8,
                  'Password must be at least 8 characters long'.tr)
                  .build(),
              obscureText: controller.isNewPasswordObscure.value,
              suffixIcon: IconButton(
                icon: Icon(controller.isNewPasswordObscure.value
                    ? Icons.visibility_off_outlined
                    : Icons.remove_red_eye_outlined),
                onPressed: () {
                  controller.onShowOrHideNewPasswordPressed();
                },
              ),
            );
          }),
          verticalSpaceSmall,
          SizedBox(
            width: 150,
            child: AppFilledButton(
              isRounded: false,
              btnText: 'Update',
              onPressed: () {
                controller.onChangePasswordValidate();
                // Get.offAllNamed(Routes.adminHome);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _changeFacebookLinkForm() {
    return Form(
      key: controller.facebookKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppInputField(
            controller: controller.facebookController,
            title: 'Facebook Link:',
            hintText: 'Enter facebook link',
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,
            validator: ValidationBuilder().required('This field is required').build(),
          ),
          verticalSpaceSmall,
          SizedBox(
            width: 150,
            child: AppFilledButton(
              isRounded: false,
              btnText: 'Update',
              onPressed: () {
                controller.onChangeFacebook();
                // Get.offAllNamed(Routes.adminHome);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _changeInstagramLinkForm() {
    return Form(
      key: controller.instagramKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppInputField(
            controller: controller.instagramController,
            title: 'Instagram Link:',
            hintText: 'Enter instagram link',
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,
            validator: ValidationBuilder().required('This field is required').build(),
          ),
          verticalSpaceSmall,
          SizedBox(
            width: 150,
            child: AppFilledButton(
              isRounded: false,
              btnText: 'Update',
              onPressed: () {
                controller.onChangeInstagram();
                // Get.offAllNamed(Routes.adminHome);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _changePrivacyPolicyLinkForm() {
    return Form(
      key: controller.privacyPolicyKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppInputField(
            controller: controller.privacyPolicyController,
            title: 'Privacy Policy Link:',
            hintText: 'Enter privacy policy link',
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,
            validator: ValidationBuilder().required('This field is required').build(),
          ),
          verticalSpaceSmall,
          SizedBox(
            width: 150,
            child: AppFilledButton(
              isRounded: false,
              btnText: 'Update',
              onPressed: () {
                controller.onChangePrivacyPolicy();
                // Get.offAllNamed(Routes.adminHome);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _changeContactUsLinkForm() {
    return Form(
      key: controller.contactUsKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppInputField(
            controller: controller.contactUsController,
            title: 'Contact Us Link:',
            hintText: 'Enter contact us link',
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,
            validator: ValidationBuilder().required('This field is required').build(),
          ),
          verticalSpaceSmall,
          SizedBox(
            width: 150,
            child: AppFilledButton(
              isRounded: false,
              btnText: 'Update',
              onPressed: () {
                controller.onChangeContactUs();
                // Get.offAllNamed(Routes.adminHome);
              },
            ),
          ),
        ],
      ),
    );
  }

}