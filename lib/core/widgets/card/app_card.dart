import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppCard extends StatelessWidget {

  final Widget? child;
  final Color bgColor;
  final EdgeInsets? padding;

  const AppCard({Key? key, required this.child, this.bgColor = Colors.white, this.padding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
        margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey[300]!)
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.grey.withOpacity(0.5),
          //     spreadRadius: 2,
          //     blurRadius: 4,
          //     offset: Offset(0, 1),
          //   ),
          // ],
        ),
        child: child);
  }
}
