import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weego_admin/modules/dashboard/videos_management/view_video/view_video_controller.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import '../../../../core/constant/app_colors.dart';
import '../../../../core/routings/app_route.dart';
import '../../../../core/widgets/base/base_app_bar.dart';
import '../../../../core/widgets/base/base_scaffold.dart';
import '../../../../core/widgets/spacings/app_spacer.dart';
import '../../../../core/widgets/text/app_text.dart';

class ViewVideoPage extends GetView<ViewVideoController> {

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: BaseAppBar(
        title: 'View Video',
        leadingIcon: IconButton(
          onPressed: () {
            Get.offNamed(Routes.listVideo);
          },
          icon: Icon(
            Icons.arrow_back_outlined,
            color: kcBlackColor,
          ),
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
                _videoDetails(),
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

  Widget _videoDetails() {
    return Obx(() {
      var video = controller.videoResponse.value.result;
      return video == null
          ? SizedBox()
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                YoutubePlayer(
                  controller: YoutubePlayerController.fromVideoId(
                    videoId: video.videoLink!,
                    params: const YoutubePlayerParams(showFullscreenButton: true),
                  ),
                  aspectRatio: 16 / 9,
                ),
                verticalSpaceRegular,
                AppText.headingFour(
                  video.title,
                  color: kcBlackColor,
                ),
                verticalSpaceRegular,
                AppText.bodyThree(
                  video.description,
                  color: kcBlackColor,
                ),
              ],
            );
    });
  }
}
