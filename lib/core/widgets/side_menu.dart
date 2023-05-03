import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// class SideMenu extends StatelessWidget {
//   const SideMenu({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     ThemeData theme = Theme.of(context);
//     return Drawer(
//       elevation: 20,
//       backgroundColor: theme.scaffoldBackgroundColor,
//       child: ListView(
//         children: [
//           const SizedBox(
//             height: kDefaultPadding2x * 3,
//           ),
//           CustomMenuItem(
//               title: "Your Projects",
//               svgSrc: "assets/svg/map_view.svg",
//               onPressed: () {
//                 Navigator.pushNamed(context, DetailsScreen.id);
//               }),
//           CustomMenuItem(
//               title: "Map View",
//               svgSrc: "assets/svg/map_view.svg",
//               onPressed: () {
//                 Navigator.pushNamed(context, DetailsScreen.id);
//               }),
//           CustomMenuItem(
//               title: "List View",
//               svgSrc: "assets/svg/list_view.svg",
//               onPressed: () {
//                 Navigator.pushNamed(context, DetailsScreen.id);
//               }),
//           CustomMenuItem(
//               isSelected: true,
//               title: "Details",
//               svgSrc: "assets/svg/details_outline_icon.svg",
//               onPressed: () {
//                 Navigator.pushNamed(context, DetailsScreen.id);
//               }),
//         ],
//       ),
//     );
//   }
// }
//
// void selectedItem(BuildContext context, int i) {
//   switch (i) {
//     case 0:
//       Navigator.of(context).push(
//         MaterialPageRoute(builder: (context) => const DetailsScreen()),
//       );
//       break;
//     case 1:
//       Navigator.of(context).push(
//         MaterialPageRoute(builder: (context) => const DetailsScreen()),
//       );
//   }
// }

// class People extends StatelessWidget {
//   const People({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const Text("field");
//   }
// }

class SideMenu extends StatefulWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int _selectedIndex = 0;

  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    setState(() {
      screenSize.width < 300 ? isExpanded = false : isExpanded = true;
    });
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            extended: isExpanded,

            ///If the rail is expanded, then show the labels, if not, then don't show the labels.
            labelType: isExpanded
                ? NavigationRailLabelType.all
                : NavigationRailLabelType.none,
            destinations: [
              NavigationRailDestination(
                icon: SvgPicture.asset(""),
                label: const Text("Home"),
              ),
              NavigationRailDestination(
                icon: SvgPicture.asset(""),
                label: const Text("Home 2"),
              ),
              NavigationRailDestination(
                icon: SvgPicture.asset(""),
                label: const Text("Home 3"),
              ),
            ],
            selectedIndex: 0,
            onDestinationSelected: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          )
        ],
      ),
    );
  }
}
