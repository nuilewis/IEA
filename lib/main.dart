import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:water_project/core/theme.dart';
import 'package:water_project/providers/flow_rate_data.dart';
import 'package:water_project/providers/sensor_data.dart';
import 'package:water_project/screens/auth_screens/login_screen.dart';
import 'package:water_project/screens/auth_screens/signup_screen.dart';
import 'package:water_project/screens/details_screen/details_screen.dart';
// import 'package:water_project/screens/maps_screen/maps_screen/core/theme.dart';
import 'package:water_project/screens/maps_screen/maps_screen.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final FirebaseDatabase database = FirebaseDatabase.instance;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<FlowRateData>(
            create: (context) => FlowRateData()),
        ChangeNotifierProvider<SensorData>(create: (context) => SensorData()),
      ],
      child: MaterialApp(
        scrollBehavior: MyCustomScrollBehavior(),
        theme: customLightTheme(context),
        debugShowCheckedModeBanner: false,
        home: const LoginScreen(),
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
