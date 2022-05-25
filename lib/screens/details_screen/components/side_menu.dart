import 'package:flutter/material.dart';
import 'package:water_project/screens/details_screen/details_screen.dart';

import 'custom_menu_item.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
       
          CustomMenuItem(
            title: "Map View",
            svgSrc: "assets/icons/map_view.svg",
            onPressed: () {
              
              Navigator.pushNamed(context, DetailsScreen.id);}
          ),
             CustomMenuItem(
            title: "List View",
            svgSrc: "assets/icons/list_view.svg",
            onPressed: () {
              
              Navigator.pushNamed(context, DetailsScreen.id);}
          ),
             CustomMenuItem(
            title: "Details",
            svgSrc: "assets/icons/list_view.svg",
            onPressed: () {
              
              Navigator.pushNamed(context, DetailsScreen.id);}
          ),
        ],
      ),
    );
  }
}

void selectedItem(BuildContext context, int i) {
  switch (i) {
    case 0:
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const DetailsScreen()),
      );
  }
}

// class People extends StatelessWidget {
//   const People({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const Text("field");
//   }
// }


