import '../views/register_view.dart';
import 'package:flutter/material.dart';
import '../../manager/auth_cubit.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../core/utils/nav_to.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/utils/validators.dart';
import '../../../../../core/di/server_locator.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../../../core/widgets/custom_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';

class AuthForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  // Title
  final String title;
  final String description;

  // Top
  final Widget? topWidget;

  // Login
  final bool? showPassword;
  final Function()? passwordSuffixTap;
  final TextEditingController? emailController;
  final TextEditingController? passwordController;
  final Widget? forgetPasswordScreen;

  // Register
  final bool? showConfirmPassword;
  final Function()? confirmPasswordSuffixTap;
  final TextEditingController? firstNameController;
  final TextEditingController? lastNameController;
  final TextEditingController? phoneController;
  final TextEditingController? confirmPasswordController;

  // Button
  final bool buttonLoading;
  final String buttonTitle;
  final VoidCallback onButtonPressed;

  // Action
  final Widget? actions;

  // Auth Switch
  final String? authSwitchText;
  final String? authSwitchLinkText;
  final VoidCallback? authSwitchOnTap;

  const AuthForm({
    super.key,
    required this.formKey,
    this.topWidget,
    required this.title,
    required this.description,
    this.emailController,
    this.showPassword,
    this.passwordSuffixTap,
    this.passwordController,
    this.firstNameController,
    this.lastNameController,
    this.phoneController,
    this.showConfirmPassword,
    this.confirmPasswordSuffixTap,
    this.confirmPasswordController,
    this.forgetPasswordScreen,
    required this.buttonTitle,
    required this.onButtonPressed,
    required this.buttonLoading,
    this.actions,
    this.authSwitchText,
    this.authSwitchLinkText,
    this.authSwitchOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
          spacing: 11.h,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (topWidget != null) SafeArea(child: topWidget!),
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            _Title(title: title, description: description),
            SizedBox(height: 5.h),
            if (firstNameController != null && lastNameController != null)
              _Name(
                firstNameController: firstNameController!,
                lastNameController: lastNameController!,
              ),
            if (phoneController != null)
              _PhoneNumber(controller: phoneController!),
            if (emailController != null) _Email(controller: emailController!),
            if (passwordController != null)
              _Password(
                isLogin: forgetPasswordScreen != null,
                controller: passwordController!,
                showPassword: showPassword ?? false,
                suffixTap: passwordSuffixTap ?? () {},
              ),
            if (forgetPasswordScreen != null)
              _ForgetPassword(forgetPasswordScreen: forgetPasswordScreen!),
            if (confirmPasswordController != null)
              _Password(
                isLogin: forgetPasswordScreen != null,
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
            ?actions,
            if (authSwitchText != null && authSwitchLinkText != null)
              _AuthSwitchPrompt(
                text: authSwitchText!,
                linkText: authSwitchLinkText!,
                onTap: authSwitchOnTap,
              ),
          ],
        ),
      ),
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
          size: 18.sp,
          maxLines: 3,
          text: description,
          type: Type.overMedium,
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
  final bool? obscureText;
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
    this.obscureText,
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
          obscureText: obscureText ?? false,
          hintText: hint,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          controller: controller,
          onSuffixIconTap: suffixTap,
          keyboardType: keyboardType,
          validator: (value) => validator(value),
          // passwordController: passwordController,
        ),
      ],
    );
  }
}

class _Name extends StatelessWidget {
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  const _Name({
    required this.firstNameController,
    required this.lastNameController,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 12.w,
      children: [
        Expanded(
          child: _Item(
            controller: firstNameController,
            validator: Validators.text,
            title: S.of(context).firstName,
            hint: S.of(context).firstNameHint,
            prefixIcon: Icons.person_outline,
            keyboardType: TextInputType.name,
          ),
        ),
        Expanded(
          child: _Item(
            controller: lastNameController,
            validator: Validators.text,
            title: S.of(context).lastName,
            hint: S.of(context).lastNameHint,
            prefixIcon: Icons.person_outline,
            keyboardType: TextInputType.name,
          ),
        ),
      ],
    );
  }
}

class _PhoneNumber extends StatelessWidget {
  final TextEditingController controller;
  const _PhoneNumber({required this.controller});

  @override
  Widget build(BuildContext context) {
    return _Item(
      controller: controller,
      validator: Validators.phone,
      title: S.of(context).phoneNumber,
      hint: S.of(context).phoneNumberHint,
      prefixIcon: Icons.phone_outlined,
      keyboardType: TextInputType.phone,
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
  final bool isLogin;
  final bool showPassword;
  final TextEditingController controller;
  final TextEditingController? passwordController;
  final Function() suffixTap;
  const _Password({
    required this.isLogin,
    required this.showPassword,
    required this.controller,
    this.passwordController,
    required this.suffixTap,
  });

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    return _Item(
      obscureText: !showPassword,
      controller: controller,
      prefixIcon: Icons.lock_outline,
      validator: isLogin
          ? Validators.text
          : passwordController == null
          ? Validators.password
          : (value) =>
                Validators.confirmPassword(value, passwordController!.text),

      suffixIcon: showPassword ? Icons.visibility_off : Icons.visibility,
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

class _AuthSwitchPrompt extends StatelessWidget {
  final String text;
  final String linkText;
  final Function()? onTap;
  const _AuthSwitchPrompt({
    required this.text,
    required this.linkText,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomText(text: text, size: 16.sp, type: Type.overMedium),
        TextButton(
          onPressed: () {
            if (onTap != null) {
              onTap!();
            } else {
              NavTo.push(context: context, nextPage: RegisterView());
            }
            getIt<AuthCubit>().clearControllers();
          },
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
