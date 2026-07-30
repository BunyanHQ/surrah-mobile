import 'package:surrah/features/auth/data/database/auth_data.dart';

import 'auth_repo.dart';
import 'package:dartz/dartz.dart';
import '../models/profile_model.dart';
import '../../../../core/failure/failure.dart';

class AuthRepoImpl extends AuthRepo {
  final AuthData authData;
  AuthRepoImpl({required this.authData});

  @override
  Future<Either<Failure, ProfileModel>> autoLogin() async {
    try {
      final result = await authData.autoLogin();
      if (result.user == null || result.email == null) {
        return Left(SupabaseFailure(message: 'No user found.'));
      }
      var profile = ProfileModel.fromJson(
        emailAddress: result.email!,
        json: result.user!,
      );
      return Right(profile);
    } catch (e) {
      return Left(SupabaseFailure.fromException(e));
    }
  }

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
  Future<Either<Failure, void>> sendResetLink({required String email}) async {
    try {
      final result = await authData.sendResetLink(email: email);
      return Right(result);
    } catch (e) {
      return Left(SupabaseFailure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, void>> updatePassword({
    required String newPassword,
  }) async {
    try {
      final result = await authData.updatePassword(newPassword: newPassword);
      return Right(result);
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
