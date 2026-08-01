import '../../../auth/data/models/profile_model.dart';

abstract class SetupStates {}

class SetupInitialState extends SetupStates {}

class SetupStepChanged extends SetupStates {}

// Currencies

class CurrencySelected extends SetupStates {}

class SalaryDaysUpdated extends SetupStates {}

class FetchingCurrenciesLoading extends SetupStates {}

class FetchingCurrenciesSuccess extends SetupStates {}

class FetchingCurrenciesFailure extends SetupStates {
  final String message;

  FetchingCurrenciesFailure({required this.message});
}

// Setup user profile

class SetupLoading extends SetupStates {}

class SetupSuccess extends SetupStates {
  final ProfileModel profile;
  SetupSuccess({required this.profile});
}

class SetupFailure extends SetupStates {
  final String message;

  SetupFailure({required this.message});
}
