import 'auth_form.dart';
import 'reset_link_card.dart';
import 'package:flutter/material.dart';
import '../../manager/auth_cubit.dart';
import '../../manager/auth_states.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../core/utils/nav_to.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../../../core/widgets/custom_back_icon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SendResetLinkBody extends StatelessWidget {
  const SendResetLinkBody({super.key});

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    var formKey = GlobalKey<FormState>();
    return BlocBuilder<AuthCubit, AuthStates>(
      builder: (context, state) {
        var cubit = AuthCubit.get(context);
        return AuthForm(
          formKey: formKey,
          // Top
          topWidget: const _Top(),
          // Title
          title: s.sendResetLinkTitle,
          description: s.sendResetLinkSubtitle,
          // Email
          emailController: cubit.emailController,
          // Button
          buttonTitle: s.sendResetLinkButton,
          buttonLoading: state is SendResetLinkLoading,
          onButtonPressed: () => cubit.sendResetLink(formKey: formKey),
          // Back to Login
          actions: Column(
            children: [
              _SendSuccess(
                isSuccess:
                    state is SendResetLinkSuccess ||
                    state is ResendResetLinkSuccess,
              ),
              const _GoToHome(),
            ],
          ),
        );
      },
    );
  }
}

class _Top extends StatelessWidget {
  const _Top();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 12.h),
      child: Align(
        alignment: AlignmentDirectional.topEnd,
        child: const SafeArea(child: CustomBackIcon()),
      ),
    );
  }
}

class _GoToHome extends StatelessWidget {
  const _GoToHome();

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).primaryColor;
    return GestureDetector(
      onTap: () => NavTo.pop(context),
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
          CustomBackIcon(),
        ],
      ),
    );
  }
}

class _SendSuccess extends StatelessWidget {
  final bool isSuccess;
  const _SendSuccess({required this.isSuccess});

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 400),
      switchInCurve: Curves.easeOutBack,
      switchOutCurve: Curves.easeIn,
      transitionBuilder: (child, animation) {
        return FadeTransition(
          opacity: animation,
          child: SizeTransition(
            sizeFactor: animation,
            axisAlignment: -1,
            child: child,
          ),
        );
      },
      child: isSuccess
          ? Column(
              children: [
                const SuccessResetLinkCard(),
                SizedBox(height: 20.h),
                const _Resend(),
                SizedBox(height: 30.h),
              ],
            )
          : const SizedBox.shrink(),
    );
  }
}

class _Resend extends StatelessWidget {
  const _Resend();

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomText(
          text: s.resendResetLinkTitle,
          size: 17.sp,
          type: Type.overMedium,
        ),
        SizedBox(width: 5.w),
        GestureDetector(
          onTap: () => AuthCubit.get(context).resendResetLink(),
          child: CustomText(
            text: s.resendResetLinkButton,
            size: 17.sp,
            type: Type.overMedium,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ],
    );
  }
}
