import 'package:flutter/material.dart';

const Widget horizontalSpaceTiny = SizedBox(width: 5);
const Widget horizontalSpaceSmall = SizedBox(width: 12);
const Widget horizontalSpaceRegular = SizedBox(width: 18);
const Widget horizontalSpaceMedium = SizedBox(width: 25);
const Widget horizontalSpaceLarge = SizedBox(width: 50);

const Widget verticalSpaceTiny = SizedBox(height: 5);
const Widget verticalSpaceSmall = SizedBox(height: 12);
const Widget verticalSpaceRegular = SizedBox(height: 18);
const Widget verticalSpaceMedium = SizedBox(height: 20);
const Widget verticalSpaceLarge = SizedBox(height: 50);

// Screen Size helpers
double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;

double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;

double screenHeightPercentage(BuildContext context, {double percentage = 1}) =>
    screenHeight(context) * percentage;

double screenWidthPercentage(BuildContext context, {double percentage = 1}) =>
    screenWidth(context) * percentage;
