import '../../const/supabase_data.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  SupabaseService._();
  static final SupabaseService instance = SupabaseService._();
  late final SupabaseClient _client;

  void init() {
    _client = SupabaseClient(
      dotenv.env['SUPABASE_URL']!,
      dotenv.env['SUPABASE_ANON_KEY']!,
    );
  }

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
    return await _client.from(SupabaseData.profilesCollection).select().eq('id', response.user!.id).single();
  }

  Future<void> logout() async {
    await _client.auth.signOut();
  }
}
