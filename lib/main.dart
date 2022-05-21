import 'package:flutter/material.dart';
import 'package:water_project/Demo/DashBoard.dart';

import 'FirebaseCustom.dart';

void main() {
  FirebaseHelper.initDatabase();
  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Dashboard(););
  }
}
