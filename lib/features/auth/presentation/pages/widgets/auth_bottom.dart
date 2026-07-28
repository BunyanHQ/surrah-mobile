
import 'package:flutter/material.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../core/utils/nav_to.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthBottom extends StatelessWidget {
  final String text;
  final bool isLogin;
  final String linkText;
  final Widget? navigateScreen;
  const AuthBottom({
    super.key,
    required this.text,
    required this.linkText,
    this.isLogin = true,
    this.navigateScreen,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomText(
          text: S.of(context).alreadyHaveAnAccount,
          size: 16.sp,
          type: Type.overMedium,
        ),
        SizedBox(width: 10.w),
        GestureDetector(
          onTap: () {
            if (navigateScreen != null) {
              NavTo.push(context: context, nextPage: navigateScreen!);
            } else {
              Navigator.pop(context);
            }
          },
          child: CustomText(
            text: S.of(context).signIn,
            size: 16.sp,
            type: Type.overMedium,
            color: Styles.linkColor,
          ),
        ),
      ],
    );
  }
}
