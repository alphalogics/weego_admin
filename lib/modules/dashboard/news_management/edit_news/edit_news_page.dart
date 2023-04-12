import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import '../../../../../core/widgets/base/base_scaffold.dart';
import '../../../../core/constant/app_colors.dart';
import '../../../../core/routings/app_route.dart';
import '../../../../core/widgets/base/base_app_bar.dart';
import '../../../../core/widgets/button/app_fill_button.dart';
import '../../../../core/widgets/card/app_card.dart';
import '../../../../core/widgets/input/app_multiline_input_field.dart';
import '../../../../core/widgets/spacings/app_spacer.dart';
import '../../../../core/widgets/text/app_text.dart';
import 'edit_news_controller.dart';

class EditNewsPage extends GetView<EditNewsController> {

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      shouldIncludeScrolling: false,
      appBar: BaseAppBar(
        title: 'Edit News',
        leadingIcon: IconButton(
          onPressed: () {
            Get.offNamed(Routes.listNews);
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
                  'Edit News', color: kcBlackColor,),
                verticalSpaceRegular,
                _editNewsForm(),
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

  Widget _editNewsForm() {
    return Form(
      key: controller.editNewsKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppCard(
            child: Container(
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Obx(() => controller.isPickedImage.value == false ? Image.asset('assets/other/image_na.png', fit: BoxFit.cover,) : Image.memory(controller.webImage.value, fit: BoxFit.cover,)),
            ),
          ),
          verticalSpaceSmall,
          SizedBox(
            width: 150,
            child: AppFilledButton(
              isRounded: false,
              btnText: 'Select Image',
              onPressed: () {
                // Get.offAllNamed(Routes.adminHome);
                if (kIsWeb) {
                  controller.pickingImageForWeb();
                }
                // else {
                //   controller.pickingImageForMobile();
                // }
              },
            ),
          ),
          verticalSpaceRegular,
          AppMultilineInputField(
            controller: controller.newsTitleController,
            title: 'Video Title',
            hintText: 'Enter video title',
            textInputAction: TextInputAction.newline,
            validator: ValidationBuilder().required('This field is required').build(),
          ),
          verticalSpaceSmall,
          AppMultilineInputField(
            controller: controller.newsDescriptionController,
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
              btnText: 'Update News',
              onPressed: () {
                // controller.test();
                controller.onUpdateNewsPressed();
                // Get.offAllNamed(Routes.adminHome);
              },
            ),
          ),
        ],
      ),
    );
  }

}