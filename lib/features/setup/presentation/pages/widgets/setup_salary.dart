import 'setup_title.dart';
import 'package:flutter/material.dart';
import '../../../../../const/assets.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../core/utils/validators.dart';
import '../../../../../core/widgets/custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';

class SetupSalary extends StatelessWidget {
  const SetupSalary({super.key});

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    var formKey = GlobalKey<FormState>();
    return Form(
      key: formKey,
      child: Column(
        spacing: 10.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SetupTitle(
            image: Assets.setupCurrencies,
            title: s.setYourSalaryTitle,
            subTitle: s.setYourSalarySubtitle,
          ),
          CustomText(text: s.salaryAmount, size: 19.sp, type: Type.overMedium),
          CustomTextFormField(
            hintText: s.salaryAmountHint,
            prefixIcon: Icons.attach_money,
            keyboardType: TextInputType.number,
            validator: (value) => Validators.number(value),
          ),
          // Salary Day
          CustomText(text: s.salaryDay, size: 19.sp, type: Type.overMedium),
          CustomTextFormField(
            hintText: s.salaryDayHint,
            prefixIcon: Icons.calendar_today,
            keyboardType: TextInputType.number,
            validator: (value) => Validators.number(value),
          ),
        ],
      )
    );
  }
}
