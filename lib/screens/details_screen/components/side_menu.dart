import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:water_project/constants.dart';
import 'package:water_project/screens/details_screen/details_screen.dart';

import 'custom_menu_item.dart';

class SideMenu extends StatelessWidget {
 const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Drawer(
      elevation: 20,
      
    backgroundColor: theme.scaffoldBackgroundColor,
      child: ListView(
        children: [
       const SizedBox(height: kDefaultPadding2x*3,),
          CustomMenuItem(
            
            title: "Map View",
            svgSrc: "assets/svg/map_view.svg",
            onPressed: () {
              
              Navigator.pushNamed(context, DetailsScreen.id);}
          ),
             CustomMenuItem(
            title: "List View",
            svgSrc: "assets/svg/list_view.svg",
            onPressed: () {
              
              Navigator.pushNamed(context, DetailsScreen.id);}
          ),
             CustomMenuItem(
               isSelected: true,
            title: "Details",
            svgSrc: "assets/svg/details_outline_icon.svg",
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


