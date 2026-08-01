
import 'generated/l10n.dart';
import 'core/di/server_locator.dart';
import 'package:flutter/material.dart';
import 'core/utils/my_bloc_observer.dart';
import 'features/splash/views/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'features/auth/presentation/manager/auth_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'features/setup/presentation/manager/setup_cubit.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  Bloc.observer = MyBlocObserver();
  await setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<AuthCubit>()),
        BlocProvider(create: (_) => getIt<SetupCubit>()),
        ],
      child: ScreenUtilInit(
        designSize: const Size(390, 884),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            localizationsDelegates: [
              S.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            home: const SplashView(),
          );
        },
      ),
    );
  }
}
