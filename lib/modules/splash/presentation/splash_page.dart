import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:weego_admin/modules/splash/presentation/splash_controller.dart';
import '../../../core/constant/app_colors.dart';
import '../../../core/widgets/base/base_scaffold.dart';
import '../../../core/widgets/spacings/app_spacer.dart';

class SplashPage extends GetView<SplashController> {

  @override
  Widget build(BuildContext context) {
    controller.startTimer();

    return BaseScaffold(
      shouldIncludeScrolling: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Column(
            children: [
              Image.asset('assets/branding/logo.png', width: 200,),
              verticalSpaceSmall,
              const SpinKitPouringHourGlassRefined(color: kcMediumLightGreyColor, size: 50,),
            ],
          )),
        ],
      ),
    );
  }
}
