import 'dart:async';

import 'package:flutter/material.dart';

import '../Utils/common.dart';
import 'home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    timing();
  }

  timing() {
    Timer(const Duration(seconds: 4), () => checkFirstSeen());
  }

  Future checkFirstSeen() async {
    navigationRemoveUntil(context, const HomePage());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          alignment: Alignment.center,
          child: Image.asset(
            "Assets/Images/smelogo.png",
          ),
        ),
      ),
    );
  }
}
