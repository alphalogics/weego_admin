import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import '../../../../../../core/widgets/base/base_scaffold.dart';
import '../../../../core/constant/app_colors.dart';
import '../../../../core/routings/app_route.dart';
import '../../../../core/widgets/base/base_app_bar.dart';
import '../../../../core/widgets/button/app_fill_button.dart';
import '../../../../core/widgets/input/app_input_field.dart';
import '../../../../core/widgets/input/app_multiline_input_field.dart';
import '../../../../core/widgets/spacings/app_spacer.dart';
import '../../../../core/widgets/text/app_text.dart';
import 'edit_video_controller.dart';

class EditVideoPage extends GetView<EditVideoController> {

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: BaseAppBar(
        title: 'Edit Videos',
        leadingIcon: IconButton(
          onPressed: () {
            Get.offNamed(Routes.listVideo);
          },
          icon: Icon(Icons.arrow_back_outlined, color: kcBlackColor,),
        ),
      ),
      body: Row(
        children: [
          const Expanded(
            flex: 1,
            child: SizedBox(),
          ),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpaceMedium,
                AppText.headingFour(
                  'Edit Video', color: kcBlackColor,),
                verticalSpaceRegular,
                _editVideoForm(),
                verticalSpaceMedium,
              ],
            ),
          ),
          const Expanded(
            flex: 1,
            child: SizedBox(),
          ),
        ],
      ),
    );
  }

  Widget _editVideoForm() {
    return Form(
      key: controller.editVideoKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppInputField(
            controller: controller.videoLinkController,
            title: 'Video Link',
            hintText: 'Enter Video Link',
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            validator: ValidationBuilder().required('This field is required').build(),
          ),
          verticalSpaceSmall,
          AppMultilineInputField(
            controller: controller.videoTitleController,
            title: 'Video Title',
            hintText: 'Enter video title',
            textInputAction: TextInputAction.newline,
            validator: ValidationBuilder().required('This field is required').build(),
          ),
          verticalSpaceSmall,
          AppMultilineInputField(
            controller: controller.videoDescriptionController,
            title: 'Video Description',
            hintText: 'Enter video description',
            textInputAction: TextInputAction.newline,
            validator: ValidationBuilder().required('This field is required').build(),
          ),
          verticalSpaceSmall,
          SizedBox(
            width: 150,
            child: AppFilledButton(
              isRounded: false,
              btnText: 'Update Video',
              onPressed: () {
                controller.onEditVideoPressed();
                // Get.offAllNamed(Routes.adminHome);
              },
            ),
          ),
        ],
      ),
    );
  }

}