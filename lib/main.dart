import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:water_project/Demo/DashBoard.dart';
import 'package:water_project/screens/details_screen.dart';
import 'package:firebase_database/firebase_database.dart';
import 'FirebaseCustom.dart';
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const DetailsScreen(),
      routes: {DetailsScreen.id: (context) => const DetailsScreen()},
    );
  }
}
