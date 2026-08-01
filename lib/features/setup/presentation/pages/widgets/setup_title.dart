import 'package:flutter/material.dart';
import '../../../../../core/widgets/custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SetupTitle extends StatelessWidget {
  final String image;
  final String title;
  final bool showBackIcon;
  final String subTitle;
  const SetupTitle({
    super.key,
    required this.image,
    required this.title,
    this.showBackIcon = true,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.05,
        ),
        Image.asset(image, width: width * 0.8),
        SizedBox(height: 15.h),
        CustomText(
          text: title,
          size: 30.sp,
          type: Type.header,
          textAlign: TextAlign.center,
        ),
        CustomText(
          size: 18.sp,
          maxLines: 3,
          text: subTitle,
          type: Type.overMedium,
          textAlign: TextAlign.center,
          opacity: FontOpacity.medium,
        ),
      ],
    );
  }
}
