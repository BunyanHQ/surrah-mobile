import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/styles.dart';
import 'custom_text.dart';

class CustomDropDownMenu<T> extends StatelessWidget {
  final T? value;
  final List<T> items;
  final String? hintText;
  final ValueChanged<T?>? onChanged;
  final double? borderRadius;
  final Color? backgroundColor;

  /// Widget shown inside the dropdown menu.
  final Widget Function(T item)? itemBuilder;

  /// Widget shown after selecting an item.
  final List<Widget> Function(BuildContext context)? selectedItemBuilder;

  /// Used when itemBuilder is null.
  final String Function(T item)? itemTextBuilder;

  const CustomDropDownMenu({
    super.key,
    required this.value,
    required this.items,
    this.hintText,
    this.onChanged,
    this.borderRadius,
    this.backgroundColor,
    this.itemBuilder,
    this.selectedItemBuilder,
    this.itemTextBuilder,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final borderColor = theme.hintColor.withAlpha(50);

    return DropdownButtonFormField<T>(
      initialValue: value,
      isExpanded: true,
      alignment: Alignment.centerRight,
      selectedItemBuilder: selectedItemBuilder,
      decoration: InputDecoration(
        filled: true,
        fillColor: backgroundColor ?? theme.scaffoldBackgroundColor,
        border: _inputBorder(borderColor, borderRadius),
        enabledBorder: _inputBorder(borderColor, borderRadius),
        focusedBorder: _inputBorder(theme.primaryColor, borderRadius),
        contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      ),
      hint: _Text(item: hintText ?? 'Select'),
      icon: Icon(
        Icons.keyboard_arrow_down_rounded,
        color: theme.hintColor,
        size: 28.sp,
      ),
      items: items.map((item) {
        return DropdownMenuItem<T>(
          value: item,
          child:
              itemBuilder?.call(item) ??
              _Text(item: itemTextBuilder?.call(item) ?? item.toString()),
        );
      }).toList(),
      onChanged: onChanged,
      style: Styles.textStyle500.copyWith(
        fontSize: 16.sp,
        color: theme.hintColor,
      ),
    );
  }
}

class _Text extends StatelessWidget {
  final String item;

  const _Text({required this.item});

  @override
  Widget build(BuildContext context) {
    return CustomText(text: item, size: 16.sp, height: 1.3);
  }
}

OutlineInputBorder _inputBorder(Color color, double? radius) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(radius ?? 10.r),
    borderSide: BorderSide(color: color, width: 1),
  );
}
