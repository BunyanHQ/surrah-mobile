import '../../../auth/data/models/profile_model.dart';
import 'setup_states.dart';
import '../../data/repo/setup_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SetupCubit extends Cubit<SetupStates> {
  final SetupRepo setupRepo;
  SetupCubit({required this.setupRepo}) : super(SetupInitialState());

  Future<void> setupUserProfile({required ProfileModel profile}) async {
    emit(SetupLoading());
    final result = await setupRepo.setupUserProfile(profile: profile);
    result.fold(
      (failure) => emit(SetupFailure(message: failure.message)),
      (profile) => emit(SetupSuccess(profile: profile)),
    );
  }
}
