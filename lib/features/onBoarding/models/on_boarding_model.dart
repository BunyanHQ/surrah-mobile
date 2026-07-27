import '../../../core/assets.dart';
import '../../../generated/l10n.dart';
import 'package:flutter/material.dart';

class OnBoardingModel {
  final String image;
  final String title;
  final String description;
  OnBoardingModel({
    required this.image,
    required this.title,
    required this.description,
  });
}

List<OnBoardingModel> onBoardingData({required BuildContext context}) => [
  OnBoardingModel(
    image: Assets.onboarding1,
    title: S.of(context).onBoardingTitle1,
    description: S.of(context).onBoardingBody1,
  ),
  OnBoardingModel(
    image: Assets.onboarding2,
    title: S.of(context).onBoardingTitle2,
    description: S.of(context).onBoardingBody2,
  ),
  OnBoardingModel(
    image: Assets.onboarding3,
    title: S.of(context).onBoardingTitle3,
    description: S.of(context).onBoardingBody3,
  ),
  OnBoardingModel(
    image: Assets.onboarding4,
    title: S.of(context).onBoardingTitle4,
    description: S.of(context).onBoardingBody4,
  ),
];
