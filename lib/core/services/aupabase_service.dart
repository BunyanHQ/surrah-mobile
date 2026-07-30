import '../../const/supabase_data.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  final SupabaseClient _client;

  SupabaseService(this._client);

  // Register
  Future<AuthResponse> register({
    required String email,
    required String password,
    required Map<String, dynamic> profile,
  }) async {
    final response = await _client.auth.signUp(
      email: email,
      password: password,
    );
    final user = response.user;
    if (user == null) {
      throw Exception('Registration failed.');
    }
    await _client.from(SupabaseData.profilesCollection).insert({
      'id': user.id,
      ...profile,
    });
    return response;
  }

  // Login
  Future<PostgrestMap> login({
    required String email,
    required String password,
  }) async {
    var response = await _client.auth.signInWithPassword(
      email: email,
      password: password,
    );
    if (response.user == null) {
      throw Exception('Login failed.');
    }
    return await _client
        .from(SupabaseData.profilesCollection)
        .select()
        .eq('id', response.user!.id)
        .single();
  }

  // Send Reset Link
  Future<void> sendResetLink({required String email}) async {
    return await _client.auth.resetPasswordForEmail(
      email,
      redirectTo: 'surrah://reset-password',
    );
  }

  // Update Password
  Future<void> updatePassword({required String newPassword}) async {
    await _client.auth.updateUser(UserAttributes(password: newPassword));
  }

  Future<void> logout() async {
    await _client.auth.signOut();
  }
}
