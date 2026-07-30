import '../../../../core/services/aupabase_service.dart';

class SetupData {
  final SupabaseService supabaseService;
  SetupData({required this.supabaseService});

  // Setup User Profile
  Future<void> setupUserProfile({required Map<String, dynamic> profile}) async {
    return await supabaseService.updateProfile(profile: profile);
  }
}
