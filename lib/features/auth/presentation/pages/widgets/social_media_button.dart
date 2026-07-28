import 'package:flutter/material.dart';
import '../../../../../core/widgets/custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SocialMediaButton extends StatelessWidget {
  final String title;
  final bool isLoading;
  final String imagePath;
  final VoidCallback onPressed;
  const SocialMediaButton({
    super.key,
    required this.title,
    this.isLoading = false,
    required this.imagePath,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.surface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
      ),
      child: isLoading
          ? CircularProgressIndicator()
          : Row(
              spacing: 8.w,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(text: title, size: 18.sp, type: Type.overMedium),
                Image.asset(imagePath, width: 28.w, height: 30.h),
              ],
            ),
    );
  }
}
