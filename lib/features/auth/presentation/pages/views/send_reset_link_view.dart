import 'package:flutter/material.dart';
import '../../manager/auth_cubit.dart';
import '../../manager/auth_states.dart';
import '../../../../../generated/l10n.dart';
import '../widgets/send_reset_link_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/services/snack_bar_service.dart';

class SendResetLinkView extends StatelessWidget {
  const SendResetLinkView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthStates>(
      listener: (context, state) {
        if (state is SendResetLinkFailure) {
          SnackBarService.failure(context: context, message: state.error);
        } else if (state is ResendResetLinkFailure) {
          SnackBarService.failure(context: context, message: state.error);
        } else if (state is SendResetLinkSuccess) {
          SnackBarService.success(
            context: context,
            message: S.of(context).sendResetLinkSuccess,
          );
        } else if (state is ResendResetLinkSuccess) {
          SnackBarService.success(
            context: context,
            message: S.of(context).resendResetLinkSuccess,
          );
        }
      },
      child: Scaffold(body: SendResetLinkBody()),
    );
  }
}
