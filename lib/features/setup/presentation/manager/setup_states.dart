import '../../../auth/data/models/profile_model.dart';

abstract class SetupStates {}

class SetupInitialState extends SetupStates {}

class SetupLoading extends SetupStates {}

class SetupSuccess extends SetupStates {
  final ProfileModel profile;
  SetupSuccess({required this.profile});
}

class SetupFailure extends SetupStates {
  final String message;

  SetupFailure({required this.message});
}
