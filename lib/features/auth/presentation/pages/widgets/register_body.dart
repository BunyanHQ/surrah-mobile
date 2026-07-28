
import 'auth_item.dart';
import 'auth_title.dart';
import 'auth_bottom.dart';
import 'package:flutter/material.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../core/utils/validators.dart';
import '../../../../../core/widgets/custom_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class RegisterBody extends StatelessWidget {
  const RegisterBody({super.key});

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    return Column(
      spacing: 15.h,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AuthTitle(title: s.registerTitle, description: s.registerSubtitle),
        SizedBox(height: 10.h),
        AuthItem(
          title: s.fullName,
          hint: s.fullNameHint,
          validator: Validators.text,
          prefixIcon: Icons.person_outline,
          keyboardType: TextInputType.name,
        ),
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
          AuthItem(
            title: s.confirmPassword,
            hint: s.confirmPasswordHint,
            validator: Validators.password,
            prefixIcon: Icons.lock_outline,
            suffixIcon: Icons.visibility_off_outlined,
            suffixTap: () {},
            keyboardType: TextInputType.visiblePassword,
          ),
        SizedBox(height: 1.h),
        CustomButton(label: s.registerButton, onPressed: () {}),
        AuthBottom(
          text: s.alreadyHaveAnAccount,
          linkText: s.signIn,
        ),
      ],
    );
  }
}

