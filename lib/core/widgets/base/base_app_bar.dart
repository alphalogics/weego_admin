
import 'package:flutter/material.dart';

import '../../constant/app_colors.dart';

class BaseAppBar extends StatelessWidget with PreferredSizeWidget {
  final String? title;
  final Widget? titleWidget;
  final Color? titleColor;
  final Widget? leadingIcon;
  final List<Widget>? actions;
  final bool enableElevation;
  final Color? backgroundColor;
  final IconThemeData? iconTheme;

  @override
  final Size preferredSize;

  BaseAppBar(
      {Key? key,
      this.title,
      this.titleWidget,
      this.titleColor,
      this.actions,
      this.leadingIcon,
      this.enableElevation = true,
      this.backgroundColor = Colors.white,
      this.iconTheme})
      : preferredSize = Size.fromHeight(AppBar().preferredSize.height),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget? title;
    if (this.title != null) {
      title = Text(this.title ?? '',
          style: TextStyle(color: titleColor ?? Colors.black, fontSize: 16));
    }

    if (titleWidget != null) {
      title = titleWidget;
    }

    return AppBar(
      leading: leadingIcon,
      actions: actions,
      iconTheme: iconTheme ?? IconThemeData(color: kcBlackColor),
      centerTitle: false,
      title: title,
      backgroundColor: backgroundColor ?? kcAppBarColor,
      elevation: enableElevation ? 2 : 0,
    );
  }
}
