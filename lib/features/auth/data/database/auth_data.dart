import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../../core/services/aupabase_service.dart';

class AuthData {
  final supabaseService = SupabaseService.instance;
  // Login
  Future<PostgrestMap> login({
    required String email,
    required String password,
  }) async {
    return await supabaseService.login(email: email, password: password);
  }

  // Register
  Future<AuthResponse> register({
    required String email,
    required String password,
    required Map<String, dynamic> profile,
  }) async {
    return await supabaseService.register(
      email: email,
      password: password,
      profile: profile,
    );
  }

  // Logout
  Future<void> logout() async {
    return await supabaseService.logout();
  }
}
