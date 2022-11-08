import 'dart:async';

import 'package:flutter/material.dart';

import 'style.dart';

class Loader extends StatefulWidget {
  final double? height;
  final Color? color;

  const Loader({Key? key, @required this.height, this.color}) : super(key: key);

  @override
  _LoaderState createState() => _LoaderState();
}

class _LoaderState extends State<Loader> with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);
    CurvedAnimation curve =
        CurvedAnimation(parent: animationController, curve: Curves.easeOut);
    animation = Tween<double>(begin: widget.height, end: 0).animate(curve)
      ..addListener(() {
        if (mounted) {
          setState(() {});
        }
      });
    Timer(const Duration(seconds: 10), () {
      if (mounted) {
        animationController.forward();
      }
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: animation.value / 100 > 1.0 ? 1.0 : animation.value / 100,
      child: SizedBox(
        height: animation.value,
        child: Center(
          child: CircularProgressIndicator(
            strokeWidth: 2,
            valueColor:
                AlwaysStoppedAnimation<Color>(widget.color ?? blueColor),
          ),
        ),
      ),
    );
  }
}
