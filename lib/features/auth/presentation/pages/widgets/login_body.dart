
import 'auth_item.dart';
import 'auth_title.dart';
import 'auth_bottom.dart';
import 'social_media_button.dart';
import '../views/register_view.dart';
import 'package:flutter/material.dart';
import '../../../../../const/assets.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/utils/validators.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../../../core/widgets/custom_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    return Column(
      spacing: 15.h,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AuthTitle(title: s.loginTitle, description: s.loginSubtitle),
        SizedBox(height: 10.h),
        AuthItem(
          title: s.emailAddress,
          hint: s.emailAddressHint,
          validator: Validators.email,
          prefixIcon: Icons.email_outlined,
          keyboardType: TextInputType.emailAddress,
        ),
        AuthItem(
          title: s.password,
          hint: s.passwordHint,
          validator: Validators.password,
          prefixIcon: Icons.lock_outline,
          suffixIcon: Icons.visibility_off_outlined,
          suffixTap: () {},
          keyboardType: TextInputType.visiblePassword,
        ),
        _ForgetPassword(),
        SizedBox(height: 1.h),
        CustomButton(label: s.loginButton, onPressed: () {}),
        _OrContinueWith(),
        SocialMediaButton(
          title: s.signInWithGoogle,
          imagePath: Assets.googleLogo,
          onPressed: () {},
        ),
        SizedBox(height: 3.h),
        AuthBottom(
          text: s.alreadyHaveAnAccount,
          linkText: s.signIn,
          navigateScreen: const RegisterView(),
        ),
      ],
    );
  }
}

class _ForgetPassword extends StatelessWidget {
  const _ForgetPassword();

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: CustomText(
        text: s.forgetPassword,
        size: 16.sp,
        type: Type.overMedium,
        color: Styles.linkColor,
      ),
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
