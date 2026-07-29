import 'package:dartz/dartz.dart';
import '../models/profile_model.dart';
import '../../../../core/failure/failure.dart';

abstract class AuthRepo {
  Future<Either<Failure, ProfileModel>> register({
    required String email,
    required String password,
    required ProfileModel profile,
  });
  Future<Either<Failure, ProfileModel>> login({
    required String email,
    required String password,
  });
  Future<Either<Failure, void>> signOut();
}
