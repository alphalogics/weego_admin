import 'package:flutter/material.dart';
import 'base_app_bar.dart';

class BaseScaffold extends StatelessWidget {
  final bool shouldIncludeScrolling;
  final bool shouldIncludePagePadding;
  final BaseAppBar? appBar;
  final Widget? body;
  final Color bodyColor;
  final Widget? drawer;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;

  const BaseScaffold(
      {Key? key,
      this.shouldIncludeScrolling = true,
      this.shouldIncludePagePadding = true,
      this.appBar,
      this.body,
      this.bodyColor = Colors.white,
      this.drawer,
      this.bottomNavigationBar,
      this.floatingActionButton});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: appBar,
      body: _buildBodyContainer(context),
      drawer: drawer,
      bottomNavigationBar: bottomNavigationBar,
      backgroundColor: Colors.white,
      floatingActionButton: floatingActionButton,
    ));
  }

  _buildBodyContainer(BuildContext context) {
    return InkWell(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Container(
        color: bodyColor,
        padding: shouldIncludePagePadding
            ? const EdgeInsets.only(left: 16.0, right: 16.0)
            : null,
        child:
            shouldIncludeScrolling ? SingleChildScrollView(child: body) : body,
      ),
    );
  }
}
