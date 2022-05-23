import 'package:flutter/material.dart';
import 'package:water_project/global_components/side_menu.dart';

class DetailsScreen extends StatefulWidget {
  static const id = "detailes screen";
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: SideMenu(),
          ),
          Expanded(flex: 8, child: Container())
        ],
      ),
    );
  }
}
