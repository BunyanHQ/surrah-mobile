import 'auth_form.dart';
import 'package:flutter/material.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../core/utils/nav_to.dart';

class RegisterBody extends StatelessWidget {
  const RegisterBody({super.key});

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    return AuthForm(
      title: s.registerTitle,
      buttonTitle: s.registerButton,
      description: s.registerSubtitle,
      nameController: TextEditingController(),
      emailController: TextEditingController(),
      passwordController: TextEditingController(),
      confirmPasswordController: TextEditingController(),
      onButtonPressed: () {},
      buttonLoading: false,
      bottomLinkText: s.signUp,
      bottomText: s.dontHaveAnAccount,
      bottomOnTap: () => NavTo.pop(context),
    );
  }
}
