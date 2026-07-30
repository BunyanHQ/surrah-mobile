import 'package:dartz/dartz.dart';
import '../../../../core/failure/failure.dart';
import '../../../auth/data/models/profile_model.dart';

abstract class SetupRepo {
  Future<Either<Failure, ProfileModel>> setupUserProfile({required ProfileModel profile});
}
