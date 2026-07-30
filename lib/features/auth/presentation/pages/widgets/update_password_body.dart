import 'auth_form.dart';
import '../views/login_view.dart';
import 'package:flutter/material.dart';
import '../../manager/auth_cubit.dart';
import '../../manager/auth_states.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../core/utils/nav_to.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../../../core/widgets/custom_back_icon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpdatePasswordBody extends StatelessWidget {
  const UpdatePasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    var formKey = GlobalKey<FormState>();
    return BlocBuilder<AuthCubit, AuthStates>(
      builder: (context, state) {
        var cubit = AuthCubit.get(context);
        return AuthForm(
          formKey: formKey,
          // Title
          title: s.updatePasswordTitle,
          description: s.updatePasswordSubtitle,
          // Password
          showPassword: cubit.isLoginPasswordVisible,
          passwordController: cubit.passwordController,
          passwordSuffixTap: () => cubit.changeLoginPasswordVisibility(),
          // Confirm Password
          showConfirmPassword: cubit.isRegisterConfirmPasswordVisible,
          confirmPasswordController: cubit.confirmPasswordController,
          confirmPasswordSuffixTap: () =>
              cubit.changeRegisterConfirmPasswordVisibility(),
          // Button
          buttonTitle: s.updatePasswordButton,
          buttonLoading: state is UpdatePasswordLoading,
          onButtonPressed: () => cubit.updatePassword(formKey: formKey),
          // Actions
          actions: Column(children: [const _GoToHome()]),
        );
      },
    );
  }
}

class _GoToHome extends StatelessWidget {
  const _GoToHome();

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).primaryColor;
    return GestureDetector(
      onTap: () =>
          NavTo.pushReplacement(context: context, nextPage: LoginView()),
      child: Row(
        spacing: 10.w,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomText(
            text: S.of(context).goBackToLogin,
            size: 17.sp,
            type: Type.overMedium,
            color: color,
          ),
          CustomBackIcon(
            onTap: () =>
                NavTo.pushReplacement(context: context, nextPage: LoginView()),
          ),
        ],
      ),
    );
  }
}
