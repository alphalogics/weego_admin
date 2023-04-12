import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import '../../../../../core/constant/app_colors.dart';
import '../../../../../core/widgets/base/base_app_bar.dart';
import '../../../../../core/widgets/base/base_scaffold.dart';
import '../../../../../core/widgets/button/app_fill_button.dart';
import '../../../../../core/widgets/card/app_card.dart';
import '../../../../../core/widgets/input/app_input_field.dart';
import '../../../../../core/widgets/nav_drawer/left_nav_drawer.dart';
import '../../../../../core/widgets/text/app_text.dart';
import '../../../../../core/widgets/utils/line.dart';
import '../../../../core/widgets/spacings/app_spacer.dart';
import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: BaseAppBar(
        title: 'Home Page',
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
                  'Cover Header', color: kcBlackColor,),
                verticalSpaceRegular,
                _changeCoverHeaderForm(),
                verticalSpaceLarge,
                Line.dark(),
                verticalSpaceLarge,
                AppText.headingFour(
                  'Change Live Stream Link', color: kcBlackColor,),
                verticalSpaceRegular,
                _changeLiveStreamForm(),
                verticalSpaceLarge,
                Line.dark(),
                verticalSpaceLarge,
                AppText.headingFour(
                  'Change Youtube Link', color: kcBlackColor,),
                verticalSpaceRegular,
                _changeYoutubeForm(),
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

  Widget _changeCoverHeaderForm() {
    return Form(
      key: controller.coverKey,
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
                child: Obx(() => controller.isPickedImage.value == false ? FadeInImage(placeholder: const AssetImage('assets/other/loading.gif'), image: NetworkImage(controller.imageLink.value)) : Image.memory(controller.webImage.value, fit: BoxFit.cover,)),
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
                  else {
                    controller.pickingImageForMobile();
                  }
                },
              ),
            ),
            verticalSpaceRegular,
            AppInputField(
              controller: controller.coverTitleController,
              title: 'Title',
              hintText: 'Enter title',
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              validator: ValidationBuilder().required('This field is required').build(),
            ),
            verticalSpaceSmall,
            AppInputField(
              controller: controller.coverDesController,
              title: 'Description',
              hintText: 'Enter description',
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
                  controller.onSaveCoverHeaderInfo();
                  // Get.offAllNamed(Routes.adminHome);
                },
              ),
            ),
          ],
        ),
    );
  }

  Widget _changeLiveStreamForm() {
    return Form(
      key: controller.liveStreamKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppInputField(
            controller: controller.liveStreamController,
            title: 'Live Stream Link:',
            hintText: 'Enter live stream link',
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
                controller.onChangeLiveStream();
                // Get.offAllNamed(Routes.adminHome);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _changeYoutubeForm() {
    return Form(
      key: controller.youtubeKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppInputField(
            controller: controller.youtubeController,
            title: 'Youtube',
            hintText: 'Enter youtube link',
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
                controller.onChangeYoutube();
                // Get.offAllNamed(Routes.adminHome);
              },
            ),
          ),
        ],
      ),
    );
  }

}
