import '../../../../../const/assets.dart';
import '../widgets/setup_body.dart';
import 'package:flutter/material.dart';
import '../../manager/setup_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/di/server_locator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SetupView extends StatelessWidget {
  const SetupView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<SetupCubit>()..fetchCurrencies(),
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          decoration: BoxDecoration(
            image: const DecorationImage(
              opacity: 0.7,
              fit: BoxFit.fill,
              image: AssetImage(Assets.setupBackground),
            ),
          ),
          child: SetupBody(),
        ),
      ),
    );
  }
}
