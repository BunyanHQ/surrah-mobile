import 'dart:async';
import '../body/splash_logo.dart';
import '../../../const/assets.dart';
import 'package:flutter/material.dart';
import '../../../core/utils/nav_to.dart';
import '../../../core/services/deep_link_service.dart';
import '../../onBoarding/pages/views/on_boarding_view.dart';
import '../../auth/presentation/pages/views/update_password_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    _handleNavigation();
  }

  Future<void> _handleNavigation() async {
    final uri = await DeepLinkService.getInitialLink();
    await Future.delayed(const Duration(seconds: 2));
    if (!mounted) return;
    if (uri != null && uri.scheme == 'surrah' && uri.host == 'reset-password') {
      NavTo.pushReplacement(
        context: context,
        nextPage: const UpdatePasswordView(),
      );
      return;
    }
    NavTo.pushReplacement(context: context, nextPage: const OnBoardingView());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff123C36),
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
