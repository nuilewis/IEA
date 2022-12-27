import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:water_project/core/theme.dart';
import 'package:water_project/providers/sensor_provider.dart';
import 'package:water_project/repositories/sensor_repository.dart';
import 'package:water_project/screens/auth_screens/login_screen.dart';
import 'package:water_project/screens/auth_screens/signup_screen.dart';
import 'package:water_project/screens/details_screen/details_screen.dart';
import 'package:water_project/screens/maps_screen/maps_screen.dart';
import 'package:water_project/services/sensors/sensor_firestore_service.dart';
import 'package:water_project/services/sensors/sensor_realtime_db_service.dart';

import 'firebase_options.dart';

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
  final FirebaseDatabase database = FirebaseDatabase.instance;

  late final SensorRepository sensorRepository;

  final SensorFirestoreService _sensorFirestoreService =
      SensorFirestoreService();
  final SensorRealtimeDBService _sensorRealtimeDBService =
      SensorRealtimeDBService();

  @override
  void initState() {
    sensorRepository = SensorRepositoryImplementation(
        sensorFireStoreService: _sensorFirestoreService,
        sensorRealTimeDatabaseService: _sensorRealtimeDBService);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SensorProvider>(
            create: (context) =>
                SensorProvider(sensorRepository: sensorRepository)),
      ],
      child: MaterialApp(
        scrollBehavior: MyCustomScrollBehavior(),
        theme: customLightTheme(context),
        debugShowCheckedModeBanner: false,
        home: const DetailsScreen(),
        routes: {
          DetailsScreen.id: (context) => const DetailsScreen(),
          LoginScreen.id: (context) => const LoginScreen(),
          SignUpScreen.id: (context) => const SignUpScreen(),
          MapsScreen.id: (context) => const MapsScreen(),
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
