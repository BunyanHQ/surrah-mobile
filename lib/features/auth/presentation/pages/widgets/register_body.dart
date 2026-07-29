
import 'auth_form.dart';
import 'package:flutter/material.dart';
import '../../manager/auth_cubit.dart';
import '../../manager/auth_states.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../core/utils/nav_to.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterBody extends StatelessWidget {
  const RegisterBody({super.key});

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
          title: s.registerTitle,
          description: s.registerSubtitle,
          // Name
          firstNameController: cubit.firstNameController,
          lastNameController: cubit.lastNameController,
          // Phone
          phoneController: cubit.phoneController,
          // Email
          emailController: cubit.emailController,
          // Password
          showPassword: cubit.isRegisterPasswordVisible,
          passwordController: cubit.passwordController,
          confirmPasswordController: cubit.confirmPasswordController,
          showConfirmPassword: cubit.isRegisterConfirmPasswordVisible,
          passwordSuffixTap: () => cubit.changeRegisterPasswordVisibility(),
          confirmPasswordSuffixTap: () => cubit.changeRegisterConfirmPasswordVisibility(),
          // Button
          buttonTitle: s.registerButton,
          buttonLoading: state is RegisterLoading,
          onButtonPressed: () => cubit.register(formKey: formKey),
          // Auth Switch
          authSwitchText: s.alreadyHaveAnAccount,
          authSwitchLinkText: s.signIn,
          authSwitchOnTap: () => NavTo.pop(context),
        );
      },
    );
  }
}
