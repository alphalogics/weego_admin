import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube/youtube_thumbnail.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import '../../../../../../core/constant/app_colors.dart';
import '../../../../../../core/routings/app_route.dart';
import '../../../../../../core/widgets/base/base_app_bar.dart';
import '../../../../../../core/widgets/base/base_scaffold.dart';
import '../../../../../../core/widgets/spacings/app_spacer.dart';
import '../../../../../../core/widgets/text/app_text.dart';
import '../../../../../core/widgets/nav_drawer/left_nav_drawer.dart';
import '../../../../core/utils/date_time_utils.dart';
import '../../../../core/widgets/card/app_card.dart';
import '../../../../core/widgets/list/app_gridview.dart';
import '../../../../core/widgets/list/basic_option_menu.dart';
import 'list_video_controller.dart';

class ListVideoPage extends GetView<ListVideoController> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: BaseAppBar(
        title: 'Video Page',
        leadingIcon: Row(
          children: [
            Builder(
              builder: (context) => IconButton(
                icon: Icon(Icons.menu_rounded),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            ),
          ],
        ),
      ),
      drawer: NavDrawer(),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: kcPrimaryColor,
        onPressed: () {
          Get.toNamed(Routes.addVideo);
        },
        label: Row(
          children: [
            Icon(
              Icons.add,
              color: kcWhiteColor,
            ),
            horizontalSpaceSmall,
            AppText.bodyTwo(
              'Add Videos',
              color: kcWhiteColor,
            ),
          ],
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
                  'All Video',
                  color: kcBlackColor,
                ),
                verticalSpaceRegular,
                _viewAllVideos(),
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

  Widget _viewAllVideos() {
    return Obx(() {
      var videosList = controller.allVideos.value.result ?? [];
      return videosList.length == 0
          ? const SizedBox()
          : AppGridView(
              state: controller.getAllVideosState,
              itemCount: videosList.length,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 500,
                childAspectRatio: 1,
                crossAxisSpacing: 0,
                mainAxisSpacing: 12,
              ),
              itemBuilder: (context, index) {
                var video = videosList[index];
                return AppCard(
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          BasicOptionMenu(
                            onViewPressed: () {
                              controller.onViewVideoPressed(video.id!);
                            },
                            onEditPressed: () {
                              controller.onEditVideoPressed(video.id!);
                            },
                            onDeletePressed: () {
                              controller.onDeleteVideoPressed(video.id!);
                            },
                          ),
                        ],
                      ),
                      // Expanded(
                      //     child: Row(
                      //       mainAxisAlignment: MainAxisAlignment.center,
                      //       children: [
                      //         Expanded(
                      //           child: YoutubePlayer(
                      //             controller: YoutubePlayerController.fromVideoId(
                      //               videoId: video.videoLink!,
                      //               params: const YoutubePlayerParams(showFullscreenButton: true),
                      //             ),
                      //             aspectRatio: 16 / 9,
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      // ),
                      Expanded(
                        child: Container(
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(YoutubeThumbnail(youtubeId: video.videoLink!).mq()),
                            ),
                          ),
                          child: Center(
                            child: InkWell(
                              onTap: () {
                                controller.onViewVideoPressed(video.id!);
                              },
                              child: Container(
                                padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: Colors.white60,
                                  ),
                                  child: Icon(Icons.play_arrow_rounded, color: Colors.white, size: 40,)),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText.bodyThree(readableDateMMMDDYYYY(DateTime.parse(video.createdAt!))),
                            verticalSpaceTiny,
                            Text(
                              video.title!,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: const TextStyle(
                                color: kcBlackColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
    });
  }
}
