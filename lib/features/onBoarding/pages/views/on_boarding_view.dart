import 'package:flutter/material.dart';
import '../widgets/on_boarding_body.dart';
import '../../models/on_boarding_model.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController pageController = PageController();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final data = onBoardingData(context: context);

    return Scaffold(
      body: PageView.builder(
        controller: pageController,
        itemCount: data.length,
        itemBuilder: (context, index) {
          return SafeArea(
            child: OnBoardingBody(
              onBoardingModel: data[index],
              pageController: pageController,
            ),
          );
        },
      ),
    );
  }
}
