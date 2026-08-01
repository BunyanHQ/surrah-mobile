import 'setup_title.dart';
import 'package:flutter/material.dart';
import '../../manager/setup_cubit.dart';
import '../../manager/setup_states.dart';
import '../../../../../const/assets.dart';
import '../../../../../generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:country_flags/country_flags.dart';
import '../../../../../core/widgets/custom_text.dart';
import 'package:currency_picker/currency_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SetupCurrency extends StatelessWidget {
  const SetupCurrency({super.key});

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    return Column(
      spacing: 10.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SetupTitle(
          image: Assets.setupCurrencies,
          title: s.setYourCurrencyTitle,
          subTitle: s.setYourCurrencySubtitle,
        ),
        SizedBox(height: 5.h),
        CustomText(text: s.chooseCurrency, size: 19.sp, type: Type.overMedium),
        _Currencies(),
      ],
    );
  }
}

class _Currencies extends StatelessWidget {
  const _Currencies();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SetupCubit, SetupStates>(
      builder: (context, state) {
        var cubit = SetupCubit.get(context);
        return GestureDetector(
          onTap: () {
            showCurrencyPicker(
              context: context,
              showFlag: true,
              showCurrencyName: true,
              showCurrencyCode: true,
              showSearchField: true,
              favorite: const ['EGP', 'SAR', 'EUR', 'USD'],
              currencyFilter: CurrencyService()
                  .getAll()
                  .where((currency) => currency.code != 'ILS')
                  .map((currency) => currency.code)
                  .toList(),
              onSelect: (value) => cubit.selectCurrency(value.code),
            );
          },
          child: _SelectedCurrency(currency: cubit.selectedCurrency!),
        );
      },
    );
  }
}

class _SelectedCurrency extends StatelessWidget {
  final Currency currency;
  const _SelectedCurrency({required this.currency});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _boxDecoration,
      padding: EdgeInsets.all(12.r),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _ItemLeading(currency: currency),
          SizedBox(width: 10.w),
          Expanded(child: _ItemBody(currency: currency)),
          _ItemTrailing(),
        ],
      ),
    );
  }

  Decoration get _boxDecoration => BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(3.r),
    border: Border.all(width: 1.5.w, color: Colors.grey.shade300),
  );
}

class _ItemLeading extends StatelessWidget {
  final Currency currency;
  const _ItemLeading({required this.currency});

  @override
  Widget build(BuildContext context) {
    return CountryFlag.fromCurrencyCode(currency.code, theme: EmojiTheme());
  }
}

class _ItemBody extends StatelessWidget {
  final Currency currency;
  const _ItemBody({required this.currency});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: "${currency.code} ( ${currency.symbol} )",
          height: 1.2,
          size: 16.sp,
          type: Type.header,
        ),
        CustomText(
          height: 1.2,
          size: 16.sp,
          text: currency.name,
          type: Type.overMedium,
          opacity: FontOpacity.overLow,
        ),
      ],
    );
  }
}

class _ItemTrailing extends StatelessWidget {
  const _ItemTrailing();

  @override
  Widget build(BuildContext context) {
    return Icon(Icons.keyboard_arrow_down_rounded, size: 24.sp);
  }
}
