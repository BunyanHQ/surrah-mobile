import 'package:supabase_flutter/supabase_flutter.dart';

abstract class Failure {
  const Failure({
    required this.message,
  });

  final String message;
}

class SupabaseFailure extends Failure {
  const SupabaseFailure({
    required super.message,
    this.code,
  });

  final String? code;

  factory SupabaseFailure.fromException(Object error) {
    if (error is AuthException) {
      return SupabaseFailure(
        message: error.message,
        code: error.statusCode,
      );
    }

    if (error is PostgrestException) {
      return SupabaseFailure(
        message: error.message,
        code: error.code,
      );
    }

    if (error is StorageException) {
      return SupabaseFailure(
        message: error.message,
      );
    }

    return SupabaseFailure(
      message: error.toString(),
    );
  }
}