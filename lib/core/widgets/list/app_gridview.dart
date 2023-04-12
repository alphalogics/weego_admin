import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../api/base_state.dart';
import '../../constant/app_colors.dart';
import '../text/app_text.dart';

class AppGridView extends StatelessWidget {
  final String? initialStateMessage;
  final String? loadingMessage;
  final String? errorMessage;
  final Color textColor;
  final BaseState state;
  final Axis scrollDirection;
  final int itemCount;
  final EdgeInsetsGeometry? padding;
  final SliverGridDelegate gridDelegate;
  final bool shrinkWrap;
  final Widget Function(BuildContext context, int index) itemBuilder;

  const AppGridView({Key? key,
    this.initialStateMessage = 'Loading...',
    this.loadingMessage = 'Loading...',
    this.errorMessage = 'No Records Found',
    this.textColor = kcBlackColor,
    this.scrollDirection = Axis.horizontal,
    required this.state,
    required this.itemCount,
    this.padding,
    required this.gridDelegate,
    this.shrinkWrap = false,
    required this.itemBuilder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        child: _getView(),
      );
    });
  }

  Widget _getView() {
    if (state.isInitial.value) {
      return Center(
          child: AppText.bodyThree(
            initialStateMessage,
            color: textColor,
          ));
    }

    if (state.isLoading.value) {
      return Center(
          child: AppText.bodyThree(
            loadingMessage,
            color: textColor,
          ));
    }

    if (state.isError.value) {
      return Center(
          child: AppText.bodyThree(
            state.message.value,
            color: textColor,
          ));
    }

    if (itemCount == 0) {
      return Center(
          child: AppText.bodyThree(
            errorMessage,
            color: textColor,
          ));
    }

    return GridView.builder(
        padding: padding,
        gridDelegate: gridDelegate,
        shrinkWrap: shrinkWrap,
        itemCount: itemCount,
        itemBuilder: itemBuilder);
  }
}
