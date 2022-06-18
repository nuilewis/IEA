import 'package:flutter/material.dart';
import 'package:water_project/screens/details_screen/components/side_menu.dart';

class MapsScreen extends StatelessWidget {
  const MapsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      children: const [
        Expanded(flex: 1, child: SideMenu()),
        Expanded(flex: 10, child: Maps()),
      ],
    ));
  }
}

class Maps extends StatefulWidget {
  const Maps({Key? key}) : super(key: key);

  @override
  State<Maps> createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
