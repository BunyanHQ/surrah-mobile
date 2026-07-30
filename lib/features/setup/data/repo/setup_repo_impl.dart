import 'setup_repo.dart';
import 'package:dartz/dartz.dart';
import '../database/setup_data.dart';
import '../../../../core/failure/failure.dart';
import '../../../auth/data/models/profile_model.dart';

class SetupRepoImpl extends SetupRepo {
  final SetupData setupData;

  SetupRepoImpl({required this.setupData});

  @override
  Future<Either<Failure, ProfileModel>> setupUserProfile({
    required ProfileModel profile,
  }) async {
    try {
      await setupData.setupUserProfile(profile: profile.toJson());
      return Right(profile);
    } catch (e) {
      return Left(SupabaseFailure(message: e.toString()));
    }
  }
}
