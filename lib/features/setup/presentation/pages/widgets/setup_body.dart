import 'setup_currency.dart';
import 'package:flutter/material.dart';
import '../../manager/setup_cubit.dart';
import '../../manager/setup_states.dart';
import '../../../../../generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/custom_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SetupBody extends StatelessWidget {
  const SetupBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SetupCubit, SetupStates>(
      builder: (context, state) {
        return Column(
          children: [
            Expanded(
              child: PageView(
                controller: SetupCubit.get(context).pageController,
                children: const [SetupCurrency()],
              ),
            ),
            _Bottom(),
          ],
        );
      },
    );
  }
}

class _Bottom extends StatelessWidget {
  const _Bottom();

  @override
  Widget build(BuildContext context) {
    var isRtl = Directionality.of(context) == TextDirection.rtl;
    var icon = isRtl ? Icons.arrow_back : Icons.arrow_forward;
    return Column(
      children: [
        CustomButton(
          icon: icon,
          label: S.of(context).continueButton,
          onPressed: () => SetupCubit.get(context).nextStep(),
        ),
        SizedBox(height: 20.h),
      ],
    );
  }
}
