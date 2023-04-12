import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constant/app_colors.dart';
import '../../../../core/routings/app_route.dart';
import '../../../../core/utils/date_time_utils.dart';
import '../../../../core/widgets/base/base_app_bar.dart';
import '../../../../core/widgets/base/base_scaffold.dart';
import '../../../../core/widgets/card/app_card.dart';
import '../../../../core/widgets/list/app_gridview.dart';
import '../../../../core/widgets/list/basic_option_menu.dart';
import '../../../../core/widgets/nav_drawer/left_nav_drawer.dart';
import '../../../../core/widgets/spacings/app_spacer.dart';
import '../../../../core/widgets/text/app_text.dart';
import 'list_news_conreoller.dart';

class ListNewsPage extends GetView<ListNewsController> {

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: BaseAppBar(
        title: 'News Page',
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
          Get.toNamed(Routes.addNews);
        },
        label: Row(
          children: [
            Icon(
              Icons.add,
              color: kcWhiteColor,
            ),
            horizontalSpaceSmall,
            AppText.bodyTwo(
              'Add News',
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
                  'All News',
                  color: kcBlackColor,
                ),
                verticalSpaceRegular,
                _viewAllNews(),
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

  Widget _viewAllNews() {
    return Obx(() {
      var newsList = controller.allNews.value.result ?? [];
      return newsList.length == 0
          ? const SizedBox()
          : AppGridView(
        state: controller.getAllNewsState,
        itemCount: newsList.length,
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 500,
          childAspectRatio: 1,
          crossAxisSpacing: 0,
          mainAxisSpacing: 12,
        ),
        itemBuilder: (context, index) {
          var news = newsList[index];
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
                        controller.onViewNewsPressed(news.id!);
                      },
                      onEditPressed: () {
                        controller.onEditNewsPressed(news.id!);
                      },
                      onDeletePressed: () {
                        controller.onDeleteNewsPressed(news.id!);
                      },
                    ),
                  ],
                ),
                Expanded(
                    flex: 4,
                    child: FadeInImage(placeholder: const AssetImage('assets/other/loading.gif'), image: NetworkImage('http://uploads.ilaayn.com/${news.image}'), fit: BoxFit.cover),),
                // Expanded(
                //   flex: 4,
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       Container(
                //         decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(10),
                //         ),
                //         child: FadeInImage(placeholder: const AssetImage('assets/other/loading.gif'), image: NetworkImage('http://uploads.ilaayn.com/${news.image}'), fit: BoxFit.cover),
                //       ),
                //     ],
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        news.title!,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: const TextStyle(
                          color: kcBlackColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      verticalSpaceTiny,
                      Text(
                        news.description!,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        style: const TextStyle(
                          color: kcMediumGreyColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
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
