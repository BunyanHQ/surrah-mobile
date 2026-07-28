import 'package:flutter/material.dart';
import '../../../../../core/utils/nav_to.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../core/utils/validators.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../../../core/widgets/custom_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';

class AuthForm extends StatelessWidget {
  // Title
  final String title;
  final String description;

  // Login
  final bool? showPassword;
  final Function()? passwordSuffixTap;
  final TextEditingController? emailController;
  final TextEditingController? passwordController;
  final Widget? forgetPasswordScreen;

  // Register
  final bool? showConfirmPassword;
  final Function()? confirmPasswordSuffixTap;
  final TextEditingController? nameController;
  final TextEditingController? confirmPasswordController;

  // Button
  final bool buttonLoading;
  final String buttonTitle;
  final VoidCallback onButtonPressed;

  // Bottom
  final Widget? bottomWidget;
  final String? bottomText;
  final String? bottomLinkText;
  final VoidCallback? bottomOnTap;

  const AuthForm({
    super.key,
    required this.title,
    required this.description,
    this.emailController,
    this.showPassword,
    this.passwordSuffixTap,
    this.passwordController,
    this.nameController,
    this.showConfirmPassword,
    this.confirmPasswordSuffixTap,
    this.confirmPasswordController,
    this.forgetPasswordScreen,
    required this.buttonTitle,
    required this.onButtonPressed,
    required this.buttonLoading,
    this.bottomWidget,
    this.bottomText,
    this.bottomLinkText,
    this.bottomOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        spacing: 11.h,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          _Title(title: title, description: description),
          SizedBox(height: 5.h),
          if (nameController != null) _Name(controller: nameController!),
          if (emailController != null) _Email(controller: emailController!),
          if (passwordController != null)
            _Password(
              controller: passwordController!,
              showPassword: showPassword ?? false,
              suffixTap: passwordSuffixTap ?? () {},
            ),
          if (forgetPasswordScreen != null)
            _ForgetPassword(forgetPasswordScreen: forgetPasswordScreen!),
          if (confirmPasswordController != null)
            _Password(
              passwordController: passwordController,
              controller: confirmPasswordController!,
              showPassword: showConfirmPassword ?? false,
              suffixTap: confirmPasswordSuffixTap ?? () {},
            ),
          Padding(
            padding: EdgeInsets.only(
              top: forgetPasswordScreen != null ? 5.h : 15.h,
              bottom: 10.h,
            ),
            child: CustomButton(
              isLoading: buttonLoading,
              label: buttonTitle,
              onPressed: onButtonPressed,
            ),
          ),
          ?bottomWidget,
          SizedBox(height: 10.h),
          if (bottomText != null && bottomLinkText != null && bottomOnTap != null)
            _Bottom(
              text: bottomText!,
              linkText: bottomLinkText!,
              onTap: bottomOnTap!,
            ),
        ],
      )
    );
  }
}

class _Title extends StatelessWidget {
  final String title;
  final String description;
  const _Title({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomText(
          height: 1.9,
          text: title,
          size: 30.sp,
          type: Type.header,
          textAlign: TextAlign.center,
        ),
        CustomText(
          size: 20.sp,
          maxLines: 3,
          text: description,
          type: Type.medium,
          textAlign: TextAlign.center,
          opacity: FontOpacity.medium,
        ),
      ],
    );
  }
}

class _Item extends StatelessWidget {
  final String title;
  final String hint;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final Function()? suffixTap;
  final TextInputType keyboardType;
  final Function(String?) validator;
  final TextEditingController controller;
  final TextEditingController? passwordController;
  const _Item({
    required this.title,
    required this.hint,
    required this.prefixIcon,
    this.suffixIcon,
    this.suffixTap,
    required this.keyboardType,
    required this.validator,
    required this.controller,
    this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(text: title, size: 16.sp, type: Type.overMedium),
        SizedBox(height: 10.h),
        CustomTextFormField(
          hintText: hint,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          suffixTap: suffixTap,
          controller: controller,
          keyboardType: keyboardType,
          validator: (value) => validator(value),
          passwordController: passwordController,
        ),
      ],
    );
  }
}

class _Name extends StatelessWidget {
  final TextEditingController controller;
  const _Name({required this.controller});

  @override
  Widget build(BuildContext context) {
    return _Item(
      controller: controller,
      validator: Validators.text,
      title: S.of(context).fullName,
      hint: S.of(context).fullNameHint,
      prefixIcon: Icons.person_outline,
      keyboardType: TextInputType.name,
    );
  }
}

class _Email extends StatelessWidget {
  final TextEditingController controller;
  const _Email({required this.controller});

  @override
  Widget build(BuildContext context) {
    return _Item(
      controller: controller,
      validator: Validators.email,
      prefixIcon: Icons.email_outlined,
      title: S.of(context).emailAddress,
      hint: S.of(context).emailAddressHint,
      keyboardType: TextInputType.emailAddress,
    );
  }
}

class _Password extends StatelessWidget {
  final bool showPassword;
  final TextEditingController controller;
  final TextEditingController? passwordController;
  final Function() suffixTap;
  const _Password({
    required this.showPassword,
    required this.controller,
    this.passwordController,
    required this.suffixTap,
  });

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    return _Item(
      controller: controller,
      prefixIcon: Icons.lock_outline,
      validator: Validators.password,
      suffixIcon: showPassword ? Icons.visibility : Icons.visibility_off,
      suffixTap: suffixTap,
      hint: S.of(context).passwordHint,
      passwordController: passwordController,
      keyboardType: TextInputType.visiblePassword,
      title: passwordController != null ? s.confirmPassword : s.password,
    );
  }
}

class _ForgetPassword extends StatelessWidget {
  final Widget forgetPasswordScreen;
  const _ForgetPassword({required this.forgetPasswordScreen});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: GestureDetector(
        onTap: () =>
            NavTo.push(context: context, nextPage: forgetPasswordScreen),
        child: Padding(
          padding: EdgeInsets.only(top: 8.h, bottom: 4.h),
          child: CustomText(
            text: S.of(context).forgetPassword,
            size: 16.sp,
            type: Type.overMedium,
            color: Styles.linkColor,
          ),
        ),
      ),
    );
  }
}

class _Bottom extends StatelessWidget {
  final String text;
  final String linkText;
  final Function() onTap;
  const _Bottom({
    required this.text,
    required this.linkText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomText(text: text, size: 16.sp, type: Type.overMedium),
        SizedBox(width: 10.w),
        GestureDetector(
          onTap: onTap,
          child: CustomText(
            text: linkText,
            size: 16.sp,
            type: Type.overMedium,
            color: Styles.linkColor,
          ),
        ),
      ],
    );
  }
}
