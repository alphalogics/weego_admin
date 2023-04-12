
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/app_colors.dart';
import '../../routings/app_route.dart';
import '../spacings/app_spacer.dart';
import '../text/app_text.dart';

class BasicOptionMenu extends StatelessWidget {

  final Function()? onViewPressed;
  final Function()? onEditPressed;
  final Function()? onDeletePressed;

  BasicOptionMenu({
    this.onViewPressed,
    this.onEditPressed,
    this.onDeletePressed,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        padding: EdgeInsets.zero,
        position: PopupMenuPosition.under,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        icon: Icon(Icons.keyboard_control_rounded),
        itemBuilder: (context) {
          return [
            PopupMenuItem(
              child: InkWell(
                onTap: onViewPressed,
                child: Row(
                  children: [
                    const Icon(
                      Icons.remove_red_eye_rounded,
                      color: kcBlackColor,
                    ),
                    horizontalSpaceSmall,
                    AppText.bodyThree(
                      'View',
                      color: kcBlackColor,
                    )
                  ],
                ),
              ),
            ),
            PopupMenuItem(
              child: InkWell(
                onTap: onEditPressed,
                child: Row(
                  children: [
                    const Icon(
                      Icons.edit_note,
                      color: kcBlackColor,
                    ),
                    horizontalSpaceSmall,
                    AppText.bodyThree(
                      'Edit',
                      color: kcBlackColor,
                    )
                  ],
                ),
              ),
            ),
            PopupMenuItem(
              value: 'Delete',
              child: InkWell(
                onTap: onDeletePressed,
                child: Row(
                  children: [
                    const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    horizontalSpaceSmall,
                    AppText.bodyThree(
                      'Delete',
                      color: Colors.red,
                    )
                  ],
                ),
              ),
            ),
          ];
        },
      // onSelected: (value) {
      //     if(value == 'View') {
      //       // onViewPressed;
      //       Get.toNamed(Routes.editVideo);
      //     }
      //
      //     if(value == 'Edit') {
      //       onEditPressed;
      //     }
      //
      //
      //
      // },

        );
  }
}