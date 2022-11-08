import 'package:flutter/material.dart';

import 'style.dart';

class MyCustomPage extends StatelessWidget {
  final double? elevation;
  final Color? scaffoldBackgroundColor;
  final Color? appBarColor;
  final bool? boolLeading;
  final bool extendBodyBehindAppBar;
  final bool isAppBar;
  final bool? centerTitle;
  final Widget? leading;
  final Widget? drawer;
  final Function? onTap;
  final String? title;
  final Widget? titleWidget;
  final List<Widget>? actionList;
  final Widget? body;
  final Widget? bottomBar;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Key? scaffoldKey;

  const MyCustomPage(
      {Key? key,
      this.boolLeading,
      this.isAppBar = true,
      this.extendBodyBehindAppBar = false,
      this.elevation,
      this.scaffoldBackgroundColor,
      this.appBarColor,
      this.leading,
      this.drawer,
      this.centerTitle,
      this.onTap,
      this.title,
      this.titleWidget,
      this.actionList,
      this.bottomBar,
      this.floatingActionButton,
      this.floatingActionButtonLocation,
      this.body,
      this.scaffoldKey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer,
      key: scaffoldKey,
      backgroundColor: scaffoldBackgroundColor ?? offWhiteColor,
      extendBodyBehindAppBar: extendBodyBehindAppBar,
      appBar: isAppBar
          ? AppBar(
              backgroundColor: appBarColor,
              elevation: elevation,
              automaticallyImplyLeading: boolLeading ?? true,
              leading: leading,
              iconTheme: IconThemeData(
                  color: extendBodyBehindAppBar ? blackColor : primaryColor),
              title: title != null
                  ? Text(title!, style: const TextStyle(fontSize: 17))
                  : titleWidget,
              centerTitle: centerTitle ?? false,
              actions: actionList,
            )
          : null,
      body: body,
      bottomNavigationBar: bottomBar,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
    );
  }
}
