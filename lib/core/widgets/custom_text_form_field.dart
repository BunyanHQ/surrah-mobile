import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.controller,
    this.focusNode,
    this.initialValue,
    this.hintText,
    this.labelText,
    this.keyboardType,
    this.textInputAction,
    this.prefixIcon,
    this.suffixIcon,
    this.onPrefixIconTap,
    this.onSuffixIconTap,
    this.validator,
    this.onChanged,
    this.onFieldSubmitted,
    this.onSaved,
    this.onTap,
    this.obscureText = false,
    this.readOnly = false,
    this.enabled = true,
    this.autofocus = false,
    this.autocorrect = false,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.fillColor,
    this.border,
    this.contentPadding,
    this.style,
    this.hintStyle,
  });

  // Controller
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? initialValue;

  // Text
  final String? hintText;
  final String? labelText;

  // Input
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool obscureText;
  final bool readOnly;
  final bool enabled;
  final bool autofocus;
  final bool autocorrect;
  final int? minLines;
  final int? maxLines;
  final int? maxLength;

  // Icons
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final VoidCallback? onPrefixIconTap;
  final VoidCallback? onSuffixIconTap;

  // Callbacks
  final VoidCallback? onTap;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;

  // Appearance
  final Color? fillColor;
  final InputBorder? border;
  final EdgeInsetsGeometry? contentPadding;
  final TextStyle? style;
  final TextStyle? hintStyle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      initialValue: initialValue,

      keyboardType: keyboardType,
      textInputAction: textInputAction,
      obscureText: obscureText,
      readOnly: readOnly,
      enabled: enabled,
      autofocus: autofocus,
      autocorrect: autocorrect,
      minLines: minLines,
      maxLines: maxLines,
      maxLength: maxLength,

      onTap: onTap,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      onSaved: onSaved,
      validator: validator,

      style: style ?? _AppTextFieldStyle.input(context),

      decoration: InputDecoration(
        isDense: true,

        filled: true,
        fillColor: fillColor ?? theme.scaffoldBackgroundColor,

        hintText: hintText,
        labelText: labelText,
        hintStyle: hintStyle ?? _AppTextFieldStyle.hint(context),

        contentPadding: contentPadding ?? EdgeInsets.symmetric(vertical: 12.h),

        border: _border(context),
        enabledBorder: _border(context),
        errorBorder: _border(context, color: Colors.red),
        focusedBorder: _border(context, color: theme.primaryColor),
        focusedErrorBorder: _border(context, color: Colors.red),

        prefixIcon: _buildIcon(true, context, prefixIcon, onPrefixIconTap),
        suffixIcon: _buildIcon(false, context, suffixIcon, onSuffixIconTap),

        prefixIconConstraints: BoxConstraints.tightFor(
          width: 34.w,
          height: 35.h,
        ),

        suffixIconConstraints: BoxConstraints.tightFor(
          width: 34.w,
          height: 35.h,
        ),

        errorStyle: Styles.textStyle500.copyWith(
          color: Colors.red,
          fontSize: 14.sp,
        ),
      ),

      onTapOutside: (_) => FocusScope.of(context).unfocus(),
    );
  }

  InputBorder _border(BuildContext context, {Color? color}) {
    return border ??
        OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.r),
          borderSide: BorderSide(
            color: color ?? Theme.of(context).hintColor.withValues(alpha: .5),
            width: .5,
          ),
        );
  }

  Widget? _buildIcon(
    bool isPrefix,
    BuildContext context,
    IconData? icon,
    VoidCallback? onTap,
  ) {
    if (icon == null) return null;
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment:isPrefix ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Icon(icon, size: 23.sp, color: Theme.of(context).hintColor)
        ]
      ),
    );
  }
}

class _AppTextFieldStyle {
  static TextStyle hint(BuildContext context) {
    return Styles.textStyle700.copyWith(
      fontSize: 16.sp,
      color: Theme.of(context).hintColor.withValues(alpha: .5),
    );
  }

  static TextStyle input(BuildContext context) {
    return Styles.textStyle800.copyWith(
      fontSize: 18.sp,
      color: Theme.of(context).hintColor,
    );
  }
}
