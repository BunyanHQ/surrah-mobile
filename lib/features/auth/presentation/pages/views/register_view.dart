import '../../manager/auth_cubit.dart';
import '../widgets/register_body.dart';
import 'package:flutter/material.dart';
import '../../manager/auth_states.dart';
import '../../../../../generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/services/snack_bar_service.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthStates>(
      listener: (context, state) {
        if (state is RegisterFailure) {
          SnackBarService.failure(context: context, message: state.error);
        } else if (state is RegisterSuccess) {
          SnackBarService.success(
            context: context,
            message: S.of(context).registerSuccess,
          );
        }
      },
      child: Scaffold(body: RegisterBody()),
    );
  }
}
