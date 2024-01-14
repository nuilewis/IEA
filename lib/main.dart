import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:provider/provider.dart';
import 'package:water_project/screens/auth_screens/login_screen.dart';
import 'package:water_project/screens/auth_screens/signup_screen.dart';
import 'package:water_project/screens/details_screen/details_screen.dart';
import 'package:water_project/screens/maps_screen/maps_screen.dart';

import 'firebase_options.dart';
import 'screens/add_project.dart';
import 'screens/projects_screen/proeject_screen.dart';

import 'services/services.dart';
import 'providers/providers.dart';
import 'repositories/repositories.dart';

import 'core/core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final ConnectionChecker connectionChecker =
      ConnectionCheckerImplementation(InternetConnectionCheckerPlus());

  ///Sensor Dependencies
  late final SensorRepository sensorRepository;

  final SensorFirestoreService _sensorFirestoreService =
      SensorFirestoreService();
  final SensorRealtimeDBService _sensorRealtimeDBService =
      SensorRealtimeDBService();

  ///Project Dependencies

  late final ProjectRepository projectRepository;
  final ProjectFirestoreService _projectFirestoreService =
      ProjectFirestoreService();

  ///Auth Dependencies
  ///
  late final AuthRepository authRepository;
  final AuthService authService = AuthService();

  @override
  void initState() {
    sensorRepository = SensorRepositoryImplementation(
        sensorFireStoreService: _sensorFirestoreService,
        sensorRealTimeDatabaseService: _sensorRealtimeDBService,
        connectionChecker: connectionChecker);

    projectRepository = ProjectRepositoryImplementation(
        projectFirestoreService: _projectFirestoreService,
        connectionChecker: connectionChecker);

    authRepository = AuthRepositoryImplementation(
        authService: authService, connectionChecker: connectionChecker);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SensorProvider>(
            create: (context) =>
                SensorProvider(sensorRepository: sensorRepository)),
        ChangeNotifierProvider<ProjectProvider>(
            create: (context) =>
                ProjectProvider(projectRepository: projectRepository)),
        ChangeNotifierProvider<AuthProvider>(
            create: (context) => AuthProvider(authRepository: authRepository)),
      ],
      child: Consumer<AuthProvider>(
        builder: (context, authData, child) {
          print("authentication state");
          print(authData.authState.toString());
          return MaterialApp(
            scrollBehavior: MyCustomScrollBehavior(),
            theme: customLightTheme(context),
            debugShowCheckedModeBanner: false,
            // initialRoute: authData.authState == AuthState.authenticated
            //     ? NavigationRailDrawer.id
            //     : LoginScreen.id,
            // initialRoute: "/",
            //   home: NavigationRailDrawer(),
            home: LoginScreen(),
            routes: {
              //"/": (context) => const NavigationRailDrawer(),
              DetailsScreen.id: (context) => const DetailsScreen(),
              LoginScreen.id: (context) => const LoginScreen(),
              SignUpScreen.id: (context) => const SignUpScreen(),
              MapsScreen.id: (context) => const MapsScreen(),
              AddProject.id: (context) => const AddProject(),
              ProjectScreen.id: (context) => const ProjectScreen(),
            },
          );
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
