import '../utils/nav_to.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBackIcon extends StatelessWidget {
  final double size;
  final Color? color;
  final VoidCallback? onTap;
  const CustomBackIcon({super.key, this.onTap, this.size = 24, this.color});

  @override
  Widget build(BuildContext context) {
    var isLtr = Directionality.of(context) == TextDirection.ltr;
    return GestureDetector(
      onTap: onTap ?? () => NavTo.pop(context),
      child: Transform.scale(
        scaleX: isLtr ? 1 : -1,
        child: Icon(
          Icons.arrow_back_ios_new,
          size: size.sp,
          color: color ?? Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
