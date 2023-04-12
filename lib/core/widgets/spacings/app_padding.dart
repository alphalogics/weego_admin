import 'package:flutter/material.dart';

class AppPadding extends StatelessWidget {
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;
  final Widget? child;
  final Function()? onTap;

  const AppPadding(
      {Key? key,
      this.padding = const EdgeInsets.all(12.0),
      this.backgroundColor,
      this.child,
      this.onTap})
      : super(key: key);

  AppPadding.allTiny(
      {Key? key,
      this.padding = const EdgeInsets.all(5),
      this.backgroundColor,
      this.child,
      this.onTap});

  AppPadding.allSmall(
      {Key? key,
      this.padding = const EdgeInsets.all(12),
      this.backgroundColor,
      this.child,
      this.onTap});

  AppPadding.allRegular(
      {Key? key,
      this.padding = const EdgeInsets.all(18),
      this.backgroundColor,
      this.child,
      this.onTap});

  AppPadding.allMedium(
      {Key? key,
      this.padding = const EdgeInsets.all(20),
      this.backgroundColor,
      this.child,
      this.onTap});

  AppPadding.allLarge(
      {Key? key,
      this.padding = const EdgeInsets.all(50),
      this.backgroundColor,
      this.child,
      this.onTap});

  AppPadding.symmetricTiny(
      {Key? key,
      this.padding = const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      this.backgroundColor,
      this.child,
      this.onTap});

  AppPadding.symmetricSmall(
      {Key? key,
      this.padding = const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      this.backgroundColor,
      this.child,
      this.onTap});

  AppPadding.symmetricRegular(
      {Key? key,
      this.padding = const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
      this.backgroundColor,
      this.child,
      this.onTap});

  AppPadding.symmetricMedium(
      {Key? key,
      this.padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      this.backgroundColor,
      this.child,
      this.onTap});

  AppPadding.symmetricLarge(
      {Key? key,
      this.padding = const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
      this.backgroundColor,
      this.child,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        color: backgroundColor,
        child: Padding(
          padding: padding!,
          child: child,
        ),
      ),
    );
  }
}
