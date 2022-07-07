import 'package:flutter/material.dart';

import '../details_screen/components/side_menu.dart';

class ListScreen extends StatelessWidget {
  static const id = "list screen";
  const ListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      children: [
        const Expanded(flex: 1, child: SideMenu()),
        Expanded(flex: 10, child: Container()),
      ],
    ));
  }
}
