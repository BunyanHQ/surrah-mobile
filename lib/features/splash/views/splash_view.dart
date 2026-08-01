
import '../body/splash_logo.dart';
import '../../../const/assets.dart';
import 'package:flutter/material.dart';
import '../../../core/utils/nav_to.dart';
import '../../../core/di/server_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../auth/presentation/manager/auth_cubit.dart';
import '../../auth/presentation/manager/auth_states.dart';
import '../../onBoarding/pages/views/on_boarding_view.dart';
import '../../setup/presentation/pages/views/setup_view.dart';
import '../../auth/presentation/pages/views/update_password_view.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<AuthCubit>()..autoLogin(),
      child: BlocListener<AuthCubit, AuthStates>(
        listener: (context, state) {
          if (state is AutoLoginFailure) {
            NavTo.pushReplacement(
              context: context,
              nextPage: const OnBoardingView(),
            );
          }
          if (state is AutoLoginSuccess) {
            if (state.isProfileComplete) {
              NavTo.pushReplacement(
                context: context,
                nextPage: const OnBoardingView(),
              );
            } else {
              NavTo.pushReplacement(
                context: context,
                nextPage: const SetupView(),
              );
            }
          }
          if (state is ForgetPasswordDeepLink) {
            NavTo.pushReplacement(
              context: context,
              nextPage: const UpdatePasswordView(),
            );
          }
          // Handle state changes
        },
        child: Scaffold(
          backgroundColor: const Color(0xff123C36),
          body: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(Assets.splashBg, fit: BoxFit.fill),
              const SplashLogo(),
            ],
          ),
        ),
      ),
    );
  }
}
