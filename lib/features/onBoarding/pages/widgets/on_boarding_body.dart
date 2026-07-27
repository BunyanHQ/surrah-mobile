import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import '../../../../generated/l10n.dart';
import '../../models/on_boarding_model.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../../../core/widgets/custom_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingBody extends StatelessWidget {
  final PageController pageController;
  final OnBoardingModel onBoardingModel;
  const OnBoardingBody({
    super.key,
    required this.pageController,
    required this.onBoardingModel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _Skip(pageController: pageController),
        Spacer(flex: 3),
        _Image(imagePath: onBoardingModel.image),
        Spacer(flex: 2),
        _Title(title: onBoardingModel.title),
        SizedBox(height: 10.h),
        _Description(description: onBoardingModel.description),
        Spacer(flex: 1),
        _Indicator(pageController: pageController),
        SizedBox(height: 20.h),
        _Button(
          pageController: pageController,
          onBoardingModel: onBoardingModel,
        ),
        SizedBox(height: 20.h),
      ],
    );
  }
}

class _Skip extends StatelessWidget {
  final PageController pageController;
  const _Skip({required this.pageController});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.topEnd,
      child: TextButton(
        onPressed: () => pageController.jumpToPage(
          onBoardingData(context: context).length - 1,
        ),
        child: CustomText(
          text: S.of(context).skipButton,
          size: 16.sp,
          type: Type.overMedium,
        ),
      ),
    );
  }
}

class _Image extends StatelessWidget {
  final String imagePath;
  const _Image({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SvgPicture.asset(
      imagePath,
      width: size.width,
      height: size.height * 0.5,
    );
  }
}

class _Title extends StatelessWidget {
  final String title;
  const _Title({required this.title});

  @override
  Widget build(BuildContext context) {
    return CustomText(
      text: title,
      size: 20.sp,
      type: Type.header,
      textAlign: TextAlign.center,
    );
  }
}

class _Description extends StatelessWidget {
  final String description;
  const _Description({required this.description});

  @override
  Widget build(BuildContext context) {
    return CustomText(
      text: description,
      size: 16.sp,
      textAlign: TextAlign.center,
    );
  }
}

class _Indicator extends StatelessWidget {
  final PageController pageController;
  const _Indicator({required this.pageController});

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: pageController,
      count: onBoardingData(context: context).length,
      effect: ExpandingDotsEffect(
        spacing: 6,
        dotWidth: 8,
        dotHeight: 8,
        expansionFactor: 3,
        dotColor: Colors.grey.withValues(alpha: 0.5),
        activeDotColor: Theme.of(context).primaryColor,
      ),
    );
  }
}

class _Button extends StatelessWidget {
  final PageController pageController;
  final OnBoardingModel onBoardingModel;
  const _Button({required this.pageController, required this.onBoardingModel});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      margin: EdgeInsets.symmetric(horizontal: 20.w , vertical: 10.h),
      onPressed: () {
        if (onBoardingModel.id == onBoardingData(context: context).length) {
          // Nav To Home Page
        } else {
          pageController.nextPage(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        }
      },
      label: onBoardingModel.buttonTitle,
    );
  }
}
