import 'dart:async';
import '../body/splash_logo.dart';
import '../../../const/assets.dart';
import 'package:flutter/material.dart';
import '../../../core/utils/nav_to.dart';
import '../../onBoarding/pages/views/on_boarding_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 2), () {
      NavTo.pushReplacement(context: context, nextPage: OnBoardingView());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff123C36),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(Assets.splashBg, fit: BoxFit.fill),
          const SplashLogo(),
        ],
      ),
    );
  }
}
