import 'package:flutter/material.dart';
import '../../../../../core/widgets/custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthTitle extends StatelessWidget {
  final String title;
  final String description;
  const AuthTitle({super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _Title(title: title),
          _Description(description: description),
        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {
  final String title;
  const _Title({required this.title});

  @override
  Widget build(BuildContext context) {
    return CustomText(
      height: 1.9,
      text: title,
      size: 30.sp,
      type: Type.header,
      textAlign: TextAlign.center,
    );
  }
}

class _Description extends StatelessWidget {
  final String description;
  const _Description({required this.description});

  @override
  Widget build(BuildContext context) {
    return CustomText(
      size: 20.sp,
      maxLines: 3,
      text: description,
      type: Type.medium,
      textAlign: TextAlign.center,
      opacity: FontOpacity.medium,
    );
  }
}
