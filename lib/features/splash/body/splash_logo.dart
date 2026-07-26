import 'dart:ui';
import '../../../core/assets.dart';
import 'package:flutter/material.dart';

class SplashLogo extends StatefulWidget {
  const SplashLogo({super.key});

  @override
  State<SplashLogo> createState() => _SplashLogoState();
}

class _SplashLogoState extends State<SplashLogo>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;

  late final Animation<double> fade;
  late final Animation<double> scale;
  late final Animation<double> glow;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1700),
    );

    fade = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.0, .35, curve: Curves.easeOut),
      ),
    );

    // Zoom then pulse
    scale = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween(
          begin: 1.1,
          end: 1.35,
        ).chain(CurveTween(curve: Curves.easeOutBack)),
        weight: 70,
      ),

      TweenSequenceItem(
        tween: Tween(
          begin: 1.35,
          end: 1.25,
        ).chain(CurveTween(curve: Curves.easeInOut)),
        weight: 15,
      ),

      TweenSequenceItem(
        tween: Tween(
          begin: 1.25,
          end: 1.35,
        ).chain(CurveTween(curve: Curves.easeInOut)),
        weight: 15,
      ),
    ]).animate(controller);

    glow = Tween<double>(begin: 0.0, end: 30.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(.45, 1.0, curve: Curves.easeOut),
      ),
    );

    controller.forward().then((_) {
      // infinite pulse after finish
      controller.repeat(
        reverse: true,
        period: const Duration(milliseconds: 2000),
      );
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          return FadeTransition(
            opacity: fade,

            child: ScaleTransition(
              scale: scale,

              child: Stack(
                alignment: Alignment.center,

                children: [
                  // Yellow glow
                  ImageFiltered(
                    imageFilter: ImageFilter.blur(
                      sigmaX: glow.value,
                      sigmaY: glow.value,
                    ),

                    child: ColorFiltered(
                      colorFilter: ColorFilter.mode(
                        const Color(0xFFE5B84A),
                        BlendMode.srcATop,
                      ),

                      child: Opacity(
                        opacity: .4,

                        child: Transform.scale(scale: 1.18, child: child),
                      ),
                    ),
                  ),

                  // Main logo
                  child!,
                ],
              ),
            ),
          );
        },

        child: Image.asset(Assets.splashLogo, width: MediaQuery.of(context).size.width * 0.25),
      ),
    );
  }
}
