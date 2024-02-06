import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:provider/provider.dart' as old_provider;
import 'package:water_project/screens/projects/proeject_screen.dart';
import 'package:water_project/screens/projects/sensor_details_screen.dart';
import 'package:water_project/screens/widgets/navigation_rail.dart';
import 'firebase_options.dart';
import 'screens/auth/login_screen.dart';
import 'screens/auth/signup_screen.dart';
import 'screens/home/home_screen.dart';
import 'screens/maps/maps_screen.dart';
import 'screens/projects/add_project_screen.dart';
import 'services/services.dart';
import 'providers/providers.dart';
import 'repositories/repositories.dart';

import 'core/core.dart';

final ConnectionChecker _connectionChecker =
    ConnectionChecker(InternetConnection());

final AuthRepository authRepository = AuthRepository(
    authService: AuthService(), connectionChecker: _connectionChecker);
final ChangeNotifierProvider authProvider =
    ChangeNotifierProvider<AuthProvider>(
        (ref) => AuthProvider(authRepository: authRepository));

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        scrollBehavior: MyCustomScrollBehavior(),
        theme: AppThemeData.lightTheme,
        darkTheme: AppThemeData.darkTheme,
        themeMode: ThemeMode.light,
        debugShowCheckedModeBanner: false,
        home: const NavRailScreen(),
        routes: {
          SensorDetailsScreen.id: (context) => const SensorDetailsScreen(),
          HomeScreen.id: (context) => const HomeScreen(),
          LoginScreen.id: (context) => const LoginScreen(),
          SignUpScreen.id: (context) => const SignUpScreen(),
          MapsScreen.id: (context) => const MapsScreen(),
          AddProjectScreen.id: (context) => const AddProjectScreen(),
          ProjectScreen.id: (context) => const ProjectScreen(),
        },
      ),
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
