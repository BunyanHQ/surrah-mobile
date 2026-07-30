import 'package:flutter/material.dart';
import '../../manager/auth_cubit.dart';
import '../../../../../const/assets.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../../../core/services/url_service.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SuccessResetLinkCard extends StatelessWidget {
  const SuccessResetLinkCard({super.key});

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    var cubit = AuthCubit.get(context);
    return GestureDetector(
      onTap: () => UrlService.openGmail(context: context),
      child: Card(
        elevation: 2,
        margin: EdgeInsets.zero,
        color: Theme.of(context).cardColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
        child: Padding(
          padding: EdgeInsetsDirectional.all(10.r),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _Image(imagePath: Assets.sendResetMailSuccess),
              SizedBox(width: 10.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _Title(title: s.sendResetLinkCardTitle),
                    _SubTitle(subTitle: s.sendResetLinkCardBody),
                    _EmailLink(email: cubit.resetEmailLink),
                  ],
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}

class _Image extends StatelessWidget {
  final String imagePath;

  const _Image({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Image.asset(
      imagePath,
      width: size.width * 0.23,
      height: size.width * 0.23,
      fit: BoxFit.contain,
    );
  }
}

class _Title extends StatelessWidget {
  final String title;

  const _Title({required this.title});

  @override
  Widget build(BuildContext context) {
    return CustomText(text: title, size: 18.sp, type: Type.header);
  }
}

class _SubTitle extends StatelessWidget {
  final String subTitle;

  const _SubTitle({required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return CustomText(text: subTitle, size: 14.sp, maxLines: 3);
  }
}

class _EmailLink extends StatelessWidget {
  final String email;

  const _EmailLink({required this.email});

  @override
  Widget build(BuildContext context) {
    return CustomText(
      height: 2,
      text: email,
      size: 16.sp,
      type: Type.overMedium,
      color: Theme.of(context).primaryColor,
    );
  }
}
