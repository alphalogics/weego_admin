import 'package:flutter/material.dart';

import '../../constant/app_colors.dart';
import '../utils/styles.dart';

class AppText extends StatelessWidget {
  final String? text;
  final TextStyle style;
  final TextAlign alignment;

  AppText.headingOne(this.text,
      {Color color = kcBlackColor, TextAlign align = TextAlign.start})
      : style = headingOneStyle.copyWith(color: color),
        alignment = align;

  AppText.headingTwo(this.text,
      {Color color = kcBlackColor, TextAlign align = TextAlign.start})
      : style = headingTwoStyle.copyWith(color: color),
        alignment = align;

  // AppText.headingThree(this.text,
  //     {Color color = kcBlackColor, TextAlign align = TextAlign.start})
  //     : style = heading3Style.copyWith(color: color),
  //       alignment = align;

  const AppText.headline(this.text, {TextAlign align = TextAlign.start})
      : style = headlineStyle,
        alignment = align;

  AppText.subheading(this.text,
      {Color color = kcMediumGreyColor, TextAlign align = TextAlign.start})
      : style = subheadingStyle.copyWith(color: color),
        alignment = align;

  AppText.caption(this.text,
      {Color color = kcBlackColor, TextAlign align = TextAlign.start})
      : style = captionStyle.copyWith(color: color),
        alignment = align;

  AppText.bodyTwo(this.text,
      {Color color = kcBlackColor, TextAlign align = TextAlign.start})
      : style = bodyTwoStyle.copyWith(color: color),
        alignment = align;

  AppText.bodyThree(this.text,
      {Color color = kcMediumGreyColor, TextAlign align = TextAlign.start, TextOverflow textOverflow = TextOverflow.ellipsis})
      : style = bodyThreeStyle.copyWith(color: color),
        alignment = align;

  AppText.bodyFour(this.text,
      {Color color = kcMediumGreyColor, TextAlign align = TextAlign.start})
      : style = bodyFourStyle.copyWith(color: color),
        alignment = align;

  AppText.navBar(this.text,
      {Color color = kcMediumGreyColor, TextAlign align = TextAlign.start})
      : style = navBarStyle.copyWith(color: color),
        alignment = align;

  AppText.headingThree(this.text,
      {Color color = kcMediumGreyColor, TextAlign align = TextAlign.start})
      : style = headingThreeStyle.copyWith(color: color),
        alignment = align;

  AppText.headingFour(this.text,
      {Color color = kcMediumGreyColor, TextAlign align = TextAlign.start})
      : style = headingFourStyle.copyWith(color: color),
        alignment = align;

  AppText.headingFive(this.text,
      {Color color = kcBlackColor, TextAlign align = TextAlign.start})
      : style = headingFiveStyle.copyWith(color: color),
        alignment = align;

  AppText.headingSix(this.text,
      {Color color = kcMediumLightGreyColor, TextAlign align = TextAlign.start})
      : style = headingSixStyle.copyWith(color: color),
        alignment = align;

  AppText.underLineHeading(this.text,
      {Color color = kcMediumGreyColor, TextAlign align = TextAlign.start})
      : style = underLineHeadingStyle.copyWith(color: color),
        alignment = align;

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '',
      style: style,
      textAlign: alignment,
    );
  }
}
