import '../../../const/assets.dart';
import '../../../generated/l10n.dart';
import 'package:flutter/material.dart';

class OnBoardingModel {
  final int id;
  final String image;
  final String title;
  final String description;
  final String buttonTitle;
  OnBoardingModel({
    required this.id,
    required this.image,
    required this.title,
    required this.description,
    required this.buttonTitle,
  });
}

List<OnBoardingModel> onBoardingData({required BuildContext context}) => [
  OnBoardingModel(
    id: 1,
    image: Assets.onboarding1,
    title: S.of(context).onBoardingTitle1,
    description: S.of(context).onBoardingBody1,
    buttonTitle: S.of(context).nextButton,
  ),
  OnBoardingModel(
    id: 2,
    image: Assets.onboarding2,
    title: S.of(context).onBoardingTitle2,
    description: S.of(context).onBoardingBody2,
    buttonTitle: S.of(context).nextButton,
  ),
  OnBoardingModel(
    id: 3,
    image: Assets.onboarding3,
    title: S.of(context).onBoardingTitle3,
    description: S.of(context).onBoardingBody3,
    buttonTitle: S.of(context).nextButton,
  ),
  OnBoardingModel(
    id: 4,
    image: Assets.onboarding4,
    title: S.of(context).onBoardingTitle4,
    description: S.of(context).onBoardingBody4,
    buttonTitle: S.of(context).getStartedButton,
  ),
];
