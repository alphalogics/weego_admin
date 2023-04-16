import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weego_admin/modules/dashboard/news_management/view_news/view_news_controller.dart';
import '../../../../../core/routings/app_route.dart';
import '../../../../../core/widgets/base/base_app_bar.dart';
import '../../../../../core/widgets/base/base_scaffold.dart';
import '../../../../../core/widgets/nav_drawer/left_nav_drawer.dart';
import '../../../../core/constant/app_colors.dart';
import '../../../../core/widgets/card/app_card.dart';
import '../../../../core/widgets/spacings/app_spacer.dart';
import '../../../../core/widgets/text/app_text.dart';

class ViewNewsPage extends GetView<ViewNewsController> {

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: BaseAppBar(
        title: 'View News',
        leadingIcon: IconButton(
          onPressed: () {
            Get.offNamed(Routes.listNews);
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
                _newsDetails(),
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

  Widget _newsDetails() {
    return Obx(() {
      var news = controller.newsDetails.value.result;
      return news == null
          ? SizedBox()
          : Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppCard(
            child: Container(
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: FadeInImage(placeholder: const AssetImage('assets/other/loading.gif'), image: NetworkImage('http://uploads.ilaayn.com/${news.image}')),
            ),
          ),
          verticalSpaceRegular,
          AppText.headingFour(
            news.title,
            color: kcBlackColor,
          ),
          verticalSpaceRegular,
          AppText.bodyThree(
            news.description,
            color: kcBlackColor,
          ),
        ],
      );
    });
  }

}