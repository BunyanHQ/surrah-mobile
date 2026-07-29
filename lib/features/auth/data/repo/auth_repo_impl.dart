import 'package:surrah/features/auth/data/database/auth_data.dart';

import 'auth_repo.dart';
import 'package:dartz/dartz.dart';
import '../models/profile_model.dart';
import '../../../../core/failure/failure.dart';

class AuthRepoImpl extends AuthRepo {
  final AuthData authData;
  AuthRepoImpl({required this.authData});

  @override
  Future<Either<Failure, ProfileModel>> register({
    required String email,
    required String password,
    required ProfileModel profile,
  }) async {
    try {
      final result = await authData.register(
        email: email,
        password: password,
        profile: profile.toJson(),
      );
      return Right(
        profile.copyWith(id: result.user?.id ?? '', emailAddress: email),
      );
    } catch (e) {
      return Left(SupabaseFailure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, ProfileModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      final result = await authData.login(email: email, password: password);
      var profile = ProfileModel.fromJson(emailAddress: email, json: result);
      return Right(profile);
    } catch (e) {
      return Left(SupabaseFailure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      final result = await authData.logout();
      return Right(result);
    } catch (e) {
      return Left(SupabaseFailure.fromException(e));
    }
  }
}
