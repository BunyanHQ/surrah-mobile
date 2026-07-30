import 'package:get_it/get_it.dart';
import '../services/aupabase_service.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../../features/auth/data/repo/auth_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../features/setup/data/repo/setup_repo.dart';
import '../../features/auth/data/database/auth_data.dart';
import '../../features/auth/data/repo/auth_repo_impl.dart';
import '../../features/setup/data/database/setup_data.dart';
import '../../features/setup/data/repo/setup_repo_impl.dart';
import '../../features/auth/presentation/manager/auth_cubit.dart';
import '../../features/setup/presentation/manager/setup_cubit.dart';

var getIt = GetIt.instance;

Future<void> setupLocator() async {
  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL']!,
    publishableKey: dotenv.env['SUPABASE_ANON_KEY']!,
  );

  // Register SupabaseService
  getIt.registerLazySingleton<SupabaseService>(
    () => SupabaseService(Supabase.instance.client),
  );

  // Auth
  getIt.registerLazySingleton<AuthData>(
    () => AuthData(supabaseService: getIt<SupabaseService>()),
  );

  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(authData: getIt<AuthData>()),
  );

  getIt.registerLazySingleton<AuthCubit>(
    () => AuthCubit(authRepo: getIt<AuthRepo>()),
  );

  // Setup
  getIt.registerLazySingleton<SetupData>(
    () => SetupData(supabaseService: getIt<SupabaseService>()),
  );

  getIt.registerLazySingleton<SetupRepo>(
    () => SetupRepoImpl(setupData: getIt<SetupData>()),
  );

  getIt.registerLazySingleton<SetupCubit>(
    () => SetupCubit(setupRepo: getIt<SetupRepo>()),
  );
}
