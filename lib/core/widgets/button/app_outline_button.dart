import 'package:flutter/material.dart';
import '../../constant/app_colors.dart';
import '../spacings/app_spacer.dart';
import '../text/app_text.dart';

class AppOutlineButton extends StatelessWidget {

  final Function()? onPressed;
  final String? btnText;
  final Color outlineColor;
  final Color textColor;
  final bool shouldShowIcon;
  final Widget icon;

  AppOutlineButton({
    this.onPressed,
    this.btnText,
    this.outlineColor = kcPrimaryColor,
    this.textColor = kcPrimaryColor,
    this.shouldShowIcon = false,
    this.icon = const Icon(Icons.add),
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        child: btnForeground(),
        style: ButtonStyle(
            fixedSize: MaterialStateProperty.all<Size>(
                Size.fromHeight(50)),
            foregroundColor: MaterialStateProperty.all<Color>(
                outlineColor),
            backgroundColor: MaterialStateProperty.all<Color>(
                kcWhiteColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                    side: BorderSide(color: outlineColor)))));
  }

  Widget btnForeground() {
    if (shouldShowIcon) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          horizontalSpaceSmall,
          AppText.headingFive(
            btnText,
            color: textColor,
          ),
        ],
      );
    } else {
      return AppText.headingFive(
        btnText,
        color: textColor,
      );
    }
  }
}