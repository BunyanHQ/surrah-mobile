import 'package:flutter/material.dart';
import '../../../../../core/widgets/custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';

class AuthItem extends StatelessWidget {
  final String title;
  final String hint;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final Function()? suffixTap;
  final TextInputType keyboardType;
  final Function(String?) validator;
  final TextInputAction? textInputAction;
  const AuthItem({
    super.key,
    required this.title,
    required this.hint,
    required this.prefixIcon,
    this.suffixIcon,
    this.suffixTap,
    required this.keyboardType,
    required this.validator,
    this.textInputAction,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(text: title, size: 16.sp, type: Type.overMedium),
        SizedBox(height: 10.h),
        CustomTextFormField(
          hintText: hint,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          suffixTap: suffixTap,
          keyboardType: keyboardType,
          validator: (value) => validator(value),
          textInputAction: textInputAction ?? TextInputAction.next,
        ),
      ],
    );
  }
}
