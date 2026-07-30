import 'package:dartz/dartz.dart';
import '../models/profile_model.dart';
import '../../../../core/failure/failure.dart';

abstract class AuthRepo {
  // Register
  Future<Either<Failure, ProfileModel>> register({
    required String email,
    required String password,
    required ProfileModel profile,
  });

  // Login
  Future<Either<Failure, ProfileModel>> login({
    required String email,
    required String password,
  });

  // Send Reset Link
  Future<Either<Failure, void>> sendResetLink({required String email});

  // Update Password
  Future<Either<Failure, void>> updatePassword({required String newPassword});

  // Logout
  Future<Either<Failure, void>> signOut();
}
