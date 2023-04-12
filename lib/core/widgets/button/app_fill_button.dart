import 'package:flutter/material.dart';

import '../../constant/app_colors.dart';
import '../spacings/app_spacer.dart';
import '../text/app_text.dart';

class AppFilledButton extends StatelessWidget {

  final Function()? onPressed;
  final String? btnText;
  final Color color;
  final Color txtColor;
  final bool shouldShowIcon;
  final IconData icon;
  final bool isRounded;

  AppFilledButton({
    this.onPressed,
    this.btnText,
    this.color = kcPrimaryColor,
    this.txtColor = kcWhiteColor,
    this.shouldShowIcon = false,
    this.isRounded = true,
    this.icon = Icons.add,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        child: btnForeground(),
        style: ButtonStyle(
            fixedSize: MaterialStateProperty.all<Size>(Size.fromHeight(50)),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            backgroundColor: MaterialStateProperty.all<Color>(color),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(isRounded ? 100 : 8),
                    side: BorderSide(color: color)))));
  }

  Widget btnForeground() {
    if (shouldShowIcon) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon),
          horizontalSpaceSmall,
          AppText.headingFive(
            btnText,
            color: txtColor,
          ),
        ],
      );
    } else {
      return AppText.headingFive(
        btnText,
        color: txtColor,
      );
    }
  }
}
