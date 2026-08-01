import '../widgets/login_body.dart';
import 'package:flutter/material.dart';
import '../../manager/auth_cubit.dart';
import '../../manager/auth_states.dart';
import '../../../../../core/utils/nav_to.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/services/snack_bar_service.dart';
import '../../../../setup/presentation/pages/views/setup_view.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthStates>(
      listener: (context, state) {
        if (state is LoginFailure) {
          SnackBarService.failure(context: context, message: state.error);
        } else if (state is LoginSuccess) {
          if (state.profile.completeInitialSetup) {
            // Navigate to main app
          } else {
            NavTo.pushReplacement(
              context: context,
              nextPage: const SetupView(),
            );
          }
        }
      },
      child: Scaffold(body: LoginBody()),
    );
  }
}
