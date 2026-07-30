import 'login_view.dart';
import 'package:flutter/material.dart';
import '../../manager/auth_cubit.dart';
import '../../manager/auth_states.dart';
import '../../../../../generated/l10n.dart';
import '../widgets/update_password_body.dart';
import '../../../../../core/utils/nav_to.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/services/snack_bar_service.dart';

class UpdatePasswordView extends StatelessWidget {
  const UpdatePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthStates>(
      listener: (context, state) {
        if (state is UpdatePasswordFailure) {
          SnackBarService.failure(context: context, message: state.error);
        } else if (state is UpdatePasswordSuccess) {
          NavTo.pushReplacement(context: context, nextPage: const LoginView());
          SnackBarService.success(
            context: context,
            message: S.of(context).updatePasswordSuccess,
          );
        }
      },
      child: Scaffold(body: UpdatePasswordBody()),
    );
  }
}
