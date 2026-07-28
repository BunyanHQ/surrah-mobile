import 'auth_form.dart';
import '../views/register_view.dart';
import 'package:flutter/material.dart';
import '../../../../../const/assets.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../core/utils/nav_to.dart';
import '../../../../../core/widgets/custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    return AuthForm(
      title: s.loginTitle,
      buttonTitle: s.loginButton,
      description: s.loginSubtitle,
      forgetPasswordScreen: Placeholder(),
      emailController: TextEditingController(),
      passwordController: TextEditingController(),
      onButtonPressed: () {},
      bottomWidget: Column(
        spacing: 10.h,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [_OrContinueWith(), _GoogleButton(isLoading: false)],
      ),
      buttonLoading: false,
      bottomLinkText: s.signUp,
      bottomText: s.dontHaveAnAccount,
      bottomOnTap: () => NavTo.push(context: context, nextPage: RegisterView()),
    );
  }
}

class _OrContinueWith extends StatelessWidget {
  const _OrContinueWith();

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    var theme = Theme.of(context);
    return Row(
      spacing: 10.w,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Divider(color: theme.dividerColor, thickness: 1.h),
        ),
        CustomText(text: s.orContinueWith, size: 16.sp, type: Type.overMedium),
        Expanded(
          child: Divider(color: theme.dividerColor, thickness: 1.h),
        ),
      ],
    );
  }
}

class _GoogleButton extends StatelessWidget {
  final bool isLoading;
  const _GoogleButton({required this.isLoading});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
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
                CustomText(
                  text: S.of(context).signInWithGoogle,
                  size: 18.sp,
                  type: Type.overMedium,
                ),
                Image.asset(Assets.googleLogo, width: 28.w, height: 30.h),
              ],
            ),
    );
  }
}
