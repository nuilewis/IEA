import 'package:flutter/material.dart';
import 'package:water_project/Demo/DashBoard.dart';


import 'FirebaseCustom.dart';

void main() {
  FirebaseHelper.initDatabase();
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Dashboard()
  ));
}