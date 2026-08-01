import 'setup_states.dart';
import 'package:flutter/material.dart';
import '../../data/repo/setup_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:currency_picker/currency_picker.dart';
import '../../../auth/data/models/profile_model.dart';

class SetupCubit extends Cubit<SetupStates> {
  final SetupRepo setupRepo;
  SetupCubit({required this.setupRepo}) : super(SetupInitialState());
  static SetupCubit get(BuildContext context) => BlocProvider.of(context);

  Currency? selectedCurrency;
  int selectedSalaryDays = 30;
  List<Currency> currencies = [];
  PageController pageController = PageController(initialPage: 0);
  TextEditingController salaryController = TextEditingController();

  void nextStep() {
    if (pageController.page! < 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  Future<void> fetchCurrencies() async {
    emit(SetupLoading());
    try {
      currencies = CurrencyService().getAll();
      selectedCurrency = currencies.firstWhere(
        (currency) => currency.code == 'USD',
        orElse: () => currencies.first,
      );
      selectedCurrency = currencies.first;
      emit(FetchingCurrenciesSuccess());
    } catch (e) {
      emit(FetchingCurrenciesFailure(message: e.toString()));
    }
  }

  Future<void> selectCurrency(String code) async {
    selectedCurrency = currencies.firstWhere(
      (currency) => currency.code == code,
    );
    emit(CurrencySelected());
  }

  Future<void> updateSalaryDays(int days) async {
    selectedSalaryDays = days;
    emit(SalaryDaysUpdated());
  }

  Future<void> setupUserProfile({required ProfileModel profile}) async {
    emit(SetupLoading());
    final result = await setupRepo.setupUserProfile(profile: profile);
    result.fold(
      (failure) => emit(FetchingCurrenciesFailure(message: failure.message)),
      (profile) => emit(SetupSuccess(profile: profile)),
    );
  }
}
