import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'theme/app_theme.dart';
import 'utils/app_constants.dart';
import 'screens/auth/splash_screen.dart';
import 'screens/auth/onboarding_screen.dart';
import 'screens/auth/login_screen.dart';
import 'screens/home/main_shell.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Lock to portrait orientation
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Status bar style — light icons on dark bg for splash,
  // switch to dark for main app
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor:            Colors.transparent,
      statusBarIconBrightness:   Brightness.dark,
      systemNavigationBarColor:  Colors.white,
    ),
  );

  runApp(const CampusConnectApp());
}

class CampusConnectApp extends StatelessWidget {
  const CampusConnectApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:          AppStrings.appName,
      debugShowCheckedModeBanner: false,
      theme:          AppTheme.lightTheme,
      initialRoute:   AppRoutes.splash,
      routes: {
        AppRoutes.splash:      (_) => const SplashScreen(),
        AppRoutes.onboarding:  (_) => const OnboardingScreen(),
        AppRoutes.login:       (_) => const LoginScreen(),
        AppRoutes.home:        (_) => const MainShell(),
      },
    );
  }
}