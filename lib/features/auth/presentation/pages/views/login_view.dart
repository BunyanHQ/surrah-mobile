import '../widgets/login_body.dart';
import 'package:flutter/material.dart';
import '../../manager/auth_cubit.dart';
import '../../manager/auth_states.dart';
import '../../../../../generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/services/snack_bar_service.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthStates>(
      listener: (context, state) {
        if (state is LoginFailure) {
          SnackBarService.failure(context: context, message: state.error);
        } else if (state is LoginSuccess) {
          SnackBarService.success(context: context, message: S.of(context).loginSuccess);
        }
      },
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: LoginBody(),
        ),
      ),
    );
  }
}
